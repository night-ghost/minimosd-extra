// -*- tab-width: 4; Mode: C++; c-basic-offset: 4; indent-tabs-mode: t -*-
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
//      version 2.1 of the License, or (at your option) any later
//      version.
//
//      This library is distributed in the hope that it will be
//      useful, but WITHOUT ANY WARRANTY; without even the implied
//      warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
//      PURPOSE.  See the GNU Lesser General Public License for more
//      details.
//
//      You should have received a copy of the GNU Lesser General
//      Public License along with this library; if not, write to the
//      Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
//      Boston, MA 02110-1301 USA
//

//
// Note that this library does not pre-declare drivers for serial
// ports; the user must explicitly create drivers for the ports they
// wish to use.  This is less friendly than the stock Arduino driver,
// but it saves a few bytes of RAM for every unused port and frees up
// the vector for another driver (e.g. MSPIM on USARTs).
//

#ifndef SingleSerial_h
#define SingleSerial_h

// disable the stock Arduino serial driver
#ifdef HardwareSerial_h
# error Must include SingleSerial.h before the Arduino serial driver is defined.
#endif
#define HardwareSerial_h

#include <inttypes.h>
#include <stdlib.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#include "./BetterStream.h"


/// @file	SingleSerial.h
/// @brief	An enhanced version of the Arduino HardwareSerial class
///			implementing interrupt-driven transmission and flexible
///			buffer management.
///
/// Because Arduino libraries aren't really libraries, but we want to
/// only define interrupt handlers for serial ports that are actually
/// used, we have to force our users to define them using a macro.
///
/// SingleSerialPort(<port name>)
///
/// <port name> is the name of the object that will be created by the
/// macro.

///	@name	Compatibility
///
/// Forward declarations for clients that want to assume that the
/// default Serial* objects exist.
///
/// Note that the application is responsible for ensuring that these
/// actually get defined, otherwise Arduino will suck in the
/// HardwareSerial library and linking will fail.
//@{
extern class SingleSerial Serial;
//@}

/// The SingleSerial class definition
///

class SingleSerial: public BetterStream {
public:

	/// Constructor
	SingleSerial();

	/// @name 	Serial API
    //@{
//	virtual void begin(long baud);
	virtual void end(void);
	virtual uint8_t available(void);
	virtual uint8_t txspace(void);
	virtual uint8_t read(void);
	virtual uint8_t peek(void);
	virtual void flush(void);
#if defined(ARDUINO) && ARDUINO >= 100
	virtual size_t write(uint8_t c);
#else
	virtual void write(uint8_t c);
#endif
	using BetterStream::write;
    //@}

	/// Extended port open method
	///
	/// Allows for both opening with specified buffer sizes, and re-opening
	/// to adjust a subset of the port's settings.
	///
	/// @note	Buffer sizes greater than ::_max_buffer_size will be rounded
	///			down.
	///
	/// @param	baud		Selects the speed that the port will be
	///						configured to.  If zero, the port speed is left
	///						unchanged.
	/// @param rxSpace		Sets the receive buffer size for the port.  If zero
	///						then the buffer size is left unchanged if the port
	///						is open, or set to ::_default_rx_buffer_size if it is
	///						currently closed.
	/// @param txSpace		Sets the transmit buffer size for the port.  If zero
	///						then the buffer size is left unchanged if the port
	///						is open, or set to ::_default_tx_buffer_size if it
	///						is currently closed.
	///
//	virtual void begin(long baud, unsigned int rxSpace, unsigned int txSpace);

	void begin(long baud, uint8_t *rxBuf, uint8_t rxMask, uint8_t *txBuf, uint8_t txMask);

	/// Transmit/receive buffer descriptor.
	///
	/// Public so the interrupt handlers can see it
	struct Buffer {
		volatile uint16_t head, tail;	///< head and tail pointers
		uint16_t mask;					///< buffer size mask for pointer wrap
		uint8_t *bytes;					///< pointer to allocated buffer
	};

	/// Tell if the serial port has been initialized
/*	static bool getInitialized(uint8_t port) {
		return (1<<port) & _serialInitialized;
	}
*/
	// ask for writes to be blocking or non-blocking
	static void set_blocking_writes(bool blocking) {
		_nonblocking_writes = !blocking;
	}

	// ring buffers
	static Buffer			_rxBuffer;
	static Buffer			_txBuffer;

private:

	/// Bit mask for initialized ports
//	static uint8_t _serialInitialized;

	/// Set if the serial port has been initialized
/*	static void setInitialized(uint8_t port) {
		_serialInitialized |= (1<<port);
	}
*/

	static bool 			_open;

	// whether writes to the port should block waiting
	// for enough space to appear
	static bool			_nonblocking_writes;

	/// default receive buffer size
//	static const uint8_t	_default_rx_buffer_size = 128;
#define _default_rx_buffer_size  128

	/// default transmit buffer size
//	static const uint8_t	_default_tx_buffer_size = 16;

#define _default_tx_buffer_size 16

	/// maxium tx/rx buffer size
	/// @note if we could bring the max size down to 256, the mask and head/tail
	///       pointers in the buffer could become uint8_t.
	///
//	static const unsigned int	_max_buffer_size = 256;
#define _max_buffer_size  256
};

// Used by the per-port interrupt vectors
//extern SingleSerial::Buffer __SingleSerial__rxBuffer;
//extern SingleSerial::Buffer __SingleSerial__txBuffer;


///
/// Macro defining a SingleSerial port instance.
///
#define SingleSerialPort(_name)  SingleSerial _name();   SingleSerialHandler(USART0_RX_vect, USART0_UDRE_vect, UDR0, UCSR0B, _BV(UDRIE0))

#define SingleSerialPort_x(_name)   SingleSerialHandler(USART0_RX_vect, USART0_UDRE_vect, UDR0, UCSR0B, _BV(UDRIE0))


/// Generic Rx/Tx vectors for a serial port - needs to know magic numbers
///
#define SingleSerialHandler( _RXVECTOR, _TXVECTOR, _UDR, _UCSRB, _TXBITS) \
ISR(_RXVECTOR, ISR_BLOCK)                                               \
{                                                                       \
        uint8_t c;                                                      \
        uint16_t i;                                                      \
                                                                        \
        /* read the byte as quickly as possible */                      \
        c = _UDR;                                                       \
        /* work out where the head will go next */                      \
        i = (SingleSerial::_rxBuffer.head + 1) & SingleSerial::_rxBuffer.mask; \
        /* decide whether we have space for another byte */             \
        if (i != SingleSerial::_rxBuffer.tail) {                  \
            /* we do, move the head */                              \
            SingleSerial::_rxBuffer.bytes[SingleSerial::_rxBuffer.head] = c; \
            SingleSerial::_rxBuffer.head = i;                 \
        }                                                     \
/*        else    digitalWrite(LEDPIN, !digitalRead(LEDPIN));  */ \
}                                                                       \
ISR(_TXVECTOR, ISR_BLOCK)                                               \
{                                                                       \
        /* if there is another character to send */                     \
        if (SingleSerial::_txBuffer.tail != SingleSerial::_txBuffer.head) { \
                _UDR = SingleSerial::_txBuffer.bytes[SingleSerial::_txBuffer.tail]; \
                /* increment the tail */                                \
                SingleSerial::_txBuffer.tail =                    \
                        (SingleSerial::_txBuffer.tail + 1) & SingleSerial::_txBuffer.mask; \
        } else {                                                        \
                /* there are no more bytes to send, disable the interrupt */ \
                if (SingleSerial::_txBuffer.head == SingleSerial::_txBuffer.tail) \
                        _UCSRB &= ~_TXBITS;                             \
        }                                                               \
}                                                                       \
struct hack

//
// Portability; convert various older sets of defines for U(S)ART0 up
// to match the definitions for the 1280 and later devices.
//
#if !defined(USART0_RX_vect)
# if defined(USART_RX_vect)
#  define USART0_RX_vect        USART_RX_vect
#  define USART0_UDRE_vect      USART_UDRE_vect
# elif defined(UART0_RX_vect)
#  define USART0_RX_vect        UART0_RX_vect
#  define USART0_UDRE_vect      UART0_UDRE_vect
# endif
#endif


#if !defined(UDR0)
# if defined(UDR)
#  define UDR0                  UDR
#  define UBRR0H                UBRRH
#  define UBRR0L                UBRRL
#  define UCSR0A                UCSRA
#  define UCSR0B                UCSRB
#  define U2X0                  U2X
#  define RXEN0                 RXEN
#  define TXEN0                 TXEN
#  define RXCIE0                RXCIE
#  define UDRIE0                UDRIE
# endif
#endif



#endif // SingleSerial_h
