// -*-  tab-width: 4; Mode: C++; c-basic-offset: 4; indent-tabs-mode: t -*-
//
// Interrupt-driven serial transmit/receive library.
//
//      Copyright (c) 2010 Michael Smith. All rights reserved.
//
// Receive and baudrate calculations derived from the Arduino
// HardwareSerial driver:
//
//      Copyright (c) 2006 Nicholas Zambetti.  All right reserved.
//
// Transmit algorithm inspired by work:
//
//      Code Jose Julio and Jordi Munoz. DIYDrones.com
//
//      This library is free software; you can redistribute it and/or
//      modify it under the terms of the GNU Lesser General Public
//      License as published by the Free Software Foundation; either
//      version 2.1 of the License, or (at your option) any later version.
//
//      This library is distributed in the hope that it will be useful,
//      but WITHOUT ANY WARRANTY; without even the implied warranty of
//      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//      Lesser General Public License for more details.
//
//      You should have received a copy of the GNU Lesser General Public
//      License along with this library; if not, write to the Free Software
//      Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
//


//#include "../AP_Common/AP_Common.h"
#include "SingleSerial.h"

#if defined(ARDUINO) && ARDUINO >= 100
	#include "Arduino.h"
#else
	#include "WProgram.h"
#endif


# define FS_MAX_PORTS   1

//SingleSerial::Buffer __SingleSerial__rxBuffer;
//SingleSerial::Buffer __SingleSerial__txBuffer;
//uint8_t SingleSerial::_serialInitialized = 0;


//SingleSerial::Buffer * const SingleSerial::_rxBuffer = &__SingleSerial__rxBuffer;
//SingleSerial::Buffer * const SingleSerial::_txBuffer = &__SingleSerial__txBuffer;

SingleSerial::Buffer SingleSerial::_rxBuffer;
SingleSerial::Buffer SingleSerial::_txBuffer;

bool SingleSerial::_open;
bool SingleSerial::_nonblocking_writes;


// Constructor /////////////////////////////////////////////////////////////////

SingleSerial::SingleSerial() 
{
//	setInitialized(0);
//	begin(57600);
}

// Public Methods //////////////////////////////////////////////////////////////
/*
void SingleSerial::begin(long baud)
{
	begin(baud, 0, 0);
}

void SingleSerial::begin(long baud, unsigned int rxSpace, unsigned int txSpace)
{
	uint16_t ubrr;
	bool use_u2x = true;

	// if we are currently open...
	if (_open) {
		// If the caller wants to preserve the buffer sizing, work out what
		// it currently is...
		if (0 == rxSpace)
			rxSpace = _rxBuffer->mask + 1;
		if (0 == txSpace)
			txSpace = _txBuffer->mask + 1;

		// close the port in its current configuration, clears _open
		end();
	}

	// allocate buffers
	if (!_allocBuffer(_rxBuffer, rxSpace ? : _default_rx_buffer_size) || !_allocBuffer(_txBuffer, txSpace ?	: _default_tx_buffer_size)) {
		end();
		return; // couldn't allocate buffers - fatal
	}

	// reset buffer pointers
	_txBuffer->head = _txBuffer->tail = 0;
	_rxBuffer->head = _rxBuffer->tail = 0;

	// mark the port as open
	_open = true;

	// If the user has supplied a new baud rate, compute the new UBRR value.
	if (baud > 0) {
#if F_CPU == 16000000UL
		// hardcoded exception for compatibility with the bootloader shipped
		// with the Duemilanove and previous boards and the firmware on the 8U2
		// on the Uno and Mega 2560.
		if (baud == 57600)
			use_u2x = false;
#endif

		if (use_u2x) {
			*_ucsra = 1 << _u2x;
			ubrr = (F_CPU / 4 / baud - 1) / 2;
		} else {
			*_ucsra = 0;
			ubrr = (F_CPU / 8 / baud - 1) / 2;
		}

		*_ubrrh = ubrr >> 8;
		*_ubrrl = ubrr;
	}

	*_ucsrb |= _portEnableBits;
}
*/
void SingleSerial::begin(long baud, uint8_t *rxBuf, uint8_t rxMask, uint8_t *txBuf, uint8_t txMask)
{
	uint16_t ubrr;
	bool use_u2x = true;

	// if we are currently open...
	if (_open) {
		end();
	}

	_rxBuffer.mask = rxMask-1; _rxBuffer.bytes = rxBuf;
	_txBuffer.mask = txMask-1; _txBuffer.bytes = txBuf;

	// reset buffer pointers
	_txBuffer.head = _txBuffer.tail = 0;
	_rxBuffer.head = _rxBuffer.tail = 0;

	// mark the port as open
	_open = true;

	// If the user has supplied a new baud rate, compute the new UBRR value.
	if (baud > 0) {
#if F_CPU == 16000000UL
		// hardcoded exception for compatibility with the bootloader shipped
		// with the Duemilanove and previous boards and the firmware on the 8U2
		// on the Uno and Mega 2560.
		if (baud == 57600)
			use_u2x = false;
#endif

		if (use_u2x) {
			UCSR0A = 1 << U2X0;
			ubrr = (F_CPU / 4 / baud - 1) / 2;
		} else {
			UCSR0A = 0;
			ubrr = (F_CPU / 8 / baud - 1) / 2;
		}

		UBRR0H = ubrr >> 8;
		UBRR0L = ubrr;
	}

	UCSR0B |= (_BV(RXEN0) |  _BV(TXEN0) | _BV(RXCIE0));
}

void SingleSerial::end()
{
	UCSR0B &= ~((_BV(RXEN0) |  _BV(TXEN0) | _BV(RXCIE0)) | _BV(UDRIE0));

//	_freeBuffer(_rxBuffer);
//	_freeBuffer(_txBuffer);
	_open = false;
}

uint8_t SingleSerial::available(void)
{
	if (!_open)
		return (0);
	return ((_rxBuffer.head - _rxBuffer.tail) & _rxBuffer.mask);
}
/*
uint8_t SingleSerial::txspace(void)
{
	if (!_open)
		return (0);
	return ((_txBuffer.mask+1) - ((_txBuffer.head - _txBuffer.tail) & _txBuffer.mask));
}
*/
uint8_t SingleSerial::read(void)
{
	uint8_t c;

	// if the head and tail are equal, the buffer is empty
	if (!_open || (_rxBuffer.head == _rxBuffer.tail))
		return (0);

	// pull character from tail
	c = _rxBuffer.bytes[_rxBuffer.tail];
	_rxBuffer.tail = (_rxBuffer.tail + 1) & _rxBuffer.mask;

//	digitalWrite(A1, !digitalRead(A1));

	return (c);
}

uint8_t SingleSerial::peek(void)
{

	// if the head and tail are equal, the buffer is empty
	if (!_open || (_rxBuffer.head == _rxBuffer.tail))
		return (-1);

	// pull character from tail
	return (_rxBuffer.bytes[_rxBuffer.tail]);
}

void SingleSerial::flush(void)
{
	// don't reverse this or there may be problems if the RX interrupt
	// occurs after reading the value of _rxBuffer->head but before writing
	// the value to _rxBuffer->tail; the previous value of head
	// may be written to tail, making it appear as if the buffer
	// don't reverse this or there may be problems if the RX interrupt
	// occurs after reading the value of head but before writing
	// the value to tail; the previous value of rx_buffer_head
	// may be written to tail, making it appear as if the buffer
	// were full, not empty.
	_rxBuffer.head = _rxBuffer.tail;

	// don't reverse this or there may be problems if the TX interrupt
	// occurs after reading the value of _txBuffer->tail but before writing
	// the value to _txBuffer->head.
	_txBuffer.tail = _txBuffer.head;
}

#if defined(ARDUINO) && ARDUINO >= 100
size_t SingleSerial::write(uint8_t c)
{
	uint8_t i;

	if (!_open) // drop bytes if not open
		return 0;

	// wait for room in the tx buffer
	i = (_txBuffer.head + 1) & _txBuffer.mask;

	// if the port is set into non-blocking mode, then drop the byte
	// if there isn't enough room for it in the transmit buffer
	if (_nonblocking_writes && i == _txBuffer.tail) {
		return 0;
	}

	while (i == _txBuffer.tail)
		;

	// add byte to the buffer
	_txBuffer.bytes[_txBuffer.head] = c;
	_txBuffer.head = i;

	// enable the data-ready interrupt, as it may be off if the buffer is empty
	UCSR0B |= _BV(UDRIE0);

	// return number of bytes written (always 1)
	return 1;
}
#else
void SingleSerial::write(uint8_t c)
{
	uint8_t i;

	if (!_open) // drop bytes if not open
		return;

	// wait for room in the tx buffer
	i = (_txBuffer.head + 1) & _txBuffer.mask;
	while (i == _txBuffer.tail)
		;

	// add byte to the buffer
	_txBuffer.bytes[_txBuffer.head] = c;
	_txBuffer.head = i;

	// enable the data-ready interrupt, as it may be off if the buffer is empty
	UCSR0B |= _BV(UDRIE0));
}
#endif


void serialEventRun(void){}
