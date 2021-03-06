;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Jul 11 2014) (Linux)
; This file was generated Sun Feb 11 11:38:08 2018
;--------------------------------------------------------
	.module se8r01_receive_car
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _Init_Tim2
	.globl _SE8R01_Init
	.globl _SE8R01_Analog_Init
	.globl _SE8R01_Calibration
	.globl _rf_switch_bank
	.globl _init_io
	.globl _InitializeUART
	.globl _print_UCHAR_hex
	.globl _UARTPrintF
	.globl _delay
	.globl _InitializeSystemClock
	.globl _InitializeSPI
	.globl _read_spi_buf
	.globl _write_spi_buf
	.globl _read_spi_reg
	.globl _write_spi_reg
	.globl _write_spi
	.globl _delayTenMicro
	.globl _memset
	.globl _tx_buf
	.globl _rx_buf
	.globl _ADDRESS0
	.globl _ADDRESS1
	.globl _ADDRESS5
	.globl _ADDRESS4
	.globl _ADDRESS3
	.globl _ADDRESS2
	.globl _TX_ADDRESS
	.globl _status
	.globl _pip
	.globl _signal_lv
	.globl _newdata
	.globl _pload_width_now
	.globl _SE8R01_DR_500K
	.globl _SE8R01_DR_1M
	.globl _SE8R01_DR_2M
	.globl _myData_pip4
	.globl _myData_pip5
	.globl _gtemp
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
_gtemp::
	.ds 5
_myData_pip5::
	.ds 5
_myData_pip4::
	.ds 5
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
_SE8R01_DR_2M::
	.ds 2
_SE8R01_DR_1M::
	.ds 2
_SE8R01_DR_500K::
	.ds 2
_pload_width_now::
	.ds 2
_newdata::
	.ds 2
_signal_lv::
	.ds 1
_pip::
	.ds 2
_status::
	.ds 1
_TX_ADDRESS::
	.ds 4
_ADDRESS2::
	.ds 1
_ADDRESS3::
	.ds 1
_ADDRESS4::
	.ds 1
_ADDRESS5::
	.ds 1
_ADDRESS1::
	.ds 4
_ADDRESS0::
	.ds 4
_rx_buf::
	.ds 32
_tx_buf::
	.ds 32
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	se8r01-receive-car.c: 53: void delayTenMicro (void) {
;	-----------------------------------------
;	 function delayTenMicro
;	-----------------------------------------
_delayTenMicro:
;	se8r01-receive-car.c: 55: for (a = 0; a < 50; ++a)
	ld	a, #0x32
00104$:
;	se8r01-receive-car.c: 56: __asm__("nop");
	nop
	dec	a
;	se8r01-receive-car.c: 55: for (a = 0; a < 50; ++a)
	tnz	a
	jrne	00104$
	ret
;	se8r01-receive-car.c: 58: UCHAR write_spi (UCHAR value) {
;	-----------------------------------------
;	 function write_spi
;	-----------------------------------------
_write_spi:
;	se8r01-receive-car.c: 60: delayTenMicro ();
	call	_delayTenMicro
;	se8r01-receive-car.c: 61: SPI_DR = value;
	ldw	x, #0x5204
	ld	a, (0x03, sp)
	ld	(x), a
;	se8r01-receive-car.c: 62: delayTenMicro ();
	call	_delayTenMicro
;	se8r01-receive-car.c: 63: while ((SPI_SR & TXE) == 0);
00101$:
	ldw	x, #0x5203
	ld	a, (x)
	bcp	a, #0x02
	jreq	00101$
;	se8r01-receive-car.c: 64: delayTenMicro ();
	call	_delayTenMicro
;	se8r01-receive-car.c: 65: while ((SPI_SR & RXNE) == 0);
00104$:
	ldw	x, #0x5203
	ld	a, (x)
	srl	a
	jrnc	00104$
;	se8r01-receive-car.c: 66: delayTenMicro ();
	call	_delayTenMicro
;	se8r01-receive-car.c: 67: ret = SPI_DR;
	ldw	x, #0x5204
	ld	a, (x)
;	se8r01-receive-car.c: 68: return (ret);
	ret
;	se8r01-receive-car.c: 70: UCHAR write_spi_reg (UCHAR reg, UCHAR value) {
;	-----------------------------------------
;	 function write_spi_reg
;	-----------------------------------------
_write_spi_reg:
	push	a
;	se8r01-receive-car.c: 72: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	se8r01-receive-car.c: 73: ret = write_spi (reg);
	ld	a, (0x04, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
;	se8r01-receive-car.c: 74: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
	ld	a, (0x04, sp)
	cp	a, #0xff
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe2
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe1
	jreq	00102$
;	se8r01-receive-car.c: 75: write_spi (value);
	ld	a, (0x05, sp)
	push	a
	call	_write_spi
	pop	a
	jra	00103$
00102$:
;	se8r01-receive-car.c: 77: delayTenMicro ();
	call	_delayTenMicro
00103$:
;	se8r01-receive-car.c: 78: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	se8r01-receive-car.c: 79: return (ret);
	ld	a, (0x01, sp)
	addw	sp, #1
	ret
;	se8r01-receive-car.c: 81: UCHAR read_spi_reg (UCHAR reg) {
;	-----------------------------------------
;	 function read_spi_reg
;	-----------------------------------------
_read_spi_reg:
	push	a
;	se8r01-receive-car.c: 83: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	se8r01-receive-car.c: 84: ret = write_spi (reg);
	ld	a, (0x04, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
;	se8r01-receive-car.c: 85: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
	ld	a, (0x04, sp)
	cp	a, #0xff
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe2
	jreq	00102$
	ld	a, (0x04, sp)
	cp	a, #0xe1
	jreq	00102$
;	se8r01-receive-car.c: 86: ret = write_spi (NOP);
	push	#0xff
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
	jra	00103$
00102$:
;	se8r01-receive-car.c: 88: delayTenMicro ();
	call	_delayTenMicro
00103$:
;	se8r01-receive-car.c: 89: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	se8r01-receive-car.c: 90: return (ret);
	ld	a, (0x01, sp)
	addw	sp, #1
	ret
;	se8r01-receive-car.c: 92: UCHAR write_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
;	-----------------------------------------
;	 function write_spi_buf
;	-----------------------------------------
_write_spi_buf:
	sub	sp, #2
;	se8r01-receive-car.c: 94: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	se8r01-receive-car.c: 95: ret = write_spi (reg);
	ld	a, (0x05, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x02, sp), a
;	se8r01-receive-car.c: 96: for (n = 0; n < len; ++n)
	clr	(0x01, sp)
00103$:
	ld	a, (0x01, sp)
	cp	a, (0x08, sp)
	jrnc	00101$
;	se8r01-receive-car.c: 97: write_spi (array[n]);
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x06, sp)
	ld	a, (x)
	push	a
	call	_write_spi
	pop	a
;	se8r01-receive-car.c: 96: for (n = 0; n < len; ++n)
	inc	(0x01, sp)
	jra	00103$
00101$:
;	se8r01-receive-car.c: 98: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	se8r01-receive-car.c: 99: return (ret);
	ld	a, (0x02, sp)
	addw	sp, #2
	ret
;	se8r01-receive-car.c: 101: UCHAR read_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
;	-----------------------------------------
;	 function read_spi_buf
;	-----------------------------------------
_read_spi_buf:
	sub	sp, #2
;	se8r01-receive-car.c: 103: PC_ODR &= ~(1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	se8r01-receive-car.c: 104: ret = write_spi (reg);
	ld	a, (0x05, sp)
	push	a
	call	_write_spi
	addw	sp, #1
	ld	(0x01, sp), a
;	se8r01-receive-car.c: 105: for (n = 0; n < len; ++n)
	clr	(0x02, sp)
00103$:
	ld	a, (0x02, sp)
	cp	a, (0x08, sp)
	jrnc	00101$
;	se8r01-receive-car.c: 106: array[n] = write_spi (NOP);
	clrw	x
	ld	a, (0x02, sp)
	ld	xl, a
	addw	x, (0x06, sp)
	pushw	x
	push	#0xff
	call	_write_spi
	addw	sp, #1
	popw	x
	ld	(x), a
;	se8r01-receive-car.c: 105: for (n = 0; n < len; ++n)
	inc	(0x02, sp)
	jra	00103$
00101$:
;	se8r01-receive-car.c: 107: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	se8r01-receive-car.c: 108: return (ret);
	ld	a, (0x01, sp)
	addw	sp, #2
	ret
;	se8r01-receive-car.c: 110: void InitializeSPI () {
;	-----------------------------------------
;	 function InitializeSPI
;	-----------------------------------------
_InitializeSPI:
;	se8r01-receive-car.c: 111: SPI_CR1 = MSBFIRST | SPI_ENABLE | BR_DIV256 | MASTER | CPOL0 | CPHA0;
	ldw	x, #0x5200
	ld	a, #0x7c
	ld	(x), a
;	se8r01-receive-car.c: 112: SPI_CR2 = BDM_2LINE | CRCEN_OFF | CRCNEXT_TXBUF | FULL_DUPLEX | SSM_DISABLE;
	ldw	x, #0x5201
	clr	(x)
;	se8r01-receive-car.c: 113: SPI_ICR = TXIE_MASKED | RXIE_MASKED | ERRIE_MASKED | WKIE_MASKED;
	ldw	x, #0x5202
	clr	(x)
;	se8r01-receive-car.c: 114: PC_DDR = (1 << PC3) | (1 << PC4); // output mode
	ldw	x, #0x500c
	ld	a, #0x18
	ld	(x), a
;	se8r01-receive-car.c: 115: PC_CR1 = (1 << PC3) | (1 << PC4); // push-pull
	ldw	x, #0x500d
	ld	a, #0x18
	ld	(x), a
;	se8r01-receive-car.c: 116: PC_CR2 = (1 << PC3) | (1 << PC4); // up to 10MHz speed
	ldw	x, #0x500e
	ld	a, #0x18
	ld	(x), a
;	se8r01-receive-car.c: 118: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	ret
;	se8r01-receive-car.c: 120: void InitializeSystemClock() {
;	-----------------------------------------
;	 function InitializeSystemClock
;	-----------------------------------------
_InitializeSystemClock:
;	se8r01-receive-car.c: 121: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
	ldw	x, #0x50c0
	clr	(x)
;	se8r01-receive-car.c: 122: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
	ldw	x, #0x50c0
	ld	a, #0x01
	ld	(x), a
;	se8r01-receive-car.c: 123: CLK_ECKR = 0;                       //  Disable the external clock.
	ldw	x, #0x50c1
	clr	(x)
;	se8r01-receive-car.c: 124: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
00101$:
	ldw	x, #0x50c0
	ld	a, (x)
	bcp	a, #0x02
	jreq	00101$
;	se8r01-receive-car.c: 125: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
	ldw	x, #0x50c6
	clr	(x)
;	se8r01-receive-car.c: 126: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
	ldw	x, #0x50c7
	ld	a, #0xff
	ld	(x), a
;	se8r01-receive-car.c: 127: CLK_PCKENR2 = 0xff;                 //  Ditto.
	ldw	x, #0x50ca
	ld	a, #0xff
	ld	(x), a
;	se8r01-receive-car.c: 128: CLK_CCOR = 0;                       //  Turn off CCO.
	ldw	x, #0x50c9
	clr	(x)
;	se8r01-receive-car.c: 129: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
	ldw	x, #0x50cc
	clr	(x)
;	se8r01-receive-car.c: 130: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
	ldw	x, #0x50cd
	clr	(x)
;	se8r01-receive-car.c: 131: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
	ldw	x, #0x50c4
	ld	a, #0xe1
	ld	(x), a
;	se8r01-receive-car.c: 132: CLK_SWCR = 0;                       //  Reset the clock switch control register.
	ldw	x, #0x50c5
	clr	(x)
;	se8r01-receive-car.c: 133: CLK_SWCR = CLK_SWEN;                //  Enable switching.
	ldw	x, #0x50c5
	ld	a, #0x02
	ld	(x), a
;	se8r01-receive-car.c: 134: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
00104$:
	ldw	x, #0x50c5
	ld	a, (x)
	srl	a
	jrc	00104$
	ret
;	se8r01-receive-car.c: 136: void delay (int time_ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	sub	sp, #10
;	se8r01-receive-car.c: 138: for (x = 0; x < 1036*time_ms; ++x)
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
	ldw	x, (0x0d, sp)
	pushw	x
	push	#0x0c
	push	#0x04
	call	__mulint
	addw	sp, #4
	ldw	(0x09, sp), x
00103$:
	ldw	y, (0x09, sp)
	ldw	(0x07, sp), y
	ld	a, (0x07, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x06, sp), a
	ld	(0x05, sp), a
	ldw	x, (0x03, sp)
	cpw	x, (0x07, sp)
	ld	a, (0x02, sp)
	sbc	a, (0x06, sp)
	ld	a, (0x01, sp)
	sbc	a, (0x05, sp)
	jrsge	00105$
;	se8r01-receive-car.c: 139: __asm__("nop");
	nop
;	se8r01-receive-car.c: 138: for (x = 0; x < 1036*time_ms; ++x)
	ldw	y, (0x03, sp)
	addw	y, #0x0001
	ld	a, (0x02, sp)
	adc	a, #0x00
	ld	xl, a
	ld	a, (0x01, sp)
	adc	a, #0x00
	ld	xh, a
	ldw	(0x03, sp), y
	ldw	(0x01, sp), x
	jra	00103$
00105$:
	addw	sp, #10
	ret
;	se8r01-receive-car.c: 144: void UARTPrintF (char *message) {
;	-----------------------------------------
;	 function UARTPrintF
;	-----------------------------------------
_UARTPrintF:
;	se8r01-receive-car.c: 145: char *ch = message;
	ldw	y, (0x03, sp)
;	se8r01-receive-car.c: 146: while (*ch) {
00104$:
	ld	a, (y)
	tnz	a
	jreq	00107$
;	se8r01-receive-car.c: 147: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
	ldw	x, #0x5231
	ld	(x), a
;	se8r01-receive-car.c: 148: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
00101$:
	ldw	x, #0x5230
	ld	a, (x)
	sll	a
	jrnc	00101$
;	se8r01-receive-car.c: 149: ch++;                               //  Grab the next character.
	incw	y
	jra	00104$
00107$:
	ret
;	se8r01-receive-car.c: 152: void print_UCHAR_hex (unsigned char buffer) {
;	-----------------------------------------
;	 function print_UCHAR_hex
;	-----------------------------------------
_print_UCHAR_hex:
	sub	sp, #12
;	se8r01-receive-car.c: 155: a = (buffer >> 4);
	ld	a, (0x0f, sp)
	swap	a
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	se8r01-receive-car.c: 156: if (a > 9)
	cpw	x, #0x0009
	jrsle	00102$
;	se8r01-receive-car.c: 157: a = a + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x0b, sp), x
	jra	00103$
00102$:
;	se8r01-receive-car.c: 159: a += '0'; 
	addw	x, #0x0030
	ldw	(0x0b, sp), x
00103$:
;	se8r01-receive-car.c: 160: b = buffer & 0x0f;
	ld	a, (0x0f, sp)
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	se8r01-receive-car.c: 161: if (b > 9)
	cpw	x, #0x0009
	jrsle	00105$
;	se8r01-receive-car.c: 162: b = b + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x09, sp), x
	jra	00106$
00105$:
;	se8r01-receive-car.c: 164: b += '0'; 
	addw	x, #0x0030
	ldw	(0x09, sp), x
00106$:
;	se8r01-receive-car.c: 165: message[0] = a;
	ldw	y, sp
	incw	y
	ld	a, (0x0c, sp)
	ld	(y), a
;	se8r01-receive-car.c: 166: message[1] = b;
	ldw	x, y
	incw	x
	ld	a, (0x0a, sp)
	ld	(x), a
;	se8r01-receive-car.c: 167: message[2] = 0;
	ldw	x, y
	incw	x
	incw	x
	clr	(x)
;	se8r01-receive-car.c: 168: UARTPrintF (message);
	pushw	y
	call	_UARTPrintF
	addw	sp, #2
	addw	sp, #12
	ret
;	se8r01-receive-car.c: 171: void InitializeUART() {
;	-----------------------------------------
;	 function InitializeUART
;	-----------------------------------------
_InitializeUART:
;	se8r01-receive-car.c: 181: UART1_CR1 = 0;
	ldw	x, #0x5234
	clr	(x)
;	se8r01-receive-car.c: 182: UART1_CR2 = 0;
	ldw	x, #0x5235
	clr	(x)
;	se8r01-receive-car.c: 183: UART1_CR4 = 0;
	ldw	x, #0x5237
	clr	(x)
;	se8r01-receive-car.c: 184: UART1_CR3 = 0;
	ldw	x, #0x5236
	clr	(x)
;	se8r01-receive-car.c: 185: UART1_CR5 = 0;
	ldw	x, #0x5238
	clr	(x)
;	se8r01-receive-car.c: 186: UART1_GTR = 0;
	ldw	x, #0x5239
	clr	(x)
;	se8r01-receive-car.c: 187: UART1_PSCR = 0;
	ldw	x, #0x523a
	clr	(x)
;	se8r01-receive-car.c: 191: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	se8r01-receive-car.c: 192: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	se8r01-receive-car.c: 193: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
;	se8r01-receive-car.c: 194: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	se8r01-receive-car.c: 195: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
	ldw	x, #0x5233
	ld	a, #0x0a
	ld	(x), a
;	se8r01-receive-car.c: 196: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
	ldw	x, #0x5232
	ld	a, #0x08
	ld	(x), a
;	se8r01-receive-car.c: 200: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	se8r01-receive-car.c: 201: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	se8r01-receive-car.c: 205: SET (UART1_CR3, CR3_CPOL);
	ldw	x, #0x5236
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	se8r01-receive-car.c: 206: SET (UART1_CR3, CR3_CPHA);
	ldw	x, #0x5236
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	se8r01-receive-car.c: 207: SET (UART1_CR3, CR3_LBCL);
	bset	0x5236, #0
;	se8r01-receive-car.c: 211: SET (UART1_CR2, CR2_TEN);
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	se8r01-receive-car.c: 212: SET (UART1_CR2, CR2_REN);
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	se8r01-receive-car.c: 213: UART1_CR3 = CR3_CLKEN;
	ldw	x, #0x5236
	ld	a, #0x08
	ld	(x), a
	ret
;	se8r01-receive-car.c: 286: void init_io(void)
;	-----------------------------------------
;	 function init_io
;	-----------------------------------------
_init_io:
;	se8r01-receive-car.c: 294: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	se8r01-receive-car.c: 296: PC_ODR |= (1 << CSN);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
	ret
;	se8r01-receive-car.c: 302: void rf_switch_bank(unsigned char bankindex)
;	-----------------------------------------
;	 function rf_switch_bank
;	-----------------------------------------
_rf_switch_bank:
	push	a
;	se8r01-receive-car.c: 305: temp1 = bankindex;
	ld	a, (0x04, sp)
	ld	(0x01, sp), a
;	se8r01-receive-car.c: 307: temp0 = write_spi(iRF_BANK0_STATUS);
	push	#0x07
	call	_write_spi
	addw	sp, #1
;	se8r01-receive-car.c: 309: if((temp0&0x80)!=temp1)
	and	a, #0x80
	cp	a, (0x01, sp)
	jreq	00103$
;	se8r01-receive-car.c: 311: write_spi_reg(iRF_CMD_ACTIVATE,0x53);
	push	#0x53
	push	#0x50
	call	_write_spi_reg
	addw	sp, #2
00103$:
	pop	a
	ret
;	se8r01-receive-car.c: 318: void SE8R01_Calibration()
;	-----------------------------------------
;	 function SE8R01_Calibration
;	-----------------------------------------
_SE8R01_Calibration:
	sub	sp, #13
;	se8r01-receive-car.c: 321: rf_switch_bank(iBANK0);
	push	#0x00
	call	_rf_switch_bank
	pop	a
;	se8r01-receive-car.c: 322: temp[0]=0x03;
	ldw	x, sp
	incw	x
	ldw	(0x06, sp), x
	ldw	x, (0x06, sp)
	ld	a, #0x03
	ld	(x), a
;	se8r01-receive-car.c: 323: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_CONFIG,temp, 1);
	ldw	x, (0x06, sp)
	push	#0x01
	pushw	x
	push	#0x20
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 325: temp[0]=0x32;
	ldw	x, (0x06, sp)
	ld	a, #0x32
	ld	(x), a
;	se8r01-receive-car.c: 327: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_CH, temp,1);
	ldw	x, (0x06, sp)
	push	#0x01
	pushw	x
	push	#0x25
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 331: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00105$
;	se8r01-receive-car.c: 332: {temp[0]=0x48;}
	ldw	x, (0x06, sp)
	ld	a, #0x48
	ld	(x), a
	jra	00106$
00105$:
;	se8r01-receive-car.c: 333: else if (SE8R01_DR_1M==1)
	ldw	x, _SE8R01_DR_1M+0
	cpw	x, #0x0001
	jrne	00102$
;	se8r01-receive-car.c: 334: {temp[0]=0x40;}
	ldw	x, (0x06, sp)
	ld	a, #0x40
	ld	(x), a
	jra	00106$
00102$:
;	se8r01-receive-car.c: 336: {temp[0]=0x68;}   
	ldw	x, (0x06, sp)
	ld	a, #0x68
	ld	(x), a
00106$:
;	se8r01-receive-car.c: 338: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
	ldw	x, (0x06, sp)
	push	#0x01
	pushw	x
	push	#0x26
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 339: temp[0]=0x77;
	ldw	x, (0x06, sp)
	ld	a, #0x77
	ld	(x), a
;	se8r01-receive-car.c: 340: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_PRE_GURD, temp,1);
	ldw	x, (0x06, sp)
	push	#0x01
	pushw	x
	push	#0x3f
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 342: rf_switch_bank(iBANK1);
	push	#0x80
	call	_rf_switch_bank
	pop	a
;	se8r01-receive-car.c: 343: temp[0]=0x40;
	ldw	x, (0x06, sp)
	ld	a, #0x40
	ld	(x), a
;	se8r01-receive-car.c: 344: temp[1]=0x00;
	ldw	x, (0x06, sp)
	incw	x
	ldw	(0x0c, sp), x
	ldw	x, (0x0c, sp)
	clr	(x)
;	se8r01-receive-car.c: 345: temp[2]=0x10;
	ldw	x, (0x06, sp)
	incw	x
	incw	x
	ldw	(0x0a, sp), x
	ldw	x, (0x0a, sp)
	ld	a, #0x10
	ld	(x), a
;	se8r01-receive-car.c: 347: {temp[3]=0xE6;}
	ldw	x, (0x06, sp)
	addw	x, #0x0003
	ldw	(0x08, sp), x
;	se8r01-receive-car.c: 346: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00108$
;	se8r01-receive-car.c: 347: {temp[3]=0xE6;}
	ldw	x, (0x08, sp)
	ld	a, #0xe6
	ld	(x), a
	jra	00109$
00108$:
;	se8r01-receive-car.c: 349: {temp[3]=0xE4;}
	ldw	x, (0x08, sp)
	ld	a, #0xe4
	ld	(x), a
00109$:
;	se8r01-receive-car.c: 351: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp, 4);
	ldw	x, (0x06, sp)
	push	#0x04
	pushw	x
	push	#0x21
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 353: temp[0]=0x20;
	ldw	x, (0x06, sp)
	ld	a, #0x20
	ld	(x), a
;	se8r01-receive-car.c: 354: temp[1]=0x08;
	ldw	x, (0x0c, sp)
	ld	a, #0x08
	ld	(x), a
;	se8r01-receive-car.c: 355: temp[2]=0x50;
	ldw	x, (0x0a, sp)
	ld	a, #0x50
	ld	(x), a
;	se8r01-receive-car.c: 356: temp[3]=0x40;
	ldw	x, (0x08, sp)
	ld	a, #0x40
	ld	(x), a
;	se8r01-receive-car.c: 357: temp[4]=0x50;
	ldw	x, (0x06, sp)
	ld	a, #0x50
	ld	(0x0004, x), a
;	se8r01-receive-car.c: 358: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp, 5);
	ldw	x, (0x06, sp)
	push	#0x05
	pushw	x
	push	#0x23
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 360: temp[0]=0x00;
	ldw	x, (0x06, sp)
	clr	(x)
;	se8r01-receive-car.c: 361: temp[1]=0x00;
	ldw	x, (0x0c, sp)
	clr	(x)
;	se8r01-receive-car.c: 362: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00111$
;	se8r01-receive-car.c: 363: { temp[2]=0x1E;}
	ldw	x, (0x0a, sp)
	ld	a, #0x1e
	ld	(x), a
	jra	00112$
00111$:
;	se8r01-receive-car.c: 365: { temp[2]=0x1F;}
	ldw	x, (0x0a, sp)
	ld	a, #0x1f
	ld	(x), a
00112$:
;	se8r01-receive-car.c: 367: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_IF_FREQ, temp, 3);
	ldw	x, (0x06, sp)
	push	#0x03
	pushw	x
	push	#0x2a
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 369: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00114$
;	se8r01-receive-car.c: 370: { temp[0]=0x29;}
	ldw	x, (0x06, sp)
	ld	a, #0x29
	ld	(x), a
	jra	00115$
00114$:
;	se8r01-receive-car.c: 372: { temp[0]=0x14;}
	ldw	x, (0x06, sp)
	ld	a, #0x14
	ld	(x), a
00115$:
;	se8r01-receive-car.c: 374: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp, 1);
	ldw	x, (0x06, sp)
	push	#0x01
	pushw	x
	push	#0x2c
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 376: temp[0]=0x00;
	ldw	x, (0x06, sp)
	clr	(x)
;	se8r01-receive-car.c: 377: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_LOW,temp,1);
	ldw	x, (0x06, sp)
	push	#0x01
	pushw	x
	push	#0x37
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 379: temp[0]=0x7F;
	ldw	x, (0x06, sp)
	ld	a, #0x7f
	ld	(x), a
;	se8r01-receive-car.c: 380: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_HI,temp,1);
	ldw	x, (0x06, sp)
	push	#0x01
	pushw	x
	push	#0x38
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 382: temp[0]=0x02;
	ldw	x, (0x06, sp)
	ld	a, #0x02
	ld	(x), a
;	se8r01-receive-car.c: 383: temp[1]=0xC1;
	ldw	x, (0x0c, sp)
	ld	a, #0xc1
	ld	(x), a
;	se8r01-receive-car.c: 384: temp[2]=0xEB;            
	ldw	x, (0x0a, sp)
	ld	a, #0xeb
	ld	(x), a
;	se8r01-receive-car.c: 385: temp[3]=0x1C;
	ldw	x, (0x08, sp)
	ld	a, #0x1c
	ld	(x), a
;	se8r01-receive-car.c: 386: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
	ldw	x, (0x06, sp)
	push	#0x04
	pushw	x
	push	#0x3d
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 388: temp[0]=0x97;
	ldw	x, (0x06, sp)
	ld	a, #0x97
	ld	(x), a
;	se8r01-receive-car.c: 389: temp[1]=0x64;
	ldw	x, (0x0c, sp)
	ld	a, #0x64
	ld	(x), a
;	se8r01-receive-car.c: 390: temp[2]=0x00;
	ldw	x, (0x0a, sp)
	clr	(x)
;	se8r01-receive-car.c: 391: temp[3]=0x81;
	ldw	x, (0x08, sp)
	ld	a, #0x81
	ld	(x), a
;	se8r01-receive-car.c: 392: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp, 4);
	ldw	x, (0x06, sp)
	push	#0x04
	pushw	x
	push	#0x3e
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 393: rf_switch_bank(iBANK0);
	push	#0x00
	call	_rf_switch_bank
	pop	a
;	se8r01-receive-car.c: 398: delayTenMicro();
	call	_delayTenMicro
;	se8r01-receive-car.c: 399: PC_ODR |= (1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	se8r01-receive-car.c: 400: delayTenMicro();
	call	_delayTenMicro
;	se8r01-receive-car.c: 401: delayTenMicro();
	call	_delayTenMicro
;	se8r01-receive-car.c: 402: delayTenMicro();
	call	_delayTenMicro
;	se8r01-receive-car.c: 403: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	se8r01-receive-car.c: 404: delay(50);                            // delay 50ms waitting for calibaration.
	push	#0x32
	push	#0x00
	call	_delay
	addw	sp, #2
;	se8r01-receive-car.c: 409: delayTenMicro();
	call	_delayTenMicro
;	se8r01-receive-car.c: 410: PC_ODR |= (1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	se8r01-receive-car.c: 411: delayTenMicro();
	call	_delayTenMicro
;	se8r01-receive-car.c: 412: delayTenMicro();
	call	_delayTenMicro
;	se8r01-receive-car.c: 413: delayTenMicro();
	call	_delayTenMicro
;	se8r01-receive-car.c: 414: PC_ODR &= ~(1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	se8r01-receive-car.c: 415: delay(50);                            // delay 50ms waitting for calibaration.
	push	#0x32
	push	#0x00
	call	_delay
	addw	sp, #2
	addw	sp, #13
	ret
;	se8r01-receive-car.c: 419: void SE8R01_Analog_Init()           //SE8R01 初始化
;	-----------------------------------------
;	 function SE8R01_Analog_Init
;	-----------------------------------------
_SE8R01_Analog_Init:
	sub	sp, #21
;	se8r01-receive-car.c: 424: gtemp[0]=0x28;
	ldw	x, #_gtemp+0
	ldw	(0x14, sp), x
	ldw	x, (0x14, sp)
	ld	a, #0x28
	ld	(x), a
;	se8r01-receive-car.c: 425: gtemp[1]=0x32;
	ldw	x, (0x14, sp)
	incw	x
	ldw	(0x12, sp), x
	ldw	x, (0x12, sp)
	ld	a, #0x32
	ld	(x), a
;	se8r01-receive-car.c: 426: gtemp[2]=0x80;
	ldw	x, (0x14, sp)
	incw	x
	incw	x
	ldw	(0x10, sp), x
	ldw	x, (0x10, sp)
	ld	a, #0x80
	ld	(x), a
;	se8r01-receive-car.c: 427: gtemp[3]=0x90;
	ldw	x, (0x14, sp)
	addw	x, #0x0003
	ldw	(0x0e, sp), x
	ldw	x, (0x0e, sp)
	ld	a, #0x90
	ld	(x), a
;	se8r01-receive-car.c: 428: gtemp[4]=0x00;
	ldw	x, (0x14, sp)
	addw	x, #0x0004
	clr	(x)
;	se8r01-receive-car.c: 429: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_SETUP_VALUE, gtemp, 5);
	ldw	x, (0x14, sp)
	push	#0x05
	pushw	x
	push	#0x3e
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 430: delay(2);
	push	#0x02
	push	#0x00
	call	_delay
	addw	sp, #2
;	se8r01-receive-car.c: 433: rf_switch_bank(iBANK1);
	push	#0x80
	call	_rf_switch_bank
	pop	a
;	se8r01-receive-car.c: 435: temp[0]=0x40;
	ldw	x, sp
	incw	x
	ldw	(0x0c, sp), x
	ldw	x, (0x0c, sp)
	ld	a, #0x40
	ld	(x), a
;	se8r01-receive-car.c: 436: temp[1]=0x01;               
	ldw	x, (0x0c, sp)
	incw	x
	ldw	(0x0a, sp), x
	ldw	x, (0x0a, sp)
	ld	a, #0x01
	ld	(x), a
;	se8r01-receive-car.c: 437: temp[2]=0x30;               
	ldw	x, (0x0c, sp)
	incw	x
	incw	x
	ldw	(0x08, sp), x
	ldw	x, (0x08, sp)
	ld	a, #0x30
	ld	(x), a
;	se8r01-receive-car.c: 439: { temp[3]=0xE2; }              
	ldw	x, (0x0c, sp)
	addw	x, #0x0003
	ldw	(0x06, sp), x
;	se8r01-receive-car.c: 438: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00102$
;	se8r01-receive-car.c: 439: { temp[3]=0xE2; }              
	ldw	x, (0x06, sp)
	ld	a, #0xe2
	ld	(x), a
	jra	00103$
00102$:
;	se8r01-receive-car.c: 441: { temp[3]=0xE0;}
	ldw	x, (0x06, sp)
	ld	a, #0xe0
	ld	(x), a
00103$:
;	se8r01-receive-car.c: 443: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x21
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 445: temp[0]=0x29;
	ldw	x, (0x0c, sp)
	ld	a, #0x29
	ld	(x), a
;	se8r01-receive-car.c: 446: temp[1]=0x89;
	ldw	x, (0x0a, sp)
	ld	a, #0x89
	ld	(x), a
;	se8r01-receive-car.c: 447: temp[2]=0x55;                     
	ldw	x, (0x08, sp)
	ld	a, #0x55
	ld	(x), a
;	se8r01-receive-car.c: 448: temp[3]=0x40;
	ldw	x, (0x06, sp)
	ld	a, #0x40
	ld	(x), a
;	se8r01-receive-car.c: 449: temp[4]=0x50;
	ldw	x, (0x0c, sp)
	ld	a, #0x50
	ld	(0x0004, x), a
;	se8r01-receive-car.c: 450: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp,5);
	ldw	x, (0x0c, sp)
	push	#0x05
	pushw	x
	push	#0x23
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 452: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00105$
;	se8r01-receive-car.c: 453: { temp[0]=0x29;}
	ldw	x, (0x0c, sp)
	ld	a, #0x29
	ld	(x), a
	jra	00106$
00105$:
;	se8r01-receive-car.c: 455: { temp[0]=0x14;}
	ldw	x, (0x0c, sp)
	ld	a, #0x14
	ld	(x), a
00106$:
;	se8r01-receive-car.c: 457: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp,1);
	ldw	x, (0x0c, sp)
	push	#0x01
	pushw	x
	push	#0x2c
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 459: temp[0]=0x55;
	ldw	x, (0x0c, sp)
	ld	a, #0x55
	ld	(x), a
;	se8r01-receive-car.c: 460: temp[1]=0xC2;
	ldw	x, (0x0a, sp)
	ld	a, #0xc2
	ld	(x), a
;	se8r01-receive-car.c: 461: temp[2]=0x09;
	ldw	x, (0x08, sp)
	ld	a, #0x09
	ld	(x), a
;	se8r01-receive-car.c: 462: temp[3]=0xAC;  
	ldw	x, (0x06, sp)
	ld	a, #0xac
	ld	(x), a
;	se8r01-receive-car.c: 463: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RX_CTRL,temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x31
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 465: temp[0]=0x00;
	ldw	x, (0x0c, sp)
	clr	(x)
;	se8r01-receive-car.c: 466: temp[1]=0x14;
	ldw	x, (0x0a, sp)
	ld	a, #0x14
	ld	(x), a
;	se8r01-receive-car.c: 467: temp[2]=0x08;   
	ldw	x, (0x08, sp)
	ld	a, #0x08
	ld	(x), a
;	se8r01-receive-car.c: 468: temp[3]=0x29;
	ldw	x, (0x06, sp)
	ld	a, #0x29
	ld	(x), a
;	se8r01-receive-car.c: 469: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FAGC_CTRL_1, temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x33
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 471: temp[0]=0x02;
	ldw	x, (0x0c, sp)
	ld	a, #0x02
	ld	(x), a
;	se8r01-receive-car.c: 472: temp[1]=0xC1;
	ldw	x, (0x0a, sp)
	ld	a, #0xc1
	ld	(x), a
;	se8r01-receive-car.c: 473: temp[2]=0xCB;  
	ldw	x, (0x08, sp)
	ld	a, #0xcb
	ld	(x), a
;	se8r01-receive-car.c: 474: temp[3]=0x1C;
	ldw	x, (0x06, sp)
	ld	a, #0x1c
	ld	(x), a
;	se8r01-receive-car.c: 475: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x3d
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 477: temp[0]=0x97;
	ldw	x, (0x0c, sp)
	ld	a, #0x97
	ld	(x), a
;	se8r01-receive-car.c: 478: temp[1]=0x64;
	ldw	x, (0x0a, sp)
	ld	a, #0x64
	ld	(x), a
;	se8r01-receive-car.c: 479: temp[2]=0x00;
	ldw	x, (0x08, sp)
	clr	(x)
;	se8r01-receive-car.c: 480: temp[3]=0x01;
	ldw	x, (0x06, sp)
	ld	a, #0x01
	ld	(x), a
;	se8r01-receive-car.c: 481: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp,4);
	ldw	x, (0x0c, sp)
	push	#0x04
	pushw	x
	push	#0x3e
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 483: gtemp[0]=0x2A;
	ldw	x, (0x14, sp)
	ld	a, #0x2a
	ld	(x), a
;	se8r01-receive-car.c: 484: gtemp[1]=0x04;
	ldw	x, (0x12, sp)
	ld	a, #0x04
	ld	(x), a
;	se8r01-receive-car.c: 485: gtemp[2]=0x00;
	ldw	x, (0x10, sp)
	clr	(x)
;	se8r01-receive-car.c: 486: gtemp[3]=0x7D;
	ldw	x, (0x0e, sp)
	ld	a, #0x7d
	ld	(x), a
;	se8r01-receive-car.c: 487: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_TEST_PKDET, gtemp, 4);
	ldw	x, (0x14, sp)
	push	#0x04
	pushw	x
	push	#0x3f
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 489: rf_switch_bank(iBANK0);
	push	#0x00
	call	_rf_switch_bank
	pop	a
	addw	sp, #21
	ret
;	se8r01-receive-car.c: 492: void SE8R01_Init()  
;	-----------------------------------------
;	 function SE8R01_Init
;	-----------------------------------------
_SE8R01_Init:
	sub	sp, #5
;	se8r01-receive-car.c: 495: SE8R01_Calibration();   
	call	_SE8R01_Calibration
;	se8r01-receive-car.c: 496: SE8R01_Analog_Init();   
	call	_SE8R01_Analog_Init
;	se8r01-receive-car.c: 500: if (SE8R01_DR_2M==1)
	ldw	x, _SE8R01_DR_2M+0
	cpw	x, #0x0001
	jrne	00105$
;	se8r01-receive-car.c: 501: {  temp[0]=0b01001111; }     //2MHz,+5dbm
	ldw	x, sp
	incw	x
	ld	a, #0x4f
	ld	(x), a
	jra	00106$
00105$:
;	se8r01-receive-car.c: 502: else if  (SE8R01_DR_1M==1)
	ldw	x, _SE8R01_DR_1M+0
	cpw	x, #0x0001
	jrne	00102$
;	se8r01-receive-car.c: 503: {  temp[0]=0b01000111;  }     //1MHz,+5dbm
	ldw	x, sp
	incw	x
	ld	a, #0x47
	ld	(x), a
	jra	00106$
00102$:
;	se8r01-receive-car.c: 505: {temp[0]=0b01101111;  }     //500K,+5dbm
	ldw	x, sp
	incw	x
	ld	a, #0x6f
	ld	(x), a
00106$:
;	se8r01-receive-car.c: 507: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
	ldw	x, sp
	incw	x
	push	#0x01
	pushw	x
	push	#0x26
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 508: write_spi_reg(WRITE_REG|iRF_BANK0_EN_AA, 0b00111111);          //enable auto acc on pip 1
	push	#0x3f
	push	#0x21
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-receive-car.c: 509: write_spi_reg(WRITE_REG|iRF_BANK0_EN_RXADDR, 0b00111111);      //enable pip 1
	push	#0x3f
	push	#0x22
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-receive-car.c: 510: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_AW, 0x02);  
	push	#0x02
	push	#0x23
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-receive-car.c: 511: write_spi_reg(WRITE_REG|iRF_BANK0_RF_CH, 40);
	push	#0x28
	push	#0x25
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-receive-car.c: 513: write_spi_buf(WRITE_REG + TX_ADDR, ADDRESS0, ADR_WIDTH);    	
	ldw	x, #_ADDRESS0+0
	ldw	y, x
	pushw	x
	push	#0x04
	pushw	y
	push	#0x30
	call	_write_spi_buf
	addw	sp, #4
	popw	x
;	se8r01-receive-car.c: 514: write_spi_buf(WRITE_REG + RX_ADDR_P0, ADDRESS0, ADR_WIDTH); 
	push	#0x04
	pushw	x
	push	#0x2a
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 515: write_spi_buf(WRITE_REG + RX_ADDR_P1, ADDRESS1, ADR_WIDTH); 
	ldw	x, #_ADDRESS1+0
	push	#0x04
	pushw	x
	push	#0x2b
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 516: write_spi_buf(WRITE_REG + RX_ADDR_P2, ADDRESS2, 1); 
	ldw	x, #_ADDRESS2+0
	push	#0x01
	pushw	x
	push	#0x2c
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 517: write_spi_buf(WRITE_REG + RX_ADDR_P3, ADDRESS3, 1); 
	ldw	x, #_ADDRESS3+0
	push	#0x01
	pushw	x
	push	#0x2d
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 518: write_spi_buf(WRITE_REG + RX_ADDR_P4, ADDRESS4, 1); 
	ldw	x, #_ADDRESS4+0
	push	#0x01
	pushw	x
	push	#0x2e
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 519: write_spi_buf(WRITE_REG + RX_ADDR_P5, ADDRESS5, 1); 
	ldw	x, #_ADDRESS5+0
	push	#0x01
	pushw	x
	push	#0x2f
	call	_write_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 520: write_spi_reg(WRITE_REG + RX_PW_P0, PLOAD_WIDTH); 
	push	#0x20
	push	#0x31
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-receive-car.c: 521: write_spi_reg(WRITE_REG|iRF_BANK0_CONFIG, 0x3f); 
	push	#0x3f
	push	#0x20
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-receive-car.c: 522: write_spi_reg(WRITE_REG|iRF_BANK0_DYNPD, 0b00111111);          // enable dynamic payload length data
	push	#0x3f
	push	#0x3c
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-receive-car.c: 523: write_spi_reg(WRITE_REG|iRF_BANK0_FEATURE, 0x07);        // enable dynamic paload lenght; enbale payload with ack enable w_tx_payload_noack
	push	#0x07
	push	#0x3d
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-receive-car.c: 524: PC_ODR |= (1 << CE);
	ldw	x, #0x500a
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
	addw	sp, #5
	ret
;	se8r01-receive-car.c: 529: void Init_Tim2 ()
;	-----------------------------------------
;	 function Init_Tim2
;	-----------------------------------------
_Init_Tim2:
;	se8r01-receive-car.c: 553: TIM2_CCMR3 |=0X70;//Set the timer 2 / three channel three (PD2) output mode
	ldw	x, #0x5309
	ld	a, (x)
	or	a, #0x70
	ld	(x), a
;	se8r01-receive-car.c: 554: TIM2_CCMR3 |=0X04;//Comparison of 3 pre load / / output enable
	ldw	x, #0x5309
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	se8r01-receive-car.c: 556: TIM2_CCER2 |=0x03;//  Channel 3 enable, active low output configuration
	ldw	x, #0x530b
	ld	a, (x)
	or	a, #0x03
	ld	(x), a
;	se8r01-receive-car.c: 558: TIM2_PSCR =0X04;// 16 Mhz/2^4 =  1Mhz  -- the prescaler is a 4 bit number!
	ldw	x, #0x530e
	ld	a, #0x04
	ld	(x), a
;	se8r01-receive-car.c: 562: TIM2_ARRH =20000/256; // auto reload register
	ldw	x, #0x530f
	ld	a, #0x4e
	ld	(x), a
;	se8r01-receive-car.c: 563: TIM2_ARRL =20000%256; // 1000 Khz/20000 is 50 events per second 
	ldw	x, #0x5310
	ld	a, #0x20
	ld	(x), a
;	se8r01-receive-car.c: 567: TIM2_CCR3H =1000/256; //compare capture register value
	ldw	x, #0x5315
	ld	a, #0x03
	ld	(x), a
;	se8r01-receive-car.c: 568: TIM2_CCR3L =1000%256;
	ldw	x, #0x5316
	ld	a, #0xe8
	ld	(x), a
;	se8r01-receive-car.c: 569: UARTPrintF("timer init 1 = \n\r");
	ldw	x, #___str_0+0
	pushw	x
	call	_UARTPrintF
	addw	sp, #2
;	se8r01-receive-car.c: 577: TIM2_CCER1 =0x03;//  Channel 1 enable, active low output configuration
	ldw	x, #0x530a
	ld	a, #0x03
	ld	(x), a
;	se8r01-receive-car.c: 578: TIM2_CCMR2 = 0x03;
	ldw	x, #0x5308
	ld	a, #0x03
	ld	(x), a
;	se8r01-receive-car.c: 579: TIM2_CCMR1 =0X70;//Set the timer 2 / channel 1 output
	ldw	x, #0x5307
	ld	a, #0x70
	ld	(x), a
;	se8r01-receive-car.c: 584: TIM2_CCR1H =10000/256; //compare capture register value for channel 1
	ldw	x, #0x5311
	ld	a, #0x27
	ld	(x), a
;	se8r01-receive-car.c: 585: TIM2_CCR1L =10000%256;
	ldw	x, #0x5312
	ld	a, #0x10
	ld	(x), a
;	se8r01-receive-car.c: 589: UARTPrintF("timer init 2 = \n\r");
	ldw	x, #___str_1+0
	pushw	x
	call	_UARTPrintF
	addw	sp, #2
;	se8r01-receive-car.c: 592: TIM2_CR1 |=0x81;
	ldw	x, #0x5300
	ld	a, (x)
	or	a, #0x81
	ld	(x), a
	ret
;	se8r01-receive-car.c: 598: int main () {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #69
;	se8r01-receive-car.c: 600: UCHAR rx_addr_p1[]  = { 0xd2, 0xf0, 0xf0, 0xf0, 0xf0 };
	ldw	y, sp
	addw	y, #49
	ld	a, #0xd2
	ld	(y), a
	ldw	x, y
	incw	x
	ld	a, #0xf0
	ld	(x), a
	ldw	x, y
	incw	x
	incw	x
	ld	a, #0xf0
	ld	(x), a
	ldw	x, y
	ld	a, #0xf0
	ld	(0x0003, x), a
	ldw	x, y
	addw	x, #0x0004
	ld	a, #0xf0
	ld	(x), a
;	se8r01-receive-car.c: 601: UCHAR tx_addr[]     = { 0xe1, 0xf0, 0xf0, 0xf0, 0xf0 };
	ldw	y, sp
	incw	y
	ld	a, #0xe1
	ld	(y), a
	ldw	x, y
	incw	x
	ld	a, #0xf0
	ld	(x), a
	ldw	x, y
	incw	x
	incw	x
	ld	a, #0xf0
	ld	(x), a
	ldw	x, y
	ld	a, #0xf0
	ld	(0x0003, x), a
	ldw	x, y
	addw	x, #0x0004
	ld	a, #0xf0
	ld	(x), a
;	se8r01-receive-car.c: 606: InitializeSystemClock();
	call	_InitializeSystemClock
;	se8r01-receive-car.c: 607: InitializeUART();
	call	_InitializeUART
;	se8r01-receive-car.c: 609: InitializeSPI ();
	call	_InitializeSPI
;	se8r01-receive-car.c: 611: UARTPrintF("start debug \n\r");
	ldw	x, #___str_2+0
	pushw	x
	call	_UARTPrintF
	addw	sp, #2
;	se8r01-receive-car.c: 613: memset (tx_payload, 0, sizeof(tx_payload));
	ldw	x, sp
	addw	x, #16
	push	#0x21
	push	#0x00
	push	#0x00
	push	#0x00
	pushw	x
	call	_memset
	addw	sp, #6
;	se8r01-receive-car.c: 616: init_io();    // Initialize IO port
	call	_init_io
;	se8r01-receive-car.c: 617: write_spi_reg(FLUSH_RX,0); // receive data 
	push	#0x00
	push	#0xe2
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-receive-car.c: 618: readstatus = read_spi_reg(CONFIG);
	push	#0x00
	call	_read_spi_reg
	addw	sp, #1
;	se8r01-receive-car.c: 619: UARTPrintF("config = \n\r");
	ldw	x, #___str_3+0
	push	a
	pushw	x
	call	_UARTPrintF
	addw	sp, #2
	pop	a
;	se8r01-receive-car.c: 620: print_UCHAR_hex(readstatus);
	push	a
	call	_print_UCHAR_hex
	pop	a
;	se8r01-receive-car.c: 621: readstatus = read_spi_reg(STATUS);
	push	#0x07
	call	_read_spi_reg
	addw	sp, #1
;	se8r01-receive-car.c: 622: UARTPrintF("status = \n\r");
	ldw	x, #___str_4+0
	push	a
	pushw	x
	call	_UARTPrintF
	addw	sp, #2
	pop	a
;	se8r01-receive-car.c: 623: print_UCHAR_hex(readstatus);
	push	a
	call	_print_UCHAR_hex
	pop	a
;	se8r01-receive-car.c: 627: PD_DDR |= (1 << 2) ; // output mode
	ldw	x, #0x5011
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	se8r01-receive-car.c: 628: PD_CR1 |= (1 << 2) ; // push-pull
	ldw	x, #0x5012
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	se8r01-receive-car.c: 629: PD_ODR |= (1 << 2);
	ldw	x, #0x500f
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	se8r01-receive-car.c: 633: Init_Tim2 (); //pwm on pd4
	call	_Init_Tim2
;	se8r01-receive-car.c: 634: PD_DDR |= (1<<4);
	ldw	x, #0x5011
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	se8r01-receive-car.c: 635: PD_CR1 |= (1<<4);
	ldw	x, #0x5012
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	se8r01-receive-car.c: 636: PD_CR2 |= (1<<4);
	ldw	x, #0x5013
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	se8r01-receive-car.c: 640: PA_DDR |= (1<<3);
	ldw	x, #0x5002
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	se8r01-receive-car.c: 641: PA_CR1 |= (1<<3);
	ldw	x, #0x5003
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	se8r01-receive-car.c: 642: PA_CR2 |= (1<<4);
	ldw	x, #0x5004
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	se8r01-receive-car.c: 644: SE8R01_Init();
	call	_SE8R01_Init
;	se8r01-receive-car.c: 645: UARTPrintF("timer initialised = \n\r");
	ldw	x, #___str_5+0
	pushw	x
	call	_UARTPrintF
	addw	sp, #2
;	se8r01-receive-car.c: 653: PB_DDR |= (1 << 4) | (1 << 5);  // output mode
	ldw	x, #0x5007
	ld	a, (x)
	or	a, #0x30
	ld	(x), a
;	se8r01-receive-car.c: 654: PB_CR1 |= (1 << 4) | (1 << 5);  // push-pull
	ldw	x, #0x5008
	ld	a, (x)
	or	a, #0x30
	ld	(x), a
;	se8r01-receive-car.c: 655: PB_CR2 |= (1 << 4) | (1 << 5);  // up to 10MHz speed
	ldw	x, #0x5009
	ld	a, (x)
	or	a, #0x30
	ld	(x), a
;	se8r01-receive-car.c: 661: PA_DDR |= (1 << 1) | (1 << 2);  // output mode
	ldw	x, #0x5002
	ld	a, (x)
	or	a, #0x06
	ld	(x), a
;	se8r01-receive-car.c: 662: PA_CR1 |= (1 << 1) | (1 << 2);  // push-pull
	ldw	x, #0x5003
	ld	a, (x)
	or	a, #0x06
	ld	(x), a
;	se8r01-receive-car.c: 663: PA_CR2 |= (1 << 1) | (1 << 2);  // up to 10MHz speed
	ldw	x, #0x5004
	ld	a, (x)
	or	a, #0x06
	ld	(x), a
;	se8r01-receive-car.c: 668: PB_ODR |= 1 << 4; //only if pwm does not work jj
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x10
	ld	(x), a
;	se8r01-receive-car.c: 672: PB_ODR |= 1 << 5;
	ldw	x, #0x5005
	ld	a, (x)
	or	a, #0x20
	ld	(x), a
;	se8r01-receive-car.c: 676: while (1) {
00120$:
;	se8r01-receive-car.c: 681: delay(1000);
	push	#0xe8
	push	#0x03
	call	_delay
	addw	sp, #2
;	se8r01-receive-car.c: 686: PD_ODR &= ~(1 << 2); //blink LED
	ldw	x, #0x500f
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	se8r01-receive-car.c: 687: delay(500);
	push	#0xf4
	push	#0x01
	call	_delay
	addw	sp, #2
;	se8r01-receive-car.c: 690: delay(500);
	push	#0xf4
	push	#0x01
	call	_delay
	addw	sp, #2
;	se8r01-receive-car.c: 691: if ((PD_IDR & (1 << 3))==0) //input low
	ldw	x, #0x5010
	ld	a, (x)
	bcp	a, #0x08
	jreq	00204$
	jp	00115$
00204$:
;	se8r01-receive-car.c: 695: delay(240);
	push	#0xf0
	push	#0x00
	call	_delay
	addw	sp, #2
;	se8r01-receive-car.c: 696: signal_lv=read_spi_reg(iRF_BANK0_RPD);
	push	#0x09
	call	_read_spi_reg
	addw	sp, #1
	ld	_signal_lv+0, a
;	se8r01-receive-car.c: 697: status = read_spi_reg(STATUS);
	push	#0x07
	call	_read_spi_reg
	addw	sp, #1
	ld	_status+0, a
;	se8r01-receive-car.c: 699: if(status&STA_MARK_RX)                                                 // if receive data ready (TX_DS) interrupt
	btjt	_status+0, #6, 00205$
	jra	00103$
00205$:
;	se8r01-receive-car.c: 702: pip= (status & 0b00001110)>>1;
	ld	a, _status+0
	and	a, #0x0e
	srl	a
	clrw	x
	ld	xl, a
	ldw	_pip+0, x
;	se8r01-receive-car.c: 703: pload_width_now=read_spi_reg(iRF_CMD_R_RX_PL_WID);
	push	#0x60
	call	_read_spi_reg
	addw	sp, #1
	clrw	x
	ld	xl, a
	ldw	_pload_width_now+0, x
;	se8r01-receive-car.c: 704: read_spi_buf(RD_RX_PLOAD, rx_buf,32);             // read playload to rx_buf
	ldw	x, #_rx_buf+0
	ldw	(0x41, sp), x
	ldw	x, (0x41, sp)
	push	#0x20
	pushw	x
	push	#0x61
	call	_read_spi_buf
	addw	sp, #4
;	se8r01-receive-car.c: 705: write_spi_reg(FLUSH_RX,0);
	push	#0x00
	push	#0xe2
	call	_write_spi_reg
	addw	sp, #2
;	se8r01-receive-car.c: 707: newdata=1;
	mov	_newdata+1, #0x01
	clr	_newdata+0
;	se8r01-receive-car.c: 708: for (teller=0;teller<32;++teller)
	clrw	x
	ldw	(0x0e, sp), x
00122$:
;	se8r01-receive-car.c: 709: print_UCHAR_hex (rx_buf[teller]);
	ldw	x, (0x41, sp)
	addw	x, (0x0e, sp)
	ld	a, (x)
	push	a
	call	_print_UCHAR_hex
	pop	a
;	se8r01-receive-car.c: 708: for (teller=0;teller<32;++teller)
	ldw	x, (0x0e, sp)
	incw	x
	ldw	(0x0e, sp), x
	ldw	x, (0x0e, sp)
	cpw	x, #0x0020
	jrslt	00122$
;	se8r01-receive-car.c: 710: UARTPrintF("\n\r");
	ldw	x, #___str_6+0
	pushw	x
	call	_UARTPrintF
	addw	sp, #2
00103$:
;	se8r01-receive-car.c: 713: if (rx_buf[0]==0xac && rx_buf[1]==0xcc) //the first two are a code to only accept these lines in the transmitted lines to avoid errors
	ldw	x, #_rx_buf+0
	ldw	(0x36, sp), x
	ldw	x, (0x36, sp)
	ld	a, (x)
	cp	a, #0xac
	jreq	00209$
	jp	00112$
00209$:
	ldw	x, (0x36, sp)
	ld	a, (0x1, x)
	cp	a, #0xcc
	jreq	00212$
	jp	00112$
00212$:
;	se8r01-receive-car.c: 715: speed = (unsigned int)rx_buf[2] << 8 | (unsigned int)rx_buf[3];
	ldw	x, (0x36, sp)
	ld	a, (0x2, x)
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	y, (0x36, sp)
	ld	a, (0x3, y)
	clr	(0x38, sp)
	pushw	x
	or	a, (2, sp)
	popw	x
	ld	(0x0d, sp), a
	ld	a, xh
	or	a, (0x38, sp)
	ld	(0x0c, sp), a
;	se8r01-receive-car.c: 716: if ((speed <= 0x0210) && (speed >= 0x0190)) {
	ldw	x, (0x0c, sp)
	cpw	x, #0x0210
	jrsgt	00213$
	clr	(0x45, sp)
	jra	00214$
00213$:
	ld	a, #0x01
	ld	(0x45, sp), a
00214$:
	ldw	x, (0x0c, sp)
	cpw	x, #0x0190
	jrslt	00215$
	clr	(0x40, sp)
	jra	00216$
00215$:
	ld	a, #0x01
	ld	(0x40, sp), a
00216$:
	tnz	(0x45, sp)
	jrne	00105$
	tnz	(0x40, sp)
	jrne	00105$
;	se8r01-receive-car.c: 717: PA_ODR &= ~(1 << 2);
	ldw	x, #0x5000
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	se8r01-receive-car.c: 718: PA_ODR &= ~(1 << 1);
	ldw	x, #0x5000
	ld	a, (x)
	and	a, #0xfd
	ld	(x), a
;	se8r01-receive-car.c: 719: TIM2_CCR1H = 0; //compare capture register value for channel 1
	ldw	x, #0x5311
	clr	(x)
;	se8r01-receive-car.c: 720: TIM2_CCR1L = 0;
	ldw	x, #0x5312
	clr	(x)
00105$:
;	se8r01-receive-car.c: 725: if (speed > 0x0210) { //forward
	tnz	(0x45, sp)
	jreq	00108$
;	se8r01-receive-car.c: 726: PA_ODR &= ~(1 << 2);
	ldw	x, #0x5000
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	se8r01-receive-car.c: 727: PA_ODR |= 1 << 1;
	ldw	x, #0x5000
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	se8r01-receive-car.c: 728: TIM2_CCR1H =(speed-500)*40/256; //compare capture register value for channel 1
	ldw	x, (0x0c, sp)
	subw	x, #0x01f4
	pushw	x
	push	#0x28
	push	#0x00
	call	__mulint
	addw	sp, #4
	ldw	(0x3a, sp), x
	push	#0x00
	push	#0x01
	ldw	x, (0x3c, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	ld	a, xl
	ldw	x, #0x5311
	ld	(x), a
;	se8r01-receive-car.c: 729: TIM2_CCR1L =(speed-500)*40%256;
	push	#0x00
	push	#0x01
	ldw	x, (0x3c, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	ld	a, xl
	ldw	x, #0x5312
	ld	(x), a
00108$:
;	se8r01-receive-car.c: 731: if (speed < 0x0190) { //reverse
	tnz	(0x40, sp)
	jreq	00110$
;	se8r01-receive-car.c: 732: PA_ODR &= ~(1 << 1);
	ldw	x, #0x5000
	ld	a, (x)
	and	a, #0xfd
	ld	(x), a
;	se8r01-receive-car.c: 733: PA_ODR |= 1 << 2;
	ldw	x, #0x5000
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	se8r01-receive-car.c: 734: TIM2_CCR1H =(500-speed)*40/256; //compare capture register value for channel 1
	ldw	x, #0x01f4
	subw	x, (0x0c, sp)
	pushw	x
	push	#0x28
	push	#0x00
	call	__mulint
	addw	sp, #4
	ldw	(0x43, sp), x
	push	#0x00
	push	#0x01
	ldw	x, (0x45, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	ld	a, xl
	ldw	x, #0x5311
	ld	(x), a
;	se8r01-receive-car.c: 735: TIM2_CCR1L =(500-speed)*40%256;
	push	#0x00
	push	#0x01
	ldw	x, (0x45, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	ld	a, xl
	ldw	x, #0x5312
	ld	(x), a
00110$:
;	se8r01-receive-car.c: 738: angle = (unsigned int)rx_buf[4] << 8 | (unsigned int)rx_buf[5]; //angle of servo motor
	ldw	x, (0x36, sp)
	ld	a, (0x4, x)
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	y, (0x36, sp)
	ld	a, (0x5, y)
	clr	(0x3e, sp)
	pushw	x
	or	a, (2, sp)
	popw	x
	ld	xl, a
	ld	a, xh
	or	a, (0x3e, sp)
	ld	xh, a
;	se8r01-receive-car.c: 739: TIM2_CCR3H =(1000+angle)/256; //compare capture register value
	addw	x, #0x03e8
	ldw	(0x3c, sp), x
	push	#0x00
	push	#0x01
	ldw	x, (0x3e, sp)
	pushw	x
	call	__divsint
	addw	sp, #4
	ld	a, xl
	ldw	x, #0x5315
	ld	(x), a
;	se8r01-receive-car.c: 740: TIM2_CCR3L =(1000+angle)%256;
	push	#0x00
	push	#0x01
	ldw	x, (0x3e, sp)
	pushw	x
	call	__modsint
	addw	sp, #4
	ld	a, xl
	ldw	x, #0x5316
	ld	(x), a
00112$:
;	se8r01-receive-car.c: 742: write_spi_reg(WRITE_REG+STATUS,status);       // clear RX_DR or TX_DS or MAX_RT interrupt flag
	push	_status+0
	push	#0x27
	call	_write_spi_reg
	addw	sp, #2
00115$:
;	se8r01-receive-car.c: 747: for (x1 = 0; x1 < 50; ++x1)
	clrw	x
	ldw	(0x0a, sp), x
00131$:
	ldw	x, (0x0a, sp)
	cpw	x, #0x0032
	jrslt	00221$
	jp	00120$
00221$:
;	se8r01-receive-car.c: 748: for (y1 = 0; y1 < 50; ++y1)
	clrw	x
	ldw	(0x08, sp), x
00128$:
	ldw	x, (0x08, sp)
	cpw	x, #0x0032
	jrsge	00132$
;	se8r01-receive-car.c: 749: for (z1 = 0; z1 < 50; ++z1)
	clrw	x
	ldw	(0x06, sp), x
00125$:
	ldw	x, (0x06, sp)
	cpw	x, #0x0032
	jrsge	00129$
;	se8r01-receive-car.c: 750: __asm__("nop");
	nop
;	se8r01-receive-car.c: 749: for (z1 = 0; z1 < 50; ++z1)
	ldw	x, (0x06, sp)
	incw	x
	ldw	(0x06, sp), x
	jra	00125$
00129$:
;	se8r01-receive-car.c: 748: for (y1 = 0; y1 < 50; ++y1)
	ldw	x, (0x08, sp)
	incw	x
	ldw	(0x08, sp), x
	jra	00128$
00132$:
;	se8r01-receive-car.c: 747: for (x1 = 0; x1 < 50; ++x1)
	ldw	x, (0x0a, sp)
	incw	x
	ldw	(0x0a, sp), x
	jra	00131$
	addw	sp, #69
	ret
	.area CODE
___str_0:
	.ascii "timer init 1 = "
	.db 0x0A
	.db 0x0D
	.db 0x00
___str_1:
	.ascii "timer init 2 = "
	.db 0x0A
	.db 0x0D
	.db 0x00
___str_2:
	.ascii "start debug "
	.db 0x0A
	.db 0x0D
	.db 0x00
___str_3:
	.ascii "config = "
	.db 0x0A
	.db 0x0D
	.db 0x00
___str_4:
	.ascii "status = "
	.db 0x0A
	.db 0x0D
	.db 0x00
___str_5:
	.ascii "timer initialised = "
	.db 0x0A
	.db 0x0D
	.db 0x00
___str_6:
	.db 0x0A
	.db 0x0D
	.db 0x00
	.area INITIALIZER
__xinit__SE8R01_DR_2M:
	.dw #0x0000
__xinit__SE8R01_DR_1M:
	.dw #0x0000
__xinit__SE8R01_DR_500K:
	.dw #0x0001
__xinit__pload_width_now:
	.dw #0x0000
__xinit__newdata:
	.dw #0x0000
__xinit__signal_lv:
	.db #0x00	;  0
__xinit__pip:
	.dw #0x0000
__xinit__status:
	.db #0x00	; 0
__xinit__TX_ADDRESS:
	.db #0xB3	; 179
	.db #0x43	; 67	'C'
	.db #0x10	; 16
	.db #0x10	; 16
__xinit__ADDRESS2:
	.db #0xB1	; 177
__xinit__ADDRESS3:
	.db #0xB2	; 178
__xinit__ADDRESS4:
	.db #0xB3	; 179
__xinit__ADDRESS5:
	.db #0xB4	; 180
__xinit__ADDRESS1:
	.db #0xB0	; 176
	.db #0x43	; 67	'C'
	.db #0x10	; 16
	.db #0x10	; 16
__xinit__ADDRESS0:
	.db #0x34	; 52	'4'
	.db #0x43	; 67	'C'
	.db #0x10	; 16
	.db #0x10	; 16
__xinit__rx_buf:
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
__xinit__tx_buf:
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.area CABS (ABS)
