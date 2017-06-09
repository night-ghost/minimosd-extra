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


#include "FastSerial.h"


FastSerial::Buffer __FastSerial__rxBuffer[FS_MAX_PORTS];
FastSerial::Buffer __FastSerial__txBuffer[FS_MAX_PORTS];
uint8_t FastSerial::_serialInitialized = 0;

// Constructor /////////////////////////////////////////////////////////////////

FastSerial::FastSerial(const uint8_t portNumber, volatile uint8_t *ubrrh, volatile uint8_t *ubrrl,
					   volatile uint8_t *ucsra, volatile uint8_t *ucsrb, const uint8_t u2x,
					   const uint8_t portEnableBits, const uint8_t portTxBits) :
					   _ubrrh(ubrrh),
					   _ubrrl(ubrrl),
					   _ucsra(ucsra),
					   _ucsrb(ucsrb),
					   _u2x(u2x),
					   _portEnableBits(portEnableBits),
					   _portTxBits(portTxBits),
					   _rxBuffer(&__FastSerial__rxBuffer[portNumber]),
					   _txBuffer(&__FastSerial__txBuffer[portNumber])
{
	setInitialized(portNumber);

        _rxBuffer->bytes  = _rxBytes;
        _txBuffer->bytes  = _txBytes;
}

// Public Methods //////////////////////////////////////////////////////////////


void FastSerial::begin(long baud)
{
	uint16_t ubrr;
	bool use_u2x = true;

	// if we are currently open...
	if (_open) {
		end();
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

void FastSerial::end()
{
	*_ucsrb &= ~(_portEnableBits | _portTxBits);

	_open = false;
}

uint8_t FastSerial::available(void)
{
	if (!_open)
		return 0;
	return (_rxBuffer->head - _rxBuffer->tail) & (SERIAL_RX_BUFFER_SIZE -1);
}

uint8_t FastSerial::txspace(void)
{
	if (!_open)
		return 0;
	return (_txBuffer->mask+1) - ((_txBuffer->head - _txBuffer->tail) & (SERIAL_TX_BUFFER_SIZE -1));
}

uint8_t FastSerial::read(void)
{
	uint8_t c;

	// if the head and tail are equal, the buffer is empty
	if (!_open || (_rxBuffer->head == _rxBuffer->tail))
		return 0;

	// pull character from tail
	c = _rxBuffer->bytes[_rxBuffer->tail];
	_rxBuffer->tail = (_rxBuffer->tail + 1) & (SERIAL_RX_BUFFER_SIZE -1);

	return c;
}

uint8_t FastSerial::peek(void)
{

	// if the head and tail are equal, the buffer is empty
	if (!_open || (_rxBuffer->head == _rxBuffer->tail))
		return 0;

	// pull character from tail
	return (_rxBuffer->bytes[_rxBuffer->tail]);
}

void FastSerial::wait(void){
    while (_txBuffer->tail != _txBuffer->head);
}

void FastSerial::flush(void)
{

    // wait for transmission end
        uint32_t t=millis();
        while(((_txBuffer->head - _txBuffer->tail) & (SERIAL_TX_BUFFER_SIZE -1)) ){
            if(millis()-t >300) break;
            delay(1);
        }


	// don't reverse this or there may be problems if the RX interrupt
	// occurs after reading the value of _rxBuffer->head but before writing
	// the value to _rxBuffer->tail; the previous value of head
	// may be written to tail, making it appear as if the buffer
	// don't reverse this or there may be problems if the RX interrupt
	// occurs after reading the value of head but before writing
	// the value to tail; the previous value of rx_buffer_head
	// may be written to tail, making it appear as if the buffer
	// were full, not empty.
	_rxBuffer->head = _rxBuffer->tail;

	// don't reverse this or there may be problems if the TX interrupt
	// occurs after reading the value of _txBuffer->tail but before writing
	// the value to _txBuffer->head.
	_txBuffer->tail = _txBuffer->head;
}

size_t FastSerial::write(uint8_t c)
{
	uint8_t i;

	if (!_open) // drop bytes if not open
		return 0;

	// wait for room in the tx buffer
	i = (_txBuffer->head + 1) & (SERIAL_TX_BUFFER_SIZE -1);

	// if the port is set into non-blocking mode, then drop the byte
	// if there isn't enough room for it in the transmit buffer
	if (_nonblocking_writes && i == _txBuffer->tail) {
		return 0;
	}

	while (i == _txBuffer->tail)
		;

	// add byte to the buffer
	_txBuffer->bytes[_txBuffer->head] = c;
	_txBuffer->head = i;

	// enable the data-ready interrupt, as it may be off if the buffer is empty
	*_ucsrb |= _portTxBits;

	// return number of bytes written (always 1)
	return 1;
}

