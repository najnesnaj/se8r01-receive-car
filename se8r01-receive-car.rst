                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.0 #8981 (Jul 11 2014) (Linux)
                                      4 ; This file was generated Sat Feb 10 11:30:09 2018
                                      5 ;--------------------------------------------------------
                                      6 	.module se8r01_receive_car
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _Init_Tim2
                                     14 	.globl _SE8R01_Init
                                     15 	.globl _SE8R01_Analog_Init
                                     16 	.globl _SE8R01_Calibration
                                     17 	.globl _rf_switch_bank
                                     18 	.globl _init_io
                                     19 	.globl _InitializeUART
                                     20 	.globl _print_UCHAR_hex
                                     21 	.globl _UARTPrintF
                                     22 	.globl _delay
                                     23 	.globl _InitializeSystemClock
                                     24 	.globl _InitializeSPI
                                     25 	.globl _read_spi_buf
                                     26 	.globl _write_spi_buf
                                     27 	.globl _read_spi_reg
                                     28 	.globl _write_spi_reg
                                     29 	.globl _write_spi
                                     30 	.globl _delayTenMicro
                                     31 	.globl _memset
                                     32 	.globl _tx_buf
                                     33 	.globl _rx_buf
                                     34 	.globl _ADDRESS0
                                     35 	.globl _ADDRESS1
                                     36 	.globl _ADDRESS5
                                     37 	.globl _ADDRESS4
                                     38 	.globl _ADDRESS3
                                     39 	.globl _ADDRESS2
                                     40 	.globl _TX_ADDRESS
                                     41 	.globl _status
                                     42 	.globl _pip
                                     43 	.globl _signal_lv
                                     44 	.globl _newdata
                                     45 	.globl _pload_width_now
                                     46 	.globl _SE8R01_DR_500K
                                     47 	.globl _SE8R01_DR_1M
                                     48 	.globl _SE8R01_DR_2M
                                     49 	.globl _myData_pip4
                                     50 	.globl _myData_pip5
                                     51 	.globl _gtemp
                                     52 ;--------------------------------------------------------
                                     53 ; ram data
                                     54 ;--------------------------------------------------------
                                     55 	.area DATA
      000001                         56 _gtemp::
      000001                         57 	.ds 5
      000006                         58 _myData_pip5::
      000006                         59 	.ds 5
      00000B                         60 _myData_pip4::
      00000B                         61 	.ds 5
                                     62 ;--------------------------------------------------------
                                     63 ; ram data
                                     64 ;--------------------------------------------------------
                                     65 	.area INITIALIZED
      000010                         66 _SE8R01_DR_2M::
      000010                         67 	.ds 2
      000012                         68 _SE8R01_DR_1M::
      000012                         69 	.ds 2
      000014                         70 _SE8R01_DR_500K::
      000014                         71 	.ds 2
      000016                         72 _pload_width_now::
      000016                         73 	.ds 2
      000018                         74 _newdata::
      000018                         75 	.ds 2
      00001A                         76 _signal_lv::
      00001A                         77 	.ds 1
      00001B                         78 _pip::
      00001B                         79 	.ds 2
      00001D                         80 _status::
      00001D                         81 	.ds 1
      00001E                         82 _TX_ADDRESS::
      00001E                         83 	.ds 4
      000022                         84 _ADDRESS2::
      000022                         85 	.ds 1
      000023                         86 _ADDRESS3::
      000023                         87 	.ds 1
      000024                         88 _ADDRESS4::
      000024                         89 	.ds 1
      000025                         90 _ADDRESS5::
      000025                         91 	.ds 1
      000026                         92 _ADDRESS1::
      000026                         93 	.ds 4
      00002A                         94 _ADDRESS0::
      00002A                         95 	.ds 4
      00002E                         96 _rx_buf::
      00002E                         97 	.ds 32
      00004E                         98 _tx_buf::
      00004E                         99 	.ds 32
                                    100 ;--------------------------------------------------------
                                    101 ; Stack segment in internal ram 
                                    102 ;--------------------------------------------------------
                                    103 	.area	SSEG
      000000                        104 __start__stack:
      000000                        105 	.ds	1
                                    106 
                                    107 ;--------------------------------------------------------
                                    108 ; absolute external ram data
                                    109 ;--------------------------------------------------------
                                    110 	.area DABS (ABS)
                                    111 ;--------------------------------------------------------
                                    112 ; interrupt vector 
                                    113 ;--------------------------------------------------------
                                    114 	.area HOME
      008000                        115 __interrupt_vect:
      008000 82 00 80 83            116 	int s_GSINIT ;reset
      008004 82 00 00 00            117 	int 0x0000 ;trap
      008008 82 00 00 00            118 	int 0x0000 ;int0
      00800C 82 00 00 00            119 	int 0x0000 ;int1
      008010 82 00 00 00            120 	int 0x0000 ;int2
      008014 82 00 00 00            121 	int 0x0000 ;int3
      008018 82 00 00 00            122 	int 0x0000 ;int4
      00801C 82 00 00 00            123 	int 0x0000 ;int5
      008020 82 00 00 00            124 	int 0x0000 ;int6
      008024 82 00 00 00            125 	int 0x0000 ;int7
      008028 82 00 00 00            126 	int 0x0000 ;int8
      00802C 82 00 00 00            127 	int 0x0000 ;int9
      008030 82 00 00 00            128 	int 0x0000 ;int10
      008034 82 00 00 00            129 	int 0x0000 ;int11
      008038 82 00 00 00            130 	int 0x0000 ;int12
      00803C 82 00 00 00            131 	int 0x0000 ;int13
      008040 82 00 00 00            132 	int 0x0000 ;int14
      008044 82 00 00 00            133 	int 0x0000 ;int15
      008048 82 00 00 00            134 	int 0x0000 ;int16
      00804C 82 00 00 00            135 	int 0x0000 ;int17
      008050 82 00 00 00            136 	int 0x0000 ;int18
      008054 82 00 00 00            137 	int 0x0000 ;int19
      008058 82 00 00 00            138 	int 0x0000 ;int20
      00805C 82 00 00 00            139 	int 0x0000 ;int21
      008060 82 00 00 00            140 	int 0x0000 ;int22
      008064 82 00 00 00            141 	int 0x0000 ;int23
      008068 82 00 00 00            142 	int 0x0000 ;int24
      00806C 82 00 00 00            143 	int 0x0000 ;int25
      008070 82 00 00 00            144 	int 0x0000 ;int26
      008074 82 00 00 00            145 	int 0x0000 ;int27
      008078 82 00 00 00            146 	int 0x0000 ;int28
      00807C 82 00 00 00            147 	int 0x0000 ;int29
                                    148 ;--------------------------------------------------------
                                    149 ; global & static initialisations
                                    150 ;--------------------------------------------------------
                                    151 	.area HOME
                                    152 	.area GSINIT
                                    153 	.area GSFINAL
                                    154 	.area GSINIT
      008083                        155 __sdcc_gs_init_startup:
      008083                        156 __sdcc_init_data:
                                    157 ; stm8_genXINIT() start
      008083 AE 00 0F         [ 2]  158 	ldw x, #l_DATA
      008086 27 07            [ 1]  159 	jreq	00002$
      008088                        160 00001$:
      008088 72 4F 00 00      [ 1]  161 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  162 	decw x
      00808D 26 F9            [ 1]  163 	jrne	00001$
      00808F                        164 00002$:
      00808F AE 00 5E         [ 2]  165 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  166 	jreq	00004$
      008094                        167 00003$:
      008094 D6 8C 30         [ 1]  168 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 0F         [ 1]  169 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  170 	decw	x
      00809B 26 F7            [ 1]  171 	jrne	00003$
      00809D                        172 00004$:
                                    173 ; stm8_genXINIT() end
                                    174 	.area GSFINAL
      00809D CC 80 80         [ 2]  175 	jp	__sdcc_program_startup
                                    176 ;--------------------------------------------------------
                                    177 ; Home
                                    178 ;--------------------------------------------------------
                                    179 	.area HOME
                                    180 	.area HOME
      008080                        181 __sdcc_program_startup:
      008080 CC 88 1C         [ 2]  182 	jp	_main
                                    183 ;	return from main will return to caller
                                    184 ;--------------------------------------------------------
                                    185 ; code
                                    186 ;--------------------------------------------------------
                                    187 	.area CODE
                                    188 ;	se8r01-receive-car.c: 39: void delayTenMicro (void) {
                                    189 ;	-----------------------------------------
                                    190 ;	 function delayTenMicro
                                    191 ;	-----------------------------------------
      0080A0                        192 _delayTenMicro:
                                    193 ;	se8r01-receive-car.c: 41: for (a = 0; a < 50; ++a)
      0080A0 A6 32            [ 1]  194 	ld	a, #0x32
      0080A2                        195 00104$:
                                    196 ;	se8r01-receive-car.c: 42: __asm__("nop");
      0080A2 9D               [ 1]  197 	nop
      0080A3 4A               [ 1]  198 	dec	a
                                    199 ;	se8r01-receive-car.c: 41: for (a = 0; a < 50; ++a)
      0080A4 4D               [ 1]  200 	tnz	a
      0080A5 26 FB            [ 1]  201 	jrne	00104$
      0080A7 81               [ 4]  202 	ret
                                    203 ;	se8r01-receive-car.c: 44: UCHAR write_spi (UCHAR value) {
                                    204 ;	-----------------------------------------
                                    205 ;	 function write_spi
                                    206 ;	-----------------------------------------
      0080A8                        207 _write_spi:
                                    208 ;	se8r01-receive-car.c: 46: delayTenMicro ();
      0080A8 CD 80 A0         [ 4]  209 	call	_delayTenMicro
                                    210 ;	se8r01-receive-car.c: 47: SPI_DR = value;
      0080AB AE 52 04         [ 2]  211 	ldw	x, #0x5204
      0080AE 7B 03            [ 1]  212 	ld	a, (0x03, sp)
      0080B0 F7               [ 1]  213 	ld	(x), a
                                    214 ;	se8r01-receive-car.c: 48: delayTenMicro ();
      0080B1 CD 80 A0         [ 4]  215 	call	_delayTenMicro
                                    216 ;	se8r01-receive-car.c: 49: while ((SPI_SR & TXE) == 0);
      0080B4                        217 00101$:
      0080B4 AE 52 03         [ 2]  218 	ldw	x, #0x5203
      0080B7 F6               [ 1]  219 	ld	a, (x)
      0080B8 A5 02            [ 1]  220 	bcp	a, #0x02
      0080BA 27 F8            [ 1]  221 	jreq	00101$
                                    222 ;	se8r01-receive-car.c: 50: delayTenMicro ();
      0080BC CD 80 A0         [ 4]  223 	call	_delayTenMicro
                                    224 ;	se8r01-receive-car.c: 51: while ((SPI_SR & RXNE) == 0);
      0080BF                        225 00104$:
      0080BF AE 52 03         [ 2]  226 	ldw	x, #0x5203
      0080C2 F6               [ 1]  227 	ld	a, (x)
      0080C3 44               [ 1]  228 	srl	a
      0080C4 24 F9            [ 1]  229 	jrnc	00104$
                                    230 ;	se8r01-receive-car.c: 52: delayTenMicro ();
      0080C6 CD 80 A0         [ 4]  231 	call	_delayTenMicro
                                    232 ;	se8r01-receive-car.c: 53: ret = SPI_DR;
      0080C9 AE 52 04         [ 2]  233 	ldw	x, #0x5204
      0080CC F6               [ 1]  234 	ld	a, (x)
                                    235 ;	se8r01-receive-car.c: 54: return (ret);
      0080CD 81               [ 4]  236 	ret
                                    237 ;	se8r01-receive-car.c: 56: UCHAR write_spi_reg (UCHAR reg, UCHAR value) {
                                    238 ;	-----------------------------------------
                                    239 ;	 function write_spi_reg
                                    240 ;	-----------------------------------------
      0080CE                        241 _write_spi_reg:
      0080CE 88               [ 1]  242 	push	a
                                    243 ;	se8r01-receive-car.c: 58: PC_ODR &= ~(1 << CSN);
      0080CF AE 50 0A         [ 2]  244 	ldw	x, #0x500a
      0080D2 F6               [ 1]  245 	ld	a, (x)
      0080D3 A4 EF            [ 1]  246 	and	a, #0xef
      0080D5 F7               [ 1]  247 	ld	(x), a
                                    248 ;	se8r01-receive-car.c: 59: ret = write_spi (reg);
      0080D6 7B 04            [ 1]  249 	ld	a, (0x04, sp)
      0080D8 88               [ 1]  250 	push	a
      0080D9 CD 80 A8         [ 4]  251 	call	_write_spi
      0080DC 5B 01            [ 2]  252 	addw	sp, #1
      0080DE 6B 01            [ 1]  253 	ld	(0x01, sp), a
                                    254 ;	se8r01-receive-car.c: 60: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
      0080E0 7B 04            [ 1]  255 	ld	a, (0x04, sp)
      0080E2 A1 FF            [ 1]  256 	cp	a, #0xff
      0080E4 27 15            [ 1]  257 	jreq	00102$
      0080E6 7B 04            [ 1]  258 	ld	a, (0x04, sp)
      0080E8 A1 E2            [ 1]  259 	cp	a, #0xe2
      0080EA 27 0F            [ 1]  260 	jreq	00102$
      0080EC 7B 04            [ 1]  261 	ld	a, (0x04, sp)
      0080EE A1 E1            [ 1]  262 	cp	a, #0xe1
      0080F0 27 09            [ 1]  263 	jreq	00102$
                                    264 ;	se8r01-receive-car.c: 61: write_spi (value);
      0080F2 7B 05            [ 1]  265 	ld	a, (0x05, sp)
      0080F4 88               [ 1]  266 	push	a
      0080F5 CD 80 A8         [ 4]  267 	call	_write_spi
      0080F8 84               [ 1]  268 	pop	a
      0080F9 20 03            [ 2]  269 	jra	00103$
      0080FB                        270 00102$:
                                    271 ;	se8r01-receive-car.c: 63: delayTenMicro ();
      0080FB CD 80 A0         [ 4]  272 	call	_delayTenMicro
      0080FE                        273 00103$:
                                    274 ;	se8r01-receive-car.c: 64: PC_ODR |= (1 << CSN);
      0080FE AE 50 0A         [ 2]  275 	ldw	x, #0x500a
      008101 F6               [ 1]  276 	ld	a, (x)
      008102 AA 10            [ 1]  277 	or	a, #0x10
      008104 F7               [ 1]  278 	ld	(x), a
                                    279 ;	se8r01-receive-car.c: 65: return (ret);
      008105 7B 01            [ 1]  280 	ld	a, (0x01, sp)
      008107 5B 01            [ 2]  281 	addw	sp, #1
      008109 81               [ 4]  282 	ret
                                    283 ;	se8r01-receive-car.c: 67: UCHAR read_spi_reg (UCHAR reg) {
                                    284 ;	-----------------------------------------
                                    285 ;	 function read_spi_reg
                                    286 ;	-----------------------------------------
      00810A                        287 _read_spi_reg:
      00810A 88               [ 1]  288 	push	a
                                    289 ;	se8r01-receive-car.c: 69: PC_ODR &= ~(1 << CSN);
      00810B AE 50 0A         [ 2]  290 	ldw	x, #0x500a
      00810E F6               [ 1]  291 	ld	a, (x)
      00810F A4 EF            [ 1]  292 	and	a, #0xef
      008111 F7               [ 1]  293 	ld	(x), a
                                    294 ;	se8r01-receive-car.c: 70: ret = write_spi (reg);
      008112 7B 04            [ 1]  295 	ld	a, (0x04, sp)
      008114 88               [ 1]  296 	push	a
      008115 CD 80 A8         [ 4]  297 	call	_write_spi
      008118 5B 01            [ 2]  298 	addw	sp, #1
      00811A 6B 01            [ 1]  299 	ld	(0x01, sp), a
                                    300 ;	se8r01-receive-car.c: 71: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
      00811C 7B 04            [ 1]  301 	ld	a, (0x04, sp)
      00811E A1 FF            [ 1]  302 	cp	a, #0xff
      008120 27 17            [ 1]  303 	jreq	00102$
      008122 7B 04            [ 1]  304 	ld	a, (0x04, sp)
      008124 A1 E2            [ 1]  305 	cp	a, #0xe2
      008126 27 11            [ 1]  306 	jreq	00102$
      008128 7B 04            [ 1]  307 	ld	a, (0x04, sp)
      00812A A1 E1            [ 1]  308 	cp	a, #0xe1
      00812C 27 0B            [ 1]  309 	jreq	00102$
                                    310 ;	se8r01-receive-car.c: 72: ret = write_spi (NOP);
      00812E 4B FF            [ 1]  311 	push	#0xff
      008130 CD 80 A8         [ 4]  312 	call	_write_spi
      008133 5B 01            [ 2]  313 	addw	sp, #1
      008135 6B 01            [ 1]  314 	ld	(0x01, sp), a
      008137 20 03            [ 2]  315 	jra	00103$
      008139                        316 00102$:
                                    317 ;	se8r01-receive-car.c: 74: delayTenMicro ();
      008139 CD 80 A0         [ 4]  318 	call	_delayTenMicro
      00813C                        319 00103$:
                                    320 ;	se8r01-receive-car.c: 75: PC_ODR |= (1 << CSN);
      00813C AE 50 0A         [ 2]  321 	ldw	x, #0x500a
      00813F F6               [ 1]  322 	ld	a, (x)
      008140 AA 10            [ 1]  323 	or	a, #0x10
      008142 F7               [ 1]  324 	ld	(x), a
                                    325 ;	se8r01-receive-car.c: 76: return (ret);
      008143 7B 01            [ 1]  326 	ld	a, (0x01, sp)
      008145 5B 01            [ 2]  327 	addw	sp, #1
      008147 81               [ 4]  328 	ret
                                    329 ;	se8r01-receive-car.c: 78: UCHAR write_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
                                    330 ;	-----------------------------------------
                                    331 ;	 function write_spi_buf
                                    332 ;	-----------------------------------------
      008148                        333 _write_spi_buf:
      008148 52 02            [ 2]  334 	sub	sp, #2
                                    335 ;	se8r01-receive-car.c: 80: PC_ODR &= ~(1 << CSN);
      00814A AE 50 0A         [ 2]  336 	ldw	x, #0x500a
      00814D F6               [ 1]  337 	ld	a, (x)
      00814E A4 EF            [ 1]  338 	and	a, #0xef
      008150 F7               [ 1]  339 	ld	(x), a
                                    340 ;	se8r01-receive-car.c: 81: ret = write_spi (reg);
      008151 7B 05            [ 1]  341 	ld	a, (0x05, sp)
      008153 88               [ 1]  342 	push	a
      008154 CD 80 A8         [ 4]  343 	call	_write_spi
      008157 5B 01            [ 2]  344 	addw	sp, #1
      008159 6B 02            [ 1]  345 	ld	(0x02, sp), a
                                    346 ;	se8r01-receive-car.c: 82: for (n = 0; n < len; ++n)
      00815B 0F 01            [ 1]  347 	clr	(0x01, sp)
      00815D                        348 00103$:
      00815D 7B 01            [ 1]  349 	ld	a, (0x01, sp)
      00815F 11 08            [ 1]  350 	cp	a, (0x08, sp)
      008161 24 11            [ 1]  351 	jrnc	00101$
                                    352 ;	se8r01-receive-car.c: 83: write_spi (array[n]);
      008163 5F               [ 1]  353 	clrw	x
      008164 7B 01            [ 1]  354 	ld	a, (0x01, sp)
      008166 97               [ 1]  355 	ld	xl, a
      008167 72 FB 06         [ 2]  356 	addw	x, (0x06, sp)
      00816A F6               [ 1]  357 	ld	a, (x)
      00816B 88               [ 1]  358 	push	a
      00816C CD 80 A8         [ 4]  359 	call	_write_spi
      00816F 84               [ 1]  360 	pop	a
                                    361 ;	se8r01-receive-car.c: 82: for (n = 0; n < len; ++n)
      008170 0C 01            [ 1]  362 	inc	(0x01, sp)
      008172 20 E9            [ 2]  363 	jra	00103$
      008174                        364 00101$:
                                    365 ;	se8r01-receive-car.c: 84: PC_ODR |= (1 << CSN);
      008174 AE 50 0A         [ 2]  366 	ldw	x, #0x500a
      008177 F6               [ 1]  367 	ld	a, (x)
      008178 AA 10            [ 1]  368 	or	a, #0x10
      00817A F7               [ 1]  369 	ld	(x), a
                                    370 ;	se8r01-receive-car.c: 85: return (ret);
      00817B 7B 02            [ 1]  371 	ld	a, (0x02, sp)
      00817D 5B 02            [ 2]  372 	addw	sp, #2
      00817F 81               [ 4]  373 	ret
                                    374 ;	se8r01-receive-car.c: 87: UCHAR read_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
                                    375 ;	-----------------------------------------
                                    376 ;	 function read_spi_buf
                                    377 ;	-----------------------------------------
      008180                        378 _read_spi_buf:
      008180 52 02            [ 2]  379 	sub	sp, #2
                                    380 ;	se8r01-receive-car.c: 89: PC_ODR &= ~(1 << CSN);
      008182 AE 50 0A         [ 2]  381 	ldw	x, #0x500a
      008185 F6               [ 1]  382 	ld	a, (x)
      008186 A4 EF            [ 1]  383 	and	a, #0xef
      008188 F7               [ 1]  384 	ld	(x), a
                                    385 ;	se8r01-receive-car.c: 90: ret = write_spi (reg);
      008189 7B 05            [ 1]  386 	ld	a, (0x05, sp)
      00818B 88               [ 1]  387 	push	a
      00818C CD 80 A8         [ 4]  388 	call	_write_spi
      00818F 5B 01            [ 2]  389 	addw	sp, #1
      008191 6B 01            [ 1]  390 	ld	(0x01, sp), a
                                    391 ;	se8r01-receive-car.c: 91: for (n = 0; n < len; ++n)
      008193 0F 02            [ 1]  392 	clr	(0x02, sp)
      008195                        393 00103$:
      008195 7B 02            [ 1]  394 	ld	a, (0x02, sp)
      008197 11 08            [ 1]  395 	cp	a, (0x08, sp)
      008199 24 15            [ 1]  396 	jrnc	00101$
                                    397 ;	se8r01-receive-car.c: 92: array[n] = write_spi (NOP);
      00819B 5F               [ 1]  398 	clrw	x
      00819C 7B 02            [ 1]  399 	ld	a, (0x02, sp)
      00819E 97               [ 1]  400 	ld	xl, a
      00819F 72 FB 06         [ 2]  401 	addw	x, (0x06, sp)
      0081A2 89               [ 2]  402 	pushw	x
      0081A3 4B FF            [ 1]  403 	push	#0xff
      0081A5 CD 80 A8         [ 4]  404 	call	_write_spi
      0081A8 5B 01            [ 2]  405 	addw	sp, #1
      0081AA 85               [ 2]  406 	popw	x
      0081AB F7               [ 1]  407 	ld	(x), a
                                    408 ;	se8r01-receive-car.c: 91: for (n = 0; n < len; ++n)
      0081AC 0C 02            [ 1]  409 	inc	(0x02, sp)
      0081AE 20 E5            [ 2]  410 	jra	00103$
      0081B0                        411 00101$:
                                    412 ;	se8r01-receive-car.c: 93: PC_ODR |= (1 << CSN);
      0081B0 AE 50 0A         [ 2]  413 	ldw	x, #0x500a
      0081B3 F6               [ 1]  414 	ld	a, (x)
      0081B4 AA 10            [ 1]  415 	or	a, #0x10
      0081B6 F7               [ 1]  416 	ld	(x), a
                                    417 ;	se8r01-receive-car.c: 94: return (ret);
      0081B7 7B 01            [ 1]  418 	ld	a, (0x01, sp)
      0081B9 5B 02            [ 2]  419 	addw	sp, #2
      0081BB 81               [ 4]  420 	ret
                                    421 ;	se8r01-receive-car.c: 96: void InitializeSPI () {
                                    422 ;	-----------------------------------------
                                    423 ;	 function InitializeSPI
                                    424 ;	-----------------------------------------
      0081BC                        425 _InitializeSPI:
                                    426 ;	se8r01-receive-car.c: 97: SPI_CR1 = MSBFIRST | SPI_ENABLE | BR_DIV256 | MASTER | CPOL0 | CPHA0;
      0081BC AE 52 00         [ 2]  427 	ldw	x, #0x5200
      0081BF A6 7C            [ 1]  428 	ld	a, #0x7c
      0081C1 F7               [ 1]  429 	ld	(x), a
                                    430 ;	se8r01-receive-car.c: 98: SPI_CR2 = BDM_2LINE | CRCEN_OFF | CRCNEXT_TXBUF | FULL_DUPLEX | SSM_DISABLE;
      0081C2 AE 52 01         [ 2]  431 	ldw	x, #0x5201
      0081C5 7F               [ 1]  432 	clr	(x)
                                    433 ;	se8r01-receive-car.c: 99: SPI_ICR = TXIE_MASKED | RXIE_MASKED | ERRIE_MASKED | WKIE_MASKED;
      0081C6 AE 52 02         [ 2]  434 	ldw	x, #0x5202
      0081C9 7F               [ 1]  435 	clr	(x)
                                    436 ;	se8r01-receive-car.c: 100: PC_DDR = (1 << PC3) | (1 << PC4); // output mode
      0081CA AE 50 0C         [ 2]  437 	ldw	x, #0x500c
      0081CD A6 18            [ 1]  438 	ld	a, #0x18
      0081CF F7               [ 1]  439 	ld	(x), a
                                    440 ;	se8r01-receive-car.c: 101: PC_CR1 = (1 << PC3) | (1 << PC4); // push-pull
      0081D0 AE 50 0D         [ 2]  441 	ldw	x, #0x500d
      0081D3 A6 18            [ 1]  442 	ld	a, #0x18
      0081D5 F7               [ 1]  443 	ld	(x), a
                                    444 ;	se8r01-receive-car.c: 102: PC_CR2 = (1 << PC3) | (1 << PC4); // up to 10MHz speed
      0081D6 AE 50 0E         [ 2]  445 	ldw	x, #0x500e
      0081D9 A6 18            [ 1]  446 	ld	a, #0x18
      0081DB F7               [ 1]  447 	ld	(x), a
                                    448 ;	se8r01-receive-car.c: 104: PC_ODR &= ~(1 << CE);
      0081DC AE 50 0A         [ 2]  449 	ldw	x, #0x500a
      0081DF F6               [ 1]  450 	ld	a, (x)
      0081E0 A4 F7            [ 1]  451 	and	a, #0xf7
      0081E2 F7               [ 1]  452 	ld	(x), a
      0081E3 81               [ 4]  453 	ret
                                    454 ;	se8r01-receive-car.c: 106: void InitializeSystemClock() {
                                    455 ;	-----------------------------------------
                                    456 ;	 function InitializeSystemClock
                                    457 ;	-----------------------------------------
      0081E4                        458 _InitializeSystemClock:
                                    459 ;	se8r01-receive-car.c: 107: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
      0081E4 AE 50 C0         [ 2]  460 	ldw	x, #0x50c0
      0081E7 7F               [ 1]  461 	clr	(x)
                                    462 ;	se8r01-receive-car.c: 108: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
      0081E8 AE 50 C0         [ 2]  463 	ldw	x, #0x50c0
      0081EB A6 01            [ 1]  464 	ld	a, #0x01
      0081ED F7               [ 1]  465 	ld	(x), a
                                    466 ;	se8r01-receive-car.c: 109: CLK_ECKR = 0;                       //  Disable the external clock.
      0081EE AE 50 C1         [ 2]  467 	ldw	x, #0x50c1
      0081F1 7F               [ 1]  468 	clr	(x)
                                    469 ;	se8r01-receive-car.c: 110: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
      0081F2                        470 00101$:
      0081F2 AE 50 C0         [ 2]  471 	ldw	x, #0x50c0
      0081F5 F6               [ 1]  472 	ld	a, (x)
      0081F6 A5 02            [ 1]  473 	bcp	a, #0x02
      0081F8 27 F8            [ 1]  474 	jreq	00101$
                                    475 ;	se8r01-receive-car.c: 111: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
      0081FA AE 50 C6         [ 2]  476 	ldw	x, #0x50c6
      0081FD 7F               [ 1]  477 	clr	(x)
                                    478 ;	se8r01-receive-car.c: 112: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
      0081FE AE 50 C7         [ 2]  479 	ldw	x, #0x50c7
      008201 A6 FF            [ 1]  480 	ld	a, #0xff
      008203 F7               [ 1]  481 	ld	(x), a
                                    482 ;	se8r01-receive-car.c: 113: CLK_PCKENR2 = 0xff;                 //  Ditto.
      008204 AE 50 CA         [ 2]  483 	ldw	x, #0x50ca
      008207 A6 FF            [ 1]  484 	ld	a, #0xff
      008209 F7               [ 1]  485 	ld	(x), a
                                    486 ;	se8r01-receive-car.c: 114: CLK_CCOR = 0;                       //  Turn off CCO.
      00820A AE 50 C9         [ 2]  487 	ldw	x, #0x50c9
      00820D 7F               [ 1]  488 	clr	(x)
                                    489 ;	se8r01-receive-car.c: 115: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
      00820E AE 50 CC         [ 2]  490 	ldw	x, #0x50cc
      008211 7F               [ 1]  491 	clr	(x)
                                    492 ;	se8r01-receive-car.c: 116: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
      008212 AE 50 CD         [ 2]  493 	ldw	x, #0x50cd
      008215 7F               [ 1]  494 	clr	(x)
                                    495 ;	se8r01-receive-car.c: 117: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
      008216 AE 50 C4         [ 2]  496 	ldw	x, #0x50c4
      008219 A6 E1            [ 1]  497 	ld	a, #0xe1
      00821B F7               [ 1]  498 	ld	(x), a
                                    499 ;	se8r01-receive-car.c: 118: CLK_SWCR = 0;                       //  Reset the clock switch control register.
      00821C AE 50 C5         [ 2]  500 	ldw	x, #0x50c5
      00821F 7F               [ 1]  501 	clr	(x)
                                    502 ;	se8r01-receive-car.c: 119: CLK_SWCR = CLK_SWEN;                //  Enable switching.
      008220 AE 50 C5         [ 2]  503 	ldw	x, #0x50c5
      008223 A6 02            [ 1]  504 	ld	a, #0x02
      008225 F7               [ 1]  505 	ld	(x), a
                                    506 ;	se8r01-receive-car.c: 120: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
      008226                        507 00104$:
      008226 AE 50 C5         [ 2]  508 	ldw	x, #0x50c5
      008229 F6               [ 1]  509 	ld	a, (x)
      00822A 44               [ 1]  510 	srl	a
      00822B 25 F9            [ 1]  511 	jrc	00104$
      00822D 81               [ 4]  512 	ret
                                    513 ;	se8r01-receive-car.c: 122: void delay (int time_ms) {
                                    514 ;	-----------------------------------------
                                    515 ;	 function delay
                                    516 ;	-----------------------------------------
      00822E                        517 _delay:
      00822E 52 0A            [ 2]  518 	sub	sp, #10
                                    519 ;	se8r01-receive-car.c: 124: for (x = 0; x < 1036*time_ms; ++x)
      008230 5F               [ 1]  520 	clrw	x
      008231 1F 03            [ 2]  521 	ldw	(0x03, sp), x
      008233 1F 01            [ 2]  522 	ldw	(0x01, sp), x
      008235 1E 0D            [ 2]  523 	ldw	x, (0x0d, sp)
      008237 89               [ 2]  524 	pushw	x
      008238 4B 0C            [ 1]  525 	push	#0x0c
      00823A 4B 04            [ 1]  526 	push	#0x04
      00823C CD 8B 29         [ 4]  527 	call	__mulint
      00823F 5B 04            [ 2]  528 	addw	sp, #4
      008241 1F 09            [ 2]  529 	ldw	(0x09, sp), x
      008243                        530 00103$:
      008243 16 09            [ 2]  531 	ldw	y, (0x09, sp)
      008245 17 07            [ 2]  532 	ldw	(0x07, sp), y
      008247 7B 07            [ 1]  533 	ld	a, (0x07, sp)
      008249 49               [ 1]  534 	rlc	a
      00824A 4F               [ 1]  535 	clr	a
      00824B A2 00            [ 1]  536 	sbc	a, #0x00
      00824D 6B 06            [ 1]  537 	ld	(0x06, sp), a
      00824F 6B 05            [ 1]  538 	ld	(0x05, sp), a
      008251 1E 03            [ 2]  539 	ldw	x, (0x03, sp)
      008253 13 07            [ 2]  540 	cpw	x, (0x07, sp)
      008255 7B 02            [ 1]  541 	ld	a, (0x02, sp)
      008257 12 06            [ 1]  542 	sbc	a, (0x06, sp)
      008259 7B 01            [ 1]  543 	ld	a, (0x01, sp)
      00825B 12 05            [ 1]  544 	sbc	a, (0x05, sp)
      00825D 2E 17            [ 1]  545 	jrsge	00105$
                                    546 ;	se8r01-receive-car.c: 125: __asm__("nop");
      00825F 9D               [ 1]  547 	nop
                                    548 ;	se8r01-receive-car.c: 124: for (x = 0; x < 1036*time_ms; ++x)
      008260 16 03            [ 2]  549 	ldw	y, (0x03, sp)
      008262 72 A9 00 01      [ 2]  550 	addw	y, #0x0001
      008266 7B 02            [ 1]  551 	ld	a, (0x02, sp)
      008268 A9 00            [ 1]  552 	adc	a, #0x00
      00826A 97               [ 1]  553 	ld	xl, a
      00826B 7B 01            [ 1]  554 	ld	a, (0x01, sp)
      00826D A9 00            [ 1]  555 	adc	a, #0x00
      00826F 95               [ 1]  556 	ld	xh, a
      008270 17 03            [ 2]  557 	ldw	(0x03, sp), y
      008272 1F 01            [ 2]  558 	ldw	(0x01, sp), x
      008274 20 CD            [ 2]  559 	jra	00103$
      008276                        560 00105$:
      008276 5B 0A            [ 2]  561 	addw	sp, #10
      008278 81               [ 4]  562 	ret
                                    563 ;	se8r01-receive-car.c: 130: void UARTPrintF (char *message) {
                                    564 ;	-----------------------------------------
                                    565 ;	 function UARTPrintF
                                    566 ;	-----------------------------------------
      008279                        567 _UARTPrintF:
                                    568 ;	se8r01-receive-car.c: 131: char *ch = message;
      008279 16 03            [ 2]  569 	ldw	y, (0x03, sp)
                                    570 ;	se8r01-receive-car.c: 132: while (*ch) {
      00827B                        571 00104$:
      00827B 90 F6            [ 1]  572 	ld	a, (y)
      00827D 4D               [ 1]  573 	tnz	a
      00827E 27 0F            [ 1]  574 	jreq	00107$
                                    575 ;	se8r01-receive-car.c: 133: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
      008280 AE 52 31         [ 2]  576 	ldw	x, #0x5231
      008283 F7               [ 1]  577 	ld	(x), a
                                    578 ;	se8r01-receive-car.c: 134: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
      008284                        579 00101$:
      008284 AE 52 30         [ 2]  580 	ldw	x, #0x5230
      008287 F6               [ 1]  581 	ld	a, (x)
      008288 48               [ 1]  582 	sll	a
      008289 24 F9            [ 1]  583 	jrnc	00101$
                                    584 ;	se8r01-receive-car.c: 135: ch++;                               //  Grab the next character.
      00828B 90 5C            [ 2]  585 	incw	y
      00828D 20 EC            [ 2]  586 	jra	00104$
      00828F                        587 00107$:
      00828F 81               [ 4]  588 	ret
                                    589 ;	se8r01-receive-car.c: 138: void print_UCHAR_hex (unsigned char buffer) {
                                    590 ;	-----------------------------------------
                                    591 ;	 function print_UCHAR_hex
                                    592 ;	-----------------------------------------
      008290                        593 _print_UCHAR_hex:
      008290 52 0C            [ 2]  594 	sub	sp, #12
                                    595 ;	se8r01-receive-car.c: 141: a = (buffer >> 4);
      008292 7B 0F            [ 1]  596 	ld	a, (0x0f, sp)
      008294 4E               [ 1]  597 	swap	a
      008295 A4 0F            [ 1]  598 	and	a, #0x0f
      008297 5F               [ 1]  599 	clrw	x
      008298 97               [ 1]  600 	ld	xl, a
                                    601 ;	se8r01-receive-car.c: 142: if (a > 9)
      008299 A3 00 09         [ 2]  602 	cpw	x, #0x0009
      00829C 2D 07            [ 1]  603 	jrsle	00102$
                                    604 ;	se8r01-receive-car.c: 143: a = a + 'a' - 10;
      00829E 1C 00 57         [ 2]  605 	addw	x, #0x0057
      0082A1 1F 03            [ 2]  606 	ldw	(0x03, sp), x
      0082A3 20 05            [ 2]  607 	jra	00103$
      0082A5                        608 00102$:
                                    609 ;	se8r01-receive-car.c: 145: a += '0'; 
      0082A5 1C 00 30         [ 2]  610 	addw	x, #0x0030
      0082A8 1F 03            [ 2]  611 	ldw	(0x03, sp), x
      0082AA                        612 00103$:
                                    613 ;	se8r01-receive-car.c: 146: b = buffer & 0x0f;
      0082AA 7B 0F            [ 1]  614 	ld	a, (0x0f, sp)
      0082AC A4 0F            [ 1]  615 	and	a, #0x0f
      0082AE 5F               [ 1]  616 	clrw	x
      0082AF 97               [ 1]  617 	ld	xl, a
                                    618 ;	se8r01-receive-car.c: 147: if (b > 9)
      0082B0 A3 00 09         [ 2]  619 	cpw	x, #0x0009
      0082B3 2D 07            [ 1]  620 	jrsle	00105$
                                    621 ;	se8r01-receive-car.c: 148: b = b + 'a' - 10;
      0082B5 1C 00 57         [ 2]  622 	addw	x, #0x0057
      0082B8 1F 01            [ 2]  623 	ldw	(0x01, sp), x
      0082BA 20 05            [ 2]  624 	jra	00106$
      0082BC                        625 00105$:
                                    626 ;	se8r01-receive-car.c: 150: b += '0'; 
      0082BC 1C 00 30         [ 2]  627 	addw	x, #0x0030
      0082BF 1F 01            [ 2]  628 	ldw	(0x01, sp), x
      0082C1                        629 00106$:
                                    630 ;	se8r01-receive-car.c: 151: message[0] = a;
      0082C1 90 96            [ 1]  631 	ldw	y, sp
      0082C3 72 A9 00 05      [ 2]  632 	addw	y, #5
      0082C7 7B 04            [ 1]  633 	ld	a, (0x04, sp)
      0082C9 90 F7            [ 1]  634 	ld	(y), a
                                    635 ;	se8r01-receive-car.c: 152: message[1] = b;
      0082CB 93               [ 1]  636 	ldw	x, y
      0082CC 5C               [ 2]  637 	incw	x
      0082CD 7B 02            [ 1]  638 	ld	a, (0x02, sp)
      0082CF F7               [ 1]  639 	ld	(x), a
                                    640 ;	se8r01-receive-car.c: 153: message[2] = 0;
      0082D0 93               [ 1]  641 	ldw	x, y
      0082D1 5C               [ 2]  642 	incw	x
      0082D2 5C               [ 2]  643 	incw	x
      0082D3 7F               [ 1]  644 	clr	(x)
                                    645 ;	se8r01-receive-car.c: 154: UARTPrintF (message);
      0082D4 90 89            [ 2]  646 	pushw	y
      0082D6 CD 82 79         [ 4]  647 	call	_UARTPrintF
      0082D9 5B 02            [ 2]  648 	addw	sp, #2
      0082DB 5B 0C            [ 2]  649 	addw	sp, #12
      0082DD 81               [ 4]  650 	ret
                                    651 ;	se8r01-receive-car.c: 157: void InitializeUART() {
                                    652 ;	-----------------------------------------
                                    653 ;	 function InitializeUART
                                    654 ;	-----------------------------------------
      0082DE                        655 _InitializeUART:
                                    656 ;	se8r01-receive-car.c: 167: UART1_CR1 = 0;
      0082DE AE 52 34         [ 2]  657 	ldw	x, #0x5234
      0082E1 7F               [ 1]  658 	clr	(x)
                                    659 ;	se8r01-receive-car.c: 168: UART1_CR2 = 0;
      0082E2 AE 52 35         [ 2]  660 	ldw	x, #0x5235
      0082E5 7F               [ 1]  661 	clr	(x)
                                    662 ;	se8r01-receive-car.c: 169: UART1_CR4 = 0;
      0082E6 AE 52 37         [ 2]  663 	ldw	x, #0x5237
      0082E9 7F               [ 1]  664 	clr	(x)
                                    665 ;	se8r01-receive-car.c: 170: UART1_CR3 = 0;
      0082EA AE 52 36         [ 2]  666 	ldw	x, #0x5236
      0082ED 7F               [ 1]  667 	clr	(x)
                                    668 ;	se8r01-receive-car.c: 171: UART1_CR5 = 0;
      0082EE AE 52 38         [ 2]  669 	ldw	x, #0x5238
      0082F1 7F               [ 1]  670 	clr	(x)
                                    671 ;	se8r01-receive-car.c: 172: UART1_GTR = 0;
      0082F2 AE 52 39         [ 2]  672 	ldw	x, #0x5239
      0082F5 7F               [ 1]  673 	clr	(x)
                                    674 ;	se8r01-receive-car.c: 173: UART1_PSCR = 0;
      0082F6 AE 52 3A         [ 2]  675 	ldw	x, #0x523a
      0082F9 7F               [ 1]  676 	clr	(x)
                                    677 ;	se8r01-receive-car.c: 177: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
      0082FA AE 52 34         [ 2]  678 	ldw	x, #0x5234
      0082FD F6               [ 1]  679 	ld	a, (x)
      0082FE A4 EF            [ 1]  680 	and	a, #0xef
      008300 F7               [ 1]  681 	ld	(x), a
                                    682 ;	se8r01-receive-car.c: 178: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
      008301 AE 52 34         [ 2]  683 	ldw	x, #0x5234
      008304 F6               [ 1]  684 	ld	a, (x)
      008305 A4 FB            [ 1]  685 	and	a, #0xfb
      008307 F7               [ 1]  686 	ld	(x), a
                                    687 ;	se8r01-receive-car.c: 179: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
      008308 AE 52 36         [ 2]  688 	ldw	x, #0x5236
      00830B F6               [ 1]  689 	ld	a, (x)
      00830C A4 DF            [ 1]  690 	and	a, #0xdf
      00830E F7               [ 1]  691 	ld	(x), a
                                    692 ;	se8r01-receive-car.c: 180: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
      00830F AE 52 36         [ 2]  693 	ldw	x, #0x5236
      008312 F6               [ 1]  694 	ld	a, (x)
      008313 A4 EF            [ 1]  695 	and	a, #0xef
      008315 F7               [ 1]  696 	ld	(x), a
                                    697 ;	se8r01-receive-car.c: 181: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
      008316 AE 52 33         [ 2]  698 	ldw	x, #0x5233
      008319 A6 0A            [ 1]  699 	ld	a, #0x0a
      00831B F7               [ 1]  700 	ld	(x), a
                                    701 ;	se8r01-receive-car.c: 182: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
      00831C AE 52 32         [ 2]  702 	ldw	x, #0x5232
      00831F A6 08            [ 1]  703 	ld	a, #0x08
      008321 F7               [ 1]  704 	ld	(x), a
                                    705 ;	se8r01-receive-car.c: 186: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
      008322 AE 52 35         [ 2]  706 	ldw	x, #0x5235
      008325 F6               [ 1]  707 	ld	a, (x)
      008326 A4 F7            [ 1]  708 	and	a, #0xf7
      008328 F7               [ 1]  709 	ld	(x), a
                                    710 ;	se8r01-receive-car.c: 187: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
      008329 AE 52 35         [ 2]  711 	ldw	x, #0x5235
      00832C F6               [ 1]  712 	ld	a, (x)
      00832D A4 FB            [ 1]  713 	and	a, #0xfb
      00832F F7               [ 1]  714 	ld	(x), a
                                    715 ;	se8r01-receive-car.c: 191: SET (UART1_CR3, CR3_CPOL);
      008330 AE 52 36         [ 2]  716 	ldw	x, #0x5236
      008333 F6               [ 1]  717 	ld	a, (x)
      008334 AA 04            [ 1]  718 	or	a, #0x04
      008336 F7               [ 1]  719 	ld	(x), a
                                    720 ;	se8r01-receive-car.c: 192: SET (UART1_CR3, CR3_CPHA);
      008337 AE 52 36         [ 2]  721 	ldw	x, #0x5236
      00833A F6               [ 1]  722 	ld	a, (x)
      00833B AA 02            [ 1]  723 	or	a, #0x02
      00833D F7               [ 1]  724 	ld	(x), a
                                    725 ;	se8r01-receive-car.c: 193: SET (UART1_CR3, CR3_LBCL);
      00833E 72 10 52 36      [ 1]  726 	bset	0x5236, #0
                                    727 ;	se8r01-receive-car.c: 197: SET (UART1_CR2, CR2_TEN);
      008342 AE 52 35         [ 2]  728 	ldw	x, #0x5235
      008345 F6               [ 1]  729 	ld	a, (x)
      008346 AA 08            [ 1]  730 	or	a, #0x08
      008348 F7               [ 1]  731 	ld	(x), a
                                    732 ;	se8r01-receive-car.c: 198: SET (UART1_CR2, CR2_REN);
      008349 AE 52 35         [ 2]  733 	ldw	x, #0x5235
      00834C F6               [ 1]  734 	ld	a, (x)
      00834D AA 04            [ 1]  735 	or	a, #0x04
      00834F F7               [ 1]  736 	ld	(x), a
                                    737 ;	se8r01-receive-car.c: 199: UART1_CR3 = CR3_CLKEN;
      008350 AE 52 36         [ 2]  738 	ldw	x, #0x5236
      008353 A6 08            [ 1]  739 	ld	a, #0x08
      008355 F7               [ 1]  740 	ld	(x), a
      008356 81               [ 4]  741 	ret
                                    742 ;	se8r01-receive-car.c: 272: void init_io(void)
                                    743 ;	-----------------------------------------
                                    744 ;	 function init_io
                                    745 ;	-----------------------------------------
      008357                        746 _init_io:
                                    747 ;	se8r01-receive-car.c: 280: PC_ODR &= ~(1 << CE);
      008357 AE 50 0A         [ 2]  748 	ldw	x, #0x500a
      00835A F6               [ 1]  749 	ld	a, (x)
      00835B A4 F7            [ 1]  750 	and	a, #0xf7
      00835D F7               [ 1]  751 	ld	(x), a
                                    752 ;	se8r01-receive-car.c: 282: PC_ODR |= (1 << CSN);
      00835E AE 50 0A         [ 2]  753 	ldw	x, #0x500a
      008361 F6               [ 1]  754 	ld	a, (x)
      008362 AA 10            [ 1]  755 	or	a, #0x10
      008364 F7               [ 1]  756 	ld	(x), a
      008365 81               [ 4]  757 	ret
                                    758 ;	se8r01-receive-car.c: 288: void rf_switch_bank(unsigned char bankindex)
                                    759 ;	-----------------------------------------
                                    760 ;	 function rf_switch_bank
                                    761 ;	-----------------------------------------
      008366                        762 _rf_switch_bank:
      008366 88               [ 1]  763 	push	a
                                    764 ;	se8r01-receive-car.c: 291: temp1 = bankindex;
      008367 7B 04            [ 1]  765 	ld	a, (0x04, sp)
      008369 6B 01            [ 1]  766 	ld	(0x01, sp), a
                                    767 ;	se8r01-receive-car.c: 293: temp0 = write_spi(iRF_BANK0_STATUS);
      00836B 4B 07            [ 1]  768 	push	#0x07
      00836D CD 80 A8         [ 4]  769 	call	_write_spi
      008370 5B 01            [ 2]  770 	addw	sp, #1
                                    771 ;	se8r01-receive-car.c: 295: if((temp0&0x80)!=temp1)
      008372 A4 80            [ 1]  772 	and	a, #0x80
      008374 11 01            [ 1]  773 	cp	a, (0x01, sp)
      008376 27 09            [ 1]  774 	jreq	00103$
                                    775 ;	se8r01-receive-car.c: 297: write_spi_reg(iRF_CMD_ACTIVATE,0x53);
      008378 4B 53            [ 1]  776 	push	#0x53
      00837A 4B 50            [ 1]  777 	push	#0x50
      00837C CD 80 CE         [ 4]  778 	call	_write_spi_reg
      00837F 5B 02            [ 2]  779 	addw	sp, #2
      008381                        780 00103$:
      008381 84               [ 1]  781 	pop	a
      008382 81               [ 4]  782 	ret
                                    783 ;	se8r01-receive-car.c: 304: void SE8R01_Calibration()
                                    784 ;	-----------------------------------------
                                    785 ;	 function SE8R01_Calibration
                                    786 ;	-----------------------------------------
      008383                        787 _SE8R01_Calibration:
      008383 52 0D            [ 2]  788 	sub	sp, #13
                                    789 ;	se8r01-receive-car.c: 307: rf_switch_bank(iBANK0);
      008385 4B 00            [ 1]  790 	push	#0x00
      008387 CD 83 66         [ 4]  791 	call	_rf_switch_bank
      00838A 84               [ 1]  792 	pop	a
                                    793 ;	se8r01-receive-car.c: 308: temp[0]=0x03;
      00838B 96               [ 1]  794 	ldw	x, sp
      00838C 5C               [ 2]  795 	incw	x
      00838D 1F 0C            [ 2]  796 	ldw	(0x0c, sp), x
      00838F 1E 0C            [ 2]  797 	ldw	x, (0x0c, sp)
      008391 A6 03            [ 1]  798 	ld	a, #0x03
      008393 F7               [ 1]  799 	ld	(x), a
                                    800 ;	se8r01-receive-car.c: 309: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_CONFIG,temp, 1);
      008394 1E 0C            [ 2]  801 	ldw	x, (0x0c, sp)
      008396 4B 01            [ 1]  802 	push	#0x01
      008398 89               [ 2]  803 	pushw	x
      008399 4B 20            [ 1]  804 	push	#0x20
      00839B CD 81 48         [ 4]  805 	call	_write_spi_buf
      00839E 5B 04            [ 2]  806 	addw	sp, #4
                                    807 ;	se8r01-receive-car.c: 311: temp[0]=0x32;
      0083A0 1E 0C            [ 2]  808 	ldw	x, (0x0c, sp)
      0083A2 A6 32            [ 1]  809 	ld	a, #0x32
      0083A4 F7               [ 1]  810 	ld	(x), a
                                    811 ;	se8r01-receive-car.c: 313: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_CH, temp,1);
      0083A5 1E 0C            [ 2]  812 	ldw	x, (0x0c, sp)
      0083A7 4B 01            [ 1]  813 	push	#0x01
      0083A9 89               [ 2]  814 	pushw	x
      0083AA 4B 25            [ 1]  815 	push	#0x25
      0083AC CD 81 48         [ 4]  816 	call	_write_spi_buf
      0083AF 5B 04            [ 2]  817 	addw	sp, #4
                                    818 ;	se8r01-receive-car.c: 317: if (SE8R01_DR_2M==1)
      0083B1 CE 00 10         [ 2]  819 	ldw	x, _SE8R01_DR_2M+0
      0083B4 A3 00 01         [ 2]  820 	cpw	x, #0x0001
      0083B7 26 07            [ 1]  821 	jrne	00105$
                                    822 ;	se8r01-receive-car.c: 318: {temp[0]=0x48;}
      0083B9 1E 0C            [ 2]  823 	ldw	x, (0x0c, sp)
      0083BB A6 48            [ 1]  824 	ld	a, #0x48
      0083BD F7               [ 1]  825 	ld	(x), a
      0083BE 20 14            [ 2]  826 	jra	00106$
      0083C0                        827 00105$:
                                    828 ;	se8r01-receive-car.c: 319: else if (SE8R01_DR_1M==1)
      0083C0 CE 00 12         [ 2]  829 	ldw	x, _SE8R01_DR_1M+0
      0083C3 A3 00 01         [ 2]  830 	cpw	x, #0x0001
      0083C6 26 07            [ 1]  831 	jrne	00102$
                                    832 ;	se8r01-receive-car.c: 320: {temp[0]=0x40;}
      0083C8 1E 0C            [ 2]  833 	ldw	x, (0x0c, sp)
      0083CA A6 40            [ 1]  834 	ld	a, #0x40
      0083CC F7               [ 1]  835 	ld	(x), a
      0083CD 20 05            [ 2]  836 	jra	00106$
      0083CF                        837 00102$:
                                    838 ;	se8r01-receive-car.c: 322: {temp[0]=0x68;}   
      0083CF 1E 0C            [ 2]  839 	ldw	x, (0x0c, sp)
      0083D1 A6 68            [ 1]  840 	ld	a, #0x68
      0083D3 F7               [ 1]  841 	ld	(x), a
      0083D4                        842 00106$:
                                    843 ;	se8r01-receive-car.c: 324: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
      0083D4 1E 0C            [ 2]  844 	ldw	x, (0x0c, sp)
      0083D6 4B 01            [ 1]  845 	push	#0x01
      0083D8 89               [ 2]  846 	pushw	x
      0083D9 4B 26            [ 1]  847 	push	#0x26
      0083DB CD 81 48         [ 4]  848 	call	_write_spi_buf
      0083DE 5B 04            [ 2]  849 	addw	sp, #4
                                    850 ;	se8r01-receive-car.c: 325: temp[0]=0x77;
      0083E0 1E 0C            [ 2]  851 	ldw	x, (0x0c, sp)
      0083E2 A6 77            [ 1]  852 	ld	a, #0x77
      0083E4 F7               [ 1]  853 	ld	(x), a
                                    854 ;	se8r01-receive-car.c: 326: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_PRE_GURD, temp,1);
      0083E5 1E 0C            [ 2]  855 	ldw	x, (0x0c, sp)
      0083E7 4B 01            [ 1]  856 	push	#0x01
      0083E9 89               [ 2]  857 	pushw	x
      0083EA 4B 3F            [ 1]  858 	push	#0x3f
      0083EC CD 81 48         [ 4]  859 	call	_write_spi_buf
      0083EF 5B 04            [ 2]  860 	addw	sp, #4
                                    861 ;	se8r01-receive-car.c: 328: rf_switch_bank(iBANK1);
      0083F1 4B 80            [ 1]  862 	push	#0x80
      0083F3 CD 83 66         [ 4]  863 	call	_rf_switch_bank
      0083F6 84               [ 1]  864 	pop	a
                                    865 ;	se8r01-receive-car.c: 329: temp[0]=0x40;
      0083F7 1E 0C            [ 2]  866 	ldw	x, (0x0c, sp)
      0083F9 A6 40            [ 1]  867 	ld	a, #0x40
      0083FB F7               [ 1]  868 	ld	(x), a
                                    869 ;	se8r01-receive-car.c: 330: temp[1]=0x00;
      0083FC 1E 0C            [ 2]  870 	ldw	x, (0x0c, sp)
      0083FE 5C               [ 2]  871 	incw	x
      0083FF 1F 06            [ 2]  872 	ldw	(0x06, sp), x
      008401 1E 06            [ 2]  873 	ldw	x, (0x06, sp)
      008403 7F               [ 1]  874 	clr	(x)
                                    875 ;	se8r01-receive-car.c: 331: temp[2]=0x10;
      008404 1E 0C            [ 2]  876 	ldw	x, (0x0c, sp)
      008406 5C               [ 2]  877 	incw	x
      008407 5C               [ 2]  878 	incw	x
      008408 1F 0A            [ 2]  879 	ldw	(0x0a, sp), x
      00840A 1E 0A            [ 2]  880 	ldw	x, (0x0a, sp)
      00840C A6 10            [ 1]  881 	ld	a, #0x10
      00840E F7               [ 1]  882 	ld	(x), a
                                    883 ;	se8r01-receive-car.c: 333: {temp[3]=0xE6;}
      00840F 1E 0C            [ 2]  884 	ldw	x, (0x0c, sp)
      008411 1C 00 03         [ 2]  885 	addw	x, #0x0003
      008414 1F 08            [ 2]  886 	ldw	(0x08, sp), x
                                    887 ;	se8r01-receive-car.c: 332: if (SE8R01_DR_2M==1)
      008416 CE 00 10         [ 2]  888 	ldw	x, _SE8R01_DR_2M+0
      008419 A3 00 01         [ 2]  889 	cpw	x, #0x0001
      00841C 26 07            [ 1]  890 	jrne	00108$
                                    891 ;	se8r01-receive-car.c: 333: {temp[3]=0xE6;}
      00841E 1E 08            [ 2]  892 	ldw	x, (0x08, sp)
      008420 A6 E6            [ 1]  893 	ld	a, #0xe6
      008422 F7               [ 1]  894 	ld	(x), a
      008423 20 05            [ 2]  895 	jra	00109$
      008425                        896 00108$:
                                    897 ;	se8r01-receive-car.c: 335: {temp[3]=0xE4;}
      008425 1E 08            [ 2]  898 	ldw	x, (0x08, sp)
      008427 A6 E4            [ 1]  899 	ld	a, #0xe4
      008429 F7               [ 1]  900 	ld	(x), a
      00842A                        901 00109$:
                                    902 ;	se8r01-receive-car.c: 337: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp, 4);
      00842A 1E 0C            [ 2]  903 	ldw	x, (0x0c, sp)
      00842C 4B 04            [ 1]  904 	push	#0x04
      00842E 89               [ 2]  905 	pushw	x
      00842F 4B 21            [ 1]  906 	push	#0x21
      008431 CD 81 48         [ 4]  907 	call	_write_spi_buf
      008434 5B 04            [ 2]  908 	addw	sp, #4
                                    909 ;	se8r01-receive-car.c: 339: temp[0]=0x20;
      008436 1E 0C            [ 2]  910 	ldw	x, (0x0c, sp)
      008438 A6 20            [ 1]  911 	ld	a, #0x20
      00843A F7               [ 1]  912 	ld	(x), a
                                    913 ;	se8r01-receive-car.c: 340: temp[1]=0x08;
      00843B 1E 06            [ 2]  914 	ldw	x, (0x06, sp)
      00843D A6 08            [ 1]  915 	ld	a, #0x08
      00843F F7               [ 1]  916 	ld	(x), a
                                    917 ;	se8r01-receive-car.c: 341: temp[2]=0x50;
      008440 1E 0A            [ 2]  918 	ldw	x, (0x0a, sp)
      008442 A6 50            [ 1]  919 	ld	a, #0x50
      008444 F7               [ 1]  920 	ld	(x), a
                                    921 ;	se8r01-receive-car.c: 342: temp[3]=0x40;
      008445 1E 08            [ 2]  922 	ldw	x, (0x08, sp)
      008447 A6 40            [ 1]  923 	ld	a, #0x40
      008449 F7               [ 1]  924 	ld	(x), a
                                    925 ;	se8r01-receive-car.c: 343: temp[4]=0x50;
      00844A 1E 0C            [ 2]  926 	ldw	x, (0x0c, sp)
      00844C A6 50            [ 1]  927 	ld	a, #0x50
      00844E E7 04            [ 1]  928 	ld	(0x0004, x), a
                                    929 ;	se8r01-receive-car.c: 344: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp, 5);
      008450 1E 0C            [ 2]  930 	ldw	x, (0x0c, sp)
      008452 4B 05            [ 1]  931 	push	#0x05
      008454 89               [ 2]  932 	pushw	x
      008455 4B 23            [ 1]  933 	push	#0x23
      008457 CD 81 48         [ 4]  934 	call	_write_spi_buf
      00845A 5B 04            [ 2]  935 	addw	sp, #4
                                    936 ;	se8r01-receive-car.c: 346: temp[0]=0x00;
      00845C 1E 0C            [ 2]  937 	ldw	x, (0x0c, sp)
      00845E 7F               [ 1]  938 	clr	(x)
                                    939 ;	se8r01-receive-car.c: 347: temp[1]=0x00;
      00845F 1E 06            [ 2]  940 	ldw	x, (0x06, sp)
      008461 7F               [ 1]  941 	clr	(x)
                                    942 ;	se8r01-receive-car.c: 348: if (SE8R01_DR_2M==1)
      008462 CE 00 10         [ 2]  943 	ldw	x, _SE8R01_DR_2M+0
      008465 A3 00 01         [ 2]  944 	cpw	x, #0x0001
      008468 26 07            [ 1]  945 	jrne	00111$
                                    946 ;	se8r01-receive-car.c: 349: { temp[2]=0x1E;}
      00846A 1E 0A            [ 2]  947 	ldw	x, (0x0a, sp)
      00846C A6 1E            [ 1]  948 	ld	a, #0x1e
      00846E F7               [ 1]  949 	ld	(x), a
      00846F 20 05            [ 2]  950 	jra	00112$
      008471                        951 00111$:
                                    952 ;	se8r01-receive-car.c: 351: { temp[2]=0x1F;}
      008471 1E 0A            [ 2]  953 	ldw	x, (0x0a, sp)
      008473 A6 1F            [ 1]  954 	ld	a, #0x1f
      008475 F7               [ 1]  955 	ld	(x), a
      008476                        956 00112$:
                                    957 ;	se8r01-receive-car.c: 353: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_IF_FREQ, temp, 3);
      008476 1E 0C            [ 2]  958 	ldw	x, (0x0c, sp)
      008478 4B 03            [ 1]  959 	push	#0x03
      00847A 89               [ 2]  960 	pushw	x
      00847B 4B 2A            [ 1]  961 	push	#0x2a
      00847D CD 81 48         [ 4]  962 	call	_write_spi_buf
      008480 5B 04            [ 2]  963 	addw	sp, #4
                                    964 ;	se8r01-receive-car.c: 355: if (SE8R01_DR_2M==1)
      008482 CE 00 10         [ 2]  965 	ldw	x, _SE8R01_DR_2M+0
      008485 A3 00 01         [ 2]  966 	cpw	x, #0x0001
      008488 26 07            [ 1]  967 	jrne	00114$
                                    968 ;	se8r01-receive-car.c: 356: { temp[0]=0x29;}
      00848A 1E 0C            [ 2]  969 	ldw	x, (0x0c, sp)
      00848C A6 29            [ 1]  970 	ld	a, #0x29
      00848E F7               [ 1]  971 	ld	(x), a
      00848F 20 05            [ 2]  972 	jra	00115$
      008491                        973 00114$:
                                    974 ;	se8r01-receive-car.c: 358: { temp[0]=0x14;}
      008491 1E 0C            [ 2]  975 	ldw	x, (0x0c, sp)
      008493 A6 14            [ 1]  976 	ld	a, #0x14
      008495 F7               [ 1]  977 	ld	(x), a
      008496                        978 00115$:
                                    979 ;	se8r01-receive-car.c: 360: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp, 1);
      008496 1E 0C            [ 2]  980 	ldw	x, (0x0c, sp)
      008498 4B 01            [ 1]  981 	push	#0x01
      00849A 89               [ 2]  982 	pushw	x
      00849B 4B 2C            [ 1]  983 	push	#0x2c
      00849D CD 81 48         [ 4]  984 	call	_write_spi_buf
      0084A0 5B 04            [ 2]  985 	addw	sp, #4
                                    986 ;	se8r01-receive-car.c: 362: temp[0]=0x00;
      0084A2 1E 0C            [ 2]  987 	ldw	x, (0x0c, sp)
      0084A4 7F               [ 1]  988 	clr	(x)
                                    989 ;	se8r01-receive-car.c: 363: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_LOW,temp,1);
      0084A5 1E 0C            [ 2]  990 	ldw	x, (0x0c, sp)
      0084A7 4B 01            [ 1]  991 	push	#0x01
      0084A9 89               [ 2]  992 	pushw	x
      0084AA 4B 37            [ 1]  993 	push	#0x37
      0084AC CD 81 48         [ 4]  994 	call	_write_spi_buf
      0084AF 5B 04            [ 2]  995 	addw	sp, #4
                                    996 ;	se8r01-receive-car.c: 365: temp[0]=0x7F;
      0084B1 1E 0C            [ 2]  997 	ldw	x, (0x0c, sp)
      0084B3 A6 7F            [ 1]  998 	ld	a, #0x7f
      0084B5 F7               [ 1]  999 	ld	(x), a
                                   1000 ;	se8r01-receive-car.c: 366: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_HI,temp,1);
      0084B6 1E 0C            [ 2] 1001 	ldw	x, (0x0c, sp)
      0084B8 4B 01            [ 1] 1002 	push	#0x01
      0084BA 89               [ 2] 1003 	pushw	x
      0084BB 4B 38            [ 1] 1004 	push	#0x38
      0084BD CD 81 48         [ 4] 1005 	call	_write_spi_buf
      0084C0 5B 04            [ 2] 1006 	addw	sp, #4
                                   1007 ;	se8r01-receive-car.c: 368: temp[0]=0x02;
      0084C2 1E 0C            [ 2] 1008 	ldw	x, (0x0c, sp)
      0084C4 A6 02            [ 1] 1009 	ld	a, #0x02
      0084C6 F7               [ 1] 1010 	ld	(x), a
                                   1011 ;	se8r01-receive-car.c: 369: temp[1]=0xC1;
      0084C7 1E 06            [ 2] 1012 	ldw	x, (0x06, sp)
      0084C9 A6 C1            [ 1] 1013 	ld	a, #0xc1
      0084CB F7               [ 1] 1014 	ld	(x), a
                                   1015 ;	se8r01-receive-car.c: 370: temp[2]=0xEB;            
      0084CC 1E 0A            [ 2] 1016 	ldw	x, (0x0a, sp)
      0084CE A6 EB            [ 1] 1017 	ld	a, #0xeb
      0084D0 F7               [ 1] 1018 	ld	(x), a
                                   1019 ;	se8r01-receive-car.c: 371: temp[3]=0x1C;
      0084D1 1E 08            [ 2] 1020 	ldw	x, (0x08, sp)
      0084D3 A6 1C            [ 1] 1021 	ld	a, #0x1c
      0084D5 F7               [ 1] 1022 	ld	(x), a
                                   1023 ;	se8r01-receive-car.c: 372: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
      0084D6 1E 0C            [ 2] 1024 	ldw	x, (0x0c, sp)
      0084D8 4B 04            [ 1] 1025 	push	#0x04
      0084DA 89               [ 2] 1026 	pushw	x
      0084DB 4B 3D            [ 1] 1027 	push	#0x3d
      0084DD CD 81 48         [ 4] 1028 	call	_write_spi_buf
      0084E0 5B 04            [ 2] 1029 	addw	sp, #4
                                   1030 ;	se8r01-receive-car.c: 374: temp[0]=0x97;
      0084E2 1E 0C            [ 2] 1031 	ldw	x, (0x0c, sp)
      0084E4 A6 97            [ 1] 1032 	ld	a, #0x97
      0084E6 F7               [ 1] 1033 	ld	(x), a
                                   1034 ;	se8r01-receive-car.c: 375: temp[1]=0x64;
      0084E7 1E 06            [ 2] 1035 	ldw	x, (0x06, sp)
      0084E9 A6 64            [ 1] 1036 	ld	a, #0x64
      0084EB F7               [ 1] 1037 	ld	(x), a
                                   1038 ;	se8r01-receive-car.c: 376: temp[2]=0x00;
      0084EC 1E 0A            [ 2] 1039 	ldw	x, (0x0a, sp)
      0084EE 7F               [ 1] 1040 	clr	(x)
                                   1041 ;	se8r01-receive-car.c: 377: temp[3]=0x81;
      0084EF 1E 08            [ 2] 1042 	ldw	x, (0x08, sp)
      0084F1 A6 81            [ 1] 1043 	ld	a, #0x81
      0084F3 F7               [ 1] 1044 	ld	(x), a
                                   1045 ;	se8r01-receive-car.c: 378: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp, 4);
      0084F4 1E 0C            [ 2] 1046 	ldw	x, (0x0c, sp)
      0084F6 4B 04            [ 1] 1047 	push	#0x04
      0084F8 89               [ 2] 1048 	pushw	x
      0084F9 4B 3E            [ 1] 1049 	push	#0x3e
      0084FB CD 81 48         [ 4] 1050 	call	_write_spi_buf
      0084FE 5B 04            [ 2] 1051 	addw	sp, #4
                                   1052 ;	se8r01-receive-car.c: 379: rf_switch_bank(iBANK0);
      008500 4B 00            [ 1] 1053 	push	#0x00
      008502 CD 83 66         [ 4] 1054 	call	_rf_switch_bank
      008505 84               [ 1] 1055 	pop	a
                                   1056 ;	se8r01-receive-car.c: 384: delayTenMicro();
      008506 CD 80 A0         [ 4] 1057 	call	_delayTenMicro
                                   1058 ;	se8r01-receive-car.c: 385: PC_ODR |= (1 << CE);
      008509 AE 50 0A         [ 2] 1059 	ldw	x, #0x500a
      00850C F6               [ 1] 1060 	ld	a, (x)
      00850D AA 08            [ 1] 1061 	or	a, #0x08
      00850F F7               [ 1] 1062 	ld	(x), a
                                   1063 ;	se8r01-receive-car.c: 386: delayTenMicro();
      008510 CD 80 A0         [ 4] 1064 	call	_delayTenMicro
                                   1065 ;	se8r01-receive-car.c: 387: delayTenMicro();
      008513 CD 80 A0         [ 4] 1066 	call	_delayTenMicro
                                   1067 ;	se8r01-receive-car.c: 388: delayTenMicro();
      008516 CD 80 A0         [ 4] 1068 	call	_delayTenMicro
                                   1069 ;	se8r01-receive-car.c: 389: PC_ODR &= ~(1 << CE);
      008519 AE 50 0A         [ 2] 1070 	ldw	x, #0x500a
      00851C F6               [ 1] 1071 	ld	a, (x)
      00851D A4 F7            [ 1] 1072 	and	a, #0xf7
      00851F F7               [ 1] 1073 	ld	(x), a
                                   1074 ;	se8r01-receive-car.c: 390: delay(50);                            // delay 50ms waitting for calibaration.
      008520 4B 32            [ 1] 1075 	push	#0x32
      008522 4B 00            [ 1] 1076 	push	#0x00
      008524 CD 82 2E         [ 4] 1077 	call	_delay
      008527 5B 02            [ 2] 1078 	addw	sp, #2
                                   1079 ;	se8r01-receive-car.c: 395: delayTenMicro();
      008529 CD 80 A0         [ 4] 1080 	call	_delayTenMicro
                                   1081 ;	se8r01-receive-car.c: 396: PC_ODR |= (1 << CE);
      00852C AE 50 0A         [ 2] 1082 	ldw	x, #0x500a
      00852F F6               [ 1] 1083 	ld	a, (x)
      008530 AA 08            [ 1] 1084 	or	a, #0x08
      008532 F7               [ 1] 1085 	ld	(x), a
                                   1086 ;	se8r01-receive-car.c: 397: delayTenMicro();
      008533 CD 80 A0         [ 4] 1087 	call	_delayTenMicro
                                   1088 ;	se8r01-receive-car.c: 398: delayTenMicro();
      008536 CD 80 A0         [ 4] 1089 	call	_delayTenMicro
                                   1090 ;	se8r01-receive-car.c: 399: delayTenMicro();
      008539 CD 80 A0         [ 4] 1091 	call	_delayTenMicro
                                   1092 ;	se8r01-receive-car.c: 400: PC_ODR &= ~(1 << CE);
      00853C AE 50 0A         [ 2] 1093 	ldw	x, #0x500a
      00853F F6               [ 1] 1094 	ld	a, (x)
      008540 A4 F7            [ 1] 1095 	and	a, #0xf7
      008542 F7               [ 1] 1096 	ld	(x), a
                                   1097 ;	se8r01-receive-car.c: 401: delay(50);                            // delay 50ms waitting for calibaration.
      008543 4B 32            [ 1] 1098 	push	#0x32
      008545 4B 00            [ 1] 1099 	push	#0x00
      008547 CD 82 2E         [ 4] 1100 	call	_delay
      00854A 5B 02            [ 2] 1101 	addw	sp, #2
      00854C 5B 0D            [ 2] 1102 	addw	sp, #13
      00854E 81               [ 4] 1103 	ret
                                   1104 ;	se8r01-receive-car.c: 405: void SE8R01_Analog_Init()           //SE8R01 初始化
                                   1105 ;	-----------------------------------------
                                   1106 ;	 function SE8R01_Analog_Init
                                   1107 ;	-----------------------------------------
      00854F                       1108 _SE8R01_Analog_Init:
      00854F 52 15            [ 2] 1109 	sub	sp, #21
                                   1110 ;	se8r01-receive-car.c: 410: gtemp[0]=0x28;
      008551 AE 00 01         [ 2] 1111 	ldw	x, #_gtemp+0
      008554 1F 0E            [ 2] 1112 	ldw	(0x0e, sp), x
      008556 1E 0E            [ 2] 1113 	ldw	x, (0x0e, sp)
      008558 A6 28            [ 1] 1114 	ld	a, #0x28
      00855A F7               [ 1] 1115 	ld	(x), a
                                   1116 ;	se8r01-receive-car.c: 411: gtemp[1]=0x32;
      00855B 1E 0E            [ 2] 1117 	ldw	x, (0x0e, sp)
      00855D 5C               [ 2] 1118 	incw	x
      00855E 1F 0C            [ 2] 1119 	ldw	(0x0c, sp), x
      008560 1E 0C            [ 2] 1120 	ldw	x, (0x0c, sp)
      008562 A6 32            [ 1] 1121 	ld	a, #0x32
      008564 F7               [ 1] 1122 	ld	(x), a
                                   1123 ;	se8r01-receive-car.c: 412: gtemp[2]=0x80;
      008565 1E 0E            [ 2] 1124 	ldw	x, (0x0e, sp)
      008567 5C               [ 2] 1125 	incw	x
      008568 5C               [ 2] 1126 	incw	x
      008569 1F 0A            [ 2] 1127 	ldw	(0x0a, sp), x
      00856B 1E 0A            [ 2] 1128 	ldw	x, (0x0a, sp)
      00856D A6 80            [ 1] 1129 	ld	a, #0x80
      00856F F7               [ 1] 1130 	ld	(x), a
                                   1131 ;	se8r01-receive-car.c: 413: gtemp[3]=0x90;
      008570 1E 0E            [ 2] 1132 	ldw	x, (0x0e, sp)
      008572 1C 00 03         [ 2] 1133 	addw	x, #0x0003
      008575 1F 08            [ 2] 1134 	ldw	(0x08, sp), x
      008577 1E 08            [ 2] 1135 	ldw	x, (0x08, sp)
      008579 A6 90            [ 1] 1136 	ld	a, #0x90
      00857B F7               [ 1] 1137 	ld	(x), a
                                   1138 ;	se8r01-receive-car.c: 414: gtemp[4]=0x00;
      00857C 1E 0E            [ 2] 1139 	ldw	x, (0x0e, sp)
      00857E 1C 00 04         [ 2] 1140 	addw	x, #0x0004
      008581 7F               [ 1] 1141 	clr	(x)
                                   1142 ;	se8r01-receive-car.c: 415: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_SETUP_VALUE, gtemp, 5);
      008582 1E 0E            [ 2] 1143 	ldw	x, (0x0e, sp)
      008584 4B 05            [ 1] 1144 	push	#0x05
      008586 89               [ 2] 1145 	pushw	x
      008587 4B 3E            [ 1] 1146 	push	#0x3e
      008589 CD 81 48         [ 4] 1147 	call	_write_spi_buf
      00858C 5B 04            [ 2] 1148 	addw	sp, #4
                                   1149 ;	se8r01-receive-car.c: 416: delay(2);
      00858E 4B 02            [ 1] 1150 	push	#0x02
      008590 4B 00            [ 1] 1151 	push	#0x00
      008592 CD 82 2E         [ 4] 1152 	call	_delay
      008595 5B 02            [ 2] 1153 	addw	sp, #2
                                   1154 ;	se8r01-receive-car.c: 419: rf_switch_bank(iBANK1);
      008597 4B 80            [ 1] 1155 	push	#0x80
      008599 CD 83 66         [ 4] 1156 	call	_rf_switch_bank
      00859C 84               [ 1] 1157 	pop	a
                                   1158 ;	se8r01-receive-car.c: 421: temp[0]=0x40;
      00859D 96               [ 1] 1159 	ldw	x, sp
      00859E 5C               [ 2] 1160 	incw	x
      00859F 1F 06            [ 2] 1161 	ldw	(0x06, sp), x
      0085A1 1E 06            [ 2] 1162 	ldw	x, (0x06, sp)
      0085A3 A6 40            [ 1] 1163 	ld	a, #0x40
      0085A5 F7               [ 1] 1164 	ld	(x), a
                                   1165 ;	se8r01-receive-car.c: 422: temp[1]=0x01;               
      0085A6 1E 06            [ 2] 1166 	ldw	x, (0x06, sp)
      0085A8 5C               [ 2] 1167 	incw	x
      0085A9 1F 14            [ 2] 1168 	ldw	(0x14, sp), x
      0085AB 1E 14            [ 2] 1169 	ldw	x, (0x14, sp)
      0085AD A6 01            [ 1] 1170 	ld	a, #0x01
      0085AF F7               [ 1] 1171 	ld	(x), a
                                   1172 ;	se8r01-receive-car.c: 423: temp[2]=0x30;               
      0085B0 1E 06            [ 2] 1173 	ldw	x, (0x06, sp)
      0085B2 5C               [ 2] 1174 	incw	x
      0085B3 5C               [ 2] 1175 	incw	x
      0085B4 1F 12            [ 2] 1176 	ldw	(0x12, sp), x
      0085B6 1E 12            [ 2] 1177 	ldw	x, (0x12, sp)
      0085B8 A6 30            [ 1] 1178 	ld	a, #0x30
      0085BA F7               [ 1] 1179 	ld	(x), a
                                   1180 ;	se8r01-receive-car.c: 425: { temp[3]=0xE2; }              
      0085BB 1E 06            [ 2] 1181 	ldw	x, (0x06, sp)
      0085BD 1C 00 03         [ 2] 1182 	addw	x, #0x0003
      0085C0 1F 10            [ 2] 1183 	ldw	(0x10, sp), x
                                   1184 ;	se8r01-receive-car.c: 424: if (SE8R01_DR_2M==1)
      0085C2 CE 00 10         [ 2] 1185 	ldw	x, _SE8R01_DR_2M+0
      0085C5 A3 00 01         [ 2] 1186 	cpw	x, #0x0001
      0085C8 26 07            [ 1] 1187 	jrne	00102$
                                   1188 ;	se8r01-receive-car.c: 425: { temp[3]=0xE2; }              
      0085CA 1E 10            [ 2] 1189 	ldw	x, (0x10, sp)
      0085CC A6 E2            [ 1] 1190 	ld	a, #0xe2
      0085CE F7               [ 1] 1191 	ld	(x), a
      0085CF 20 05            [ 2] 1192 	jra	00103$
      0085D1                       1193 00102$:
                                   1194 ;	se8r01-receive-car.c: 427: { temp[3]=0xE0;}
      0085D1 1E 10            [ 2] 1195 	ldw	x, (0x10, sp)
      0085D3 A6 E0            [ 1] 1196 	ld	a, #0xe0
      0085D5 F7               [ 1] 1197 	ld	(x), a
      0085D6                       1198 00103$:
                                   1199 ;	se8r01-receive-car.c: 429: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp,4);
      0085D6 1E 06            [ 2] 1200 	ldw	x, (0x06, sp)
      0085D8 4B 04            [ 1] 1201 	push	#0x04
      0085DA 89               [ 2] 1202 	pushw	x
      0085DB 4B 21            [ 1] 1203 	push	#0x21
      0085DD CD 81 48         [ 4] 1204 	call	_write_spi_buf
      0085E0 5B 04            [ 2] 1205 	addw	sp, #4
                                   1206 ;	se8r01-receive-car.c: 431: temp[0]=0x29;
      0085E2 1E 06            [ 2] 1207 	ldw	x, (0x06, sp)
      0085E4 A6 29            [ 1] 1208 	ld	a, #0x29
      0085E6 F7               [ 1] 1209 	ld	(x), a
                                   1210 ;	se8r01-receive-car.c: 432: temp[1]=0x89;
      0085E7 1E 14            [ 2] 1211 	ldw	x, (0x14, sp)
      0085E9 A6 89            [ 1] 1212 	ld	a, #0x89
      0085EB F7               [ 1] 1213 	ld	(x), a
                                   1214 ;	se8r01-receive-car.c: 433: temp[2]=0x55;                     
      0085EC 1E 12            [ 2] 1215 	ldw	x, (0x12, sp)
      0085EE A6 55            [ 1] 1216 	ld	a, #0x55
      0085F0 F7               [ 1] 1217 	ld	(x), a
                                   1218 ;	se8r01-receive-car.c: 434: temp[3]=0x40;
      0085F1 1E 10            [ 2] 1219 	ldw	x, (0x10, sp)
      0085F3 A6 40            [ 1] 1220 	ld	a, #0x40
      0085F5 F7               [ 1] 1221 	ld	(x), a
                                   1222 ;	se8r01-receive-car.c: 435: temp[4]=0x50;
      0085F6 1E 06            [ 2] 1223 	ldw	x, (0x06, sp)
      0085F8 A6 50            [ 1] 1224 	ld	a, #0x50
      0085FA E7 04            [ 1] 1225 	ld	(0x0004, x), a
                                   1226 ;	se8r01-receive-car.c: 436: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp,5);
      0085FC 1E 06            [ 2] 1227 	ldw	x, (0x06, sp)
      0085FE 4B 05            [ 1] 1228 	push	#0x05
      008600 89               [ 2] 1229 	pushw	x
      008601 4B 23            [ 1] 1230 	push	#0x23
      008603 CD 81 48         [ 4] 1231 	call	_write_spi_buf
      008606 5B 04            [ 2] 1232 	addw	sp, #4
                                   1233 ;	se8r01-receive-car.c: 438: if (SE8R01_DR_2M==1)
      008608 CE 00 10         [ 2] 1234 	ldw	x, _SE8R01_DR_2M+0
      00860B A3 00 01         [ 2] 1235 	cpw	x, #0x0001
      00860E 26 07            [ 1] 1236 	jrne	00105$
                                   1237 ;	se8r01-receive-car.c: 439: { temp[0]=0x29;}
      008610 1E 06            [ 2] 1238 	ldw	x, (0x06, sp)
      008612 A6 29            [ 1] 1239 	ld	a, #0x29
      008614 F7               [ 1] 1240 	ld	(x), a
      008615 20 05            [ 2] 1241 	jra	00106$
      008617                       1242 00105$:
                                   1243 ;	se8r01-receive-car.c: 441: { temp[0]=0x14;}
      008617 1E 06            [ 2] 1244 	ldw	x, (0x06, sp)
      008619 A6 14            [ 1] 1245 	ld	a, #0x14
      00861B F7               [ 1] 1246 	ld	(x), a
      00861C                       1247 00106$:
                                   1248 ;	se8r01-receive-car.c: 443: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp,1);
      00861C 1E 06            [ 2] 1249 	ldw	x, (0x06, sp)
      00861E 4B 01            [ 1] 1250 	push	#0x01
      008620 89               [ 2] 1251 	pushw	x
      008621 4B 2C            [ 1] 1252 	push	#0x2c
      008623 CD 81 48         [ 4] 1253 	call	_write_spi_buf
      008626 5B 04            [ 2] 1254 	addw	sp, #4
                                   1255 ;	se8r01-receive-car.c: 445: temp[0]=0x55;
      008628 1E 06            [ 2] 1256 	ldw	x, (0x06, sp)
      00862A A6 55            [ 1] 1257 	ld	a, #0x55
      00862C F7               [ 1] 1258 	ld	(x), a
                                   1259 ;	se8r01-receive-car.c: 446: temp[1]=0xC2;
      00862D 1E 14            [ 2] 1260 	ldw	x, (0x14, sp)
      00862F A6 C2            [ 1] 1261 	ld	a, #0xc2
      008631 F7               [ 1] 1262 	ld	(x), a
                                   1263 ;	se8r01-receive-car.c: 447: temp[2]=0x09;
      008632 1E 12            [ 2] 1264 	ldw	x, (0x12, sp)
      008634 A6 09            [ 1] 1265 	ld	a, #0x09
      008636 F7               [ 1] 1266 	ld	(x), a
                                   1267 ;	se8r01-receive-car.c: 448: temp[3]=0xAC;  
      008637 1E 10            [ 2] 1268 	ldw	x, (0x10, sp)
      008639 A6 AC            [ 1] 1269 	ld	a, #0xac
      00863B F7               [ 1] 1270 	ld	(x), a
                                   1271 ;	se8r01-receive-car.c: 449: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RX_CTRL,temp,4);
      00863C 1E 06            [ 2] 1272 	ldw	x, (0x06, sp)
      00863E 4B 04            [ 1] 1273 	push	#0x04
      008640 89               [ 2] 1274 	pushw	x
      008641 4B 31            [ 1] 1275 	push	#0x31
      008643 CD 81 48         [ 4] 1276 	call	_write_spi_buf
      008646 5B 04            [ 2] 1277 	addw	sp, #4
                                   1278 ;	se8r01-receive-car.c: 451: temp[0]=0x00;
      008648 1E 06            [ 2] 1279 	ldw	x, (0x06, sp)
      00864A 7F               [ 1] 1280 	clr	(x)
                                   1281 ;	se8r01-receive-car.c: 452: temp[1]=0x14;
      00864B 1E 14            [ 2] 1282 	ldw	x, (0x14, sp)
      00864D A6 14            [ 1] 1283 	ld	a, #0x14
      00864F F7               [ 1] 1284 	ld	(x), a
                                   1285 ;	se8r01-receive-car.c: 453: temp[2]=0x08;   
      008650 1E 12            [ 2] 1286 	ldw	x, (0x12, sp)
      008652 A6 08            [ 1] 1287 	ld	a, #0x08
      008654 F7               [ 1] 1288 	ld	(x), a
                                   1289 ;	se8r01-receive-car.c: 454: temp[3]=0x29;
      008655 1E 10            [ 2] 1290 	ldw	x, (0x10, sp)
      008657 A6 29            [ 1] 1291 	ld	a, #0x29
      008659 F7               [ 1] 1292 	ld	(x), a
                                   1293 ;	se8r01-receive-car.c: 455: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FAGC_CTRL_1, temp,4);
      00865A 1E 06            [ 2] 1294 	ldw	x, (0x06, sp)
      00865C 4B 04            [ 1] 1295 	push	#0x04
      00865E 89               [ 2] 1296 	pushw	x
      00865F 4B 33            [ 1] 1297 	push	#0x33
      008661 CD 81 48         [ 4] 1298 	call	_write_spi_buf
      008664 5B 04            [ 2] 1299 	addw	sp, #4
                                   1300 ;	se8r01-receive-car.c: 457: temp[0]=0x02;
      008666 1E 06            [ 2] 1301 	ldw	x, (0x06, sp)
      008668 A6 02            [ 1] 1302 	ld	a, #0x02
      00866A F7               [ 1] 1303 	ld	(x), a
                                   1304 ;	se8r01-receive-car.c: 458: temp[1]=0xC1;
      00866B 1E 14            [ 2] 1305 	ldw	x, (0x14, sp)
      00866D A6 C1            [ 1] 1306 	ld	a, #0xc1
      00866F F7               [ 1] 1307 	ld	(x), a
                                   1308 ;	se8r01-receive-car.c: 459: temp[2]=0xCB;  
      008670 1E 12            [ 2] 1309 	ldw	x, (0x12, sp)
      008672 A6 CB            [ 1] 1310 	ld	a, #0xcb
      008674 F7               [ 1] 1311 	ld	(x), a
                                   1312 ;	se8r01-receive-car.c: 460: temp[3]=0x1C;
      008675 1E 10            [ 2] 1313 	ldw	x, (0x10, sp)
      008677 A6 1C            [ 1] 1314 	ld	a, #0x1c
      008679 F7               [ 1] 1315 	ld	(x), a
                                   1316 ;	se8r01-receive-car.c: 461: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
      00867A 1E 06            [ 2] 1317 	ldw	x, (0x06, sp)
      00867C 4B 04            [ 1] 1318 	push	#0x04
      00867E 89               [ 2] 1319 	pushw	x
      00867F 4B 3D            [ 1] 1320 	push	#0x3d
      008681 CD 81 48         [ 4] 1321 	call	_write_spi_buf
      008684 5B 04            [ 2] 1322 	addw	sp, #4
                                   1323 ;	se8r01-receive-car.c: 463: temp[0]=0x97;
      008686 1E 06            [ 2] 1324 	ldw	x, (0x06, sp)
      008688 A6 97            [ 1] 1325 	ld	a, #0x97
      00868A F7               [ 1] 1326 	ld	(x), a
                                   1327 ;	se8r01-receive-car.c: 464: temp[1]=0x64;
      00868B 1E 14            [ 2] 1328 	ldw	x, (0x14, sp)
      00868D A6 64            [ 1] 1329 	ld	a, #0x64
      00868F F7               [ 1] 1330 	ld	(x), a
                                   1331 ;	se8r01-receive-car.c: 465: temp[2]=0x00;
      008690 1E 12            [ 2] 1332 	ldw	x, (0x12, sp)
      008692 7F               [ 1] 1333 	clr	(x)
                                   1334 ;	se8r01-receive-car.c: 466: temp[3]=0x01;
      008693 1E 10            [ 2] 1335 	ldw	x, (0x10, sp)
      008695 A6 01            [ 1] 1336 	ld	a, #0x01
      008697 F7               [ 1] 1337 	ld	(x), a
                                   1338 ;	se8r01-receive-car.c: 467: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp,4);
      008698 1E 06            [ 2] 1339 	ldw	x, (0x06, sp)
      00869A 4B 04            [ 1] 1340 	push	#0x04
      00869C 89               [ 2] 1341 	pushw	x
      00869D 4B 3E            [ 1] 1342 	push	#0x3e
      00869F CD 81 48         [ 4] 1343 	call	_write_spi_buf
      0086A2 5B 04            [ 2] 1344 	addw	sp, #4
                                   1345 ;	se8r01-receive-car.c: 469: gtemp[0]=0x2A;
      0086A4 1E 0E            [ 2] 1346 	ldw	x, (0x0e, sp)
      0086A6 A6 2A            [ 1] 1347 	ld	a, #0x2a
      0086A8 F7               [ 1] 1348 	ld	(x), a
                                   1349 ;	se8r01-receive-car.c: 470: gtemp[1]=0x04;
      0086A9 1E 0C            [ 2] 1350 	ldw	x, (0x0c, sp)
      0086AB A6 04            [ 1] 1351 	ld	a, #0x04
      0086AD F7               [ 1] 1352 	ld	(x), a
                                   1353 ;	se8r01-receive-car.c: 471: gtemp[2]=0x00;
      0086AE 1E 0A            [ 2] 1354 	ldw	x, (0x0a, sp)
      0086B0 7F               [ 1] 1355 	clr	(x)
                                   1356 ;	se8r01-receive-car.c: 472: gtemp[3]=0x7D;
      0086B1 1E 08            [ 2] 1357 	ldw	x, (0x08, sp)
      0086B3 A6 7D            [ 1] 1358 	ld	a, #0x7d
      0086B5 F7               [ 1] 1359 	ld	(x), a
                                   1360 ;	se8r01-receive-car.c: 473: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_TEST_PKDET, gtemp, 4);
      0086B6 1E 0E            [ 2] 1361 	ldw	x, (0x0e, sp)
      0086B8 4B 04            [ 1] 1362 	push	#0x04
      0086BA 89               [ 2] 1363 	pushw	x
      0086BB 4B 3F            [ 1] 1364 	push	#0x3f
      0086BD CD 81 48         [ 4] 1365 	call	_write_spi_buf
      0086C0 5B 04            [ 2] 1366 	addw	sp, #4
                                   1367 ;	se8r01-receive-car.c: 475: rf_switch_bank(iBANK0);
      0086C2 4B 00            [ 1] 1368 	push	#0x00
      0086C4 CD 83 66         [ 4] 1369 	call	_rf_switch_bank
      0086C7 84               [ 1] 1370 	pop	a
      0086C8 5B 15            [ 2] 1371 	addw	sp, #21
      0086CA 81               [ 4] 1372 	ret
                                   1373 ;	se8r01-receive-car.c: 478: void SE8R01_Init()  
                                   1374 ;	-----------------------------------------
                                   1375 ;	 function SE8R01_Init
                                   1376 ;	-----------------------------------------
      0086CB                       1377 _SE8R01_Init:
      0086CB 52 05            [ 2] 1378 	sub	sp, #5
                                   1379 ;	se8r01-receive-car.c: 481: SE8R01_Calibration();   
      0086CD CD 83 83         [ 4] 1380 	call	_SE8R01_Calibration
                                   1381 ;	se8r01-receive-car.c: 482: SE8R01_Analog_Init();   
      0086D0 CD 85 4F         [ 4] 1382 	call	_SE8R01_Analog_Init
                                   1383 ;	se8r01-receive-car.c: 486: if (SE8R01_DR_2M==1)
      0086D3 CE 00 10         [ 2] 1384 	ldw	x, _SE8R01_DR_2M+0
      0086D6 A3 00 01         [ 2] 1385 	cpw	x, #0x0001
      0086D9 26 07            [ 1] 1386 	jrne	00105$
                                   1387 ;	se8r01-receive-car.c: 487: {  temp[0]=0b01001111; }     //2MHz,+5dbm
      0086DB 96               [ 1] 1388 	ldw	x, sp
      0086DC 5C               [ 2] 1389 	incw	x
      0086DD A6 4F            [ 1] 1390 	ld	a, #0x4f
      0086DF F7               [ 1] 1391 	ld	(x), a
      0086E0 20 14            [ 2] 1392 	jra	00106$
      0086E2                       1393 00105$:
                                   1394 ;	se8r01-receive-car.c: 488: else if  (SE8R01_DR_1M==1)
      0086E2 CE 00 12         [ 2] 1395 	ldw	x, _SE8R01_DR_1M+0
      0086E5 A3 00 01         [ 2] 1396 	cpw	x, #0x0001
      0086E8 26 07            [ 1] 1397 	jrne	00102$
                                   1398 ;	se8r01-receive-car.c: 489: {  temp[0]=0b01000111;  }     //1MHz,+5dbm
      0086EA 96               [ 1] 1399 	ldw	x, sp
      0086EB 5C               [ 2] 1400 	incw	x
      0086EC A6 47            [ 1] 1401 	ld	a, #0x47
      0086EE F7               [ 1] 1402 	ld	(x), a
      0086EF 20 05            [ 2] 1403 	jra	00106$
      0086F1                       1404 00102$:
                                   1405 ;	se8r01-receive-car.c: 491: {temp[0]=0b01101111;  }     //500K,+5dbm
      0086F1 96               [ 1] 1406 	ldw	x, sp
      0086F2 5C               [ 2] 1407 	incw	x
      0086F3 A6 6F            [ 1] 1408 	ld	a, #0x6f
      0086F5 F7               [ 1] 1409 	ld	(x), a
      0086F6                       1410 00106$:
                                   1411 ;	se8r01-receive-car.c: 493: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
      0086F6 96               [ 1] 1412 	ldw	x, sp
      0086F7 5C               [ 2] 1413 	incw	x
      0086F8 4B 01            [ 1] 1414 	push	#0x01
      0086FA 89               [ 2] 1415 	pushw	x
      0086FB 4B 26            [ 1] 1416 	push	#0x26
      0086FD CD 81 48         [ 4] 1417 	call	_write_spi_buf
      008700 5B 04            [ 2] 1418 	addw	sp, #4
                                   1419 ;	se8r01-receive-car.c: 494: write_spi_reg(WRITE_REG|iRF_BANK0_EN_AA, 0b00111111);          //enable auto acc on pip 1
      008702 4B 3F            [ 1] 1420 	push	#0x3f
      008704 4B 21            [ 1] 1421 	push	#0x21
      008706 CD 80 CE         [ 4] 1422 	call	_write_spi_reg
      008709 5B 02            [ 2] 1423 	addw	sp, #2
                                   1424 ;	se8r01-receive-car.c: 495: write_spi_reg(WRITE_REG|iRF_BANK0_EN_RXADDR, 0b00111111);      //enable pip 1
      00870B 4B 3F            [ 1] 1425 	push	#0x3f
      00870D 4B 22            [ 1] 1426 	push	#0x22
      00870F CD 80 CE         [ 4] 1427 	call	_write_spi_reg
      008712 5B 02            [ 2] 1428 	addw	sp, #2
                                   1429 ;	se8r01-receive-car.c: 496: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_AW, 0x02);  
      008714 4B 02            [ 1] 1430 	push	#0x02
      008716 4B 23            [ 1] 1431 	push	#0x23
      008718 CD 80 CE         [ 4] 1432 	call	_write_spi_reg
      00871B 5B 02            [ 2] 1433 	addw	sp, #2
                                   1434 ;	se8r01-receive-car.c: 497: write_spi_reg(WRITE_REG|iRF_BANK0_RF_CH, 40);
      00871D 4B 28            [ 1] 1435 	push	#0x28
      00871F 4B 25            [ 1] 1436 	push	#0x25
      008721 CD 80 CE         [ 4] 1437 	call	_write_spi_reg
      008724 5B 02            [ 2] 1438 	addw	sp, #2
                                   1439 ;	se8r01-receive-car.c: 499: write_spi_buf(WRITE_REG + TX_ADDR, ADDRESS0, ADR_WIDTH);    	
      008726 AE 00 2A         [ 2] 1440 	ldw	x, #_ADDRESS0+0
      008729 90 93            [ 1] 1441 	ldw	y, x
      00872B 89               [ 2] 1442 	pushw	x
      00872C 4B 04            [ 1] 1443 	push	#0x04
      00872E 90 89            [ 2] 1444 	pushw	y
      008730 4B 30            [ 1] 1445 	push	#0x30
      008732 CD 81 48         [ 4] 1446 	call	_write_spi_buf
      008735 5B 04            [ 2] 1447 	addw	sp, #4
      008737 85               [ 2] 1448 	popw	x
                                   1449 ;	se8r01-receive-car.c: 500: write_spi_buf(WRITE_REG + RX_ADDR_P0, ADDRESS0, ADR_WIDTH); 
      008738 4B 04            [ 1] 1450 	push	#0x04
      00873A 89               [ 2] 1451 	pushw	x
      00873B 4B 2A            [ 1] 1452 	push	#0x2a
      00873D CD 81 48         [ 4] 1453 	call	_write_spi_buf
      008740 5B 04            [ 2] 1454 	addw	sp, #4
                                   1455 ;	se8r01-receive-car.c: 501: write_spi_buf(WRITE_REG + RX_ADDR_P1, ADDRESS1, ADR_WIDTH); 
      008742 AE 00 26         [ 2] 1456 	ldw	x, #_ADDRESS1+0
      008745 4B 04            [ 1] 1457 	push	#0x04
      008747 89               [ 2] 1458 	pushw	x
      008748 4B 2B            [ 1] 1459 	push	#0x2b
      00874A CD 81 48         [ 4] 1460 	call	_write_spi_buf
      00874D 5B 04            [ 2] 1461 	addw	sp, #4
                                   1462 ;	se8r01-receive-car.c: 502: write_spi_buf(WRITE_REG + RX_ADDR_P2, ADDRESS2, 1); 
      00874F AE 00 22         [ 2] 1463 	ldw	x, #_ADDRESS2+0
      008752 4B 01            [ 1] 1464 	push	#0x01
      008754 89               [ 2] 1465 	pushw	x
      008755 4B 2C            [ 1] 1466 	push	#0x2c
      008757 CD 81 48         [ 4] 1467 	call	_write_spi_buf
      00875A 5B 04            [ 2] 1468 	addw	sp, #4
                                   1469 ;	se8r01-receive-car.c: 503: write_spi_buf(WRITE_REG + RX_ADDR_P3, ADDRESS3, 1); 
      00875C AE 00 23         [ 2] 1470 	ldw	x, #_ADDRESS3+0
      00875F 4B 01            [ 1] 1471 	push	#0x01
      008761 89               [ 2] 1472 	pushw	x
      008762 4B 2D            [ 1] 1473 	push	#0x2d
      008764 CD 81 48         [ 4] 1474 	call	_write_spi_buf
      008767 5B 04            [ 2] 1475 	addw	sp, #4
                                   1476 ;	se8r01-receive-car.c: 504: write_spi_buf(WRITE_REG + RX_ADDR_P4, ADDRESS4, 1); 
      008769 AE 00 24         [ 2] 1477 	ldw	x, #_ADDRESS4+0
      00876C 4B 01            [ 1] 1478 	push	#0x01
      00876E 89               [ 2] 1479 	pushw	x
      00876F 4B 2E            [ 1] 1480 	push	#0x2e
      008771 CD 81 48         [ 4] 1481 	call	_write_spi_buf
      008774 5B 04            [ 2] 1482 	addw	sp, #4
                                   1483 ;	se8r01-receive-car.c: 505: write_spi_buf(WRITE_REG + RX_ADDR_P5, ADDRESS5, 1); 
      008776 AE 00 25         [ 2] 1484 	ldw	x, #_ADDRESS5+0
      008779 4B 01            [ 1] 1485 	push	#0x01
      00877B 89               [ 2] 1486 	pushw	x
      00877C 4B 2F            [ 1] 1487 	push	#0x2f
      00877E CD 81 48         [ 4] 1488 	call	_write_spi_buf
      008781 5B 04            [ 2] 1489 	addw	sp, #4
                                   1490 ;	se8r01-receive-car.c: 506: write_spi_reg(WRITE_REG + RX_PW_P0, PLOAD_WIDTH); 
      008783 4B 20            [ 1] 1491 	push	#0x20
      008785 4B 31            [ 1] 1492 	push	#0x31
      008787 CD 80 CE         [ 4] 1493 	call	_write_spi_reg
      00878A 5B 02            [ 2] 1494 	addw	sp, #2
                                   1495 ;	se8r01-receive-car.c: 507: write_spi_reg(WRITE_REG|iRF_BANK0_CONFIG, 0x3f); 
      00878C 4B 3F            [ 1] 1496 	push	#0x3f
      00878E 4B 20            [ 1] 1497 	push	#0x20
      008790 CD 80 CE         [ 4] 1498 	call	_write_spi_reg
      008793 5B 02            [ 2] 1499 	addw	sp, #2
                                   1500 ;	se8r01-receive-car.c: 508: write_spi_reg(WRITE_REG|iRF_BANK0_DYNPD, 0b00111111);          // enable dynamic payload length data
      008795 4B 3F            [ 1] 1501 	push	#0x3f
      008797 4B 3C            [ 1] 1502 	push	#0x3c
      008799 CD 80 CE         [ 4] 1503 	call	_write_spi_reg
      00879C 5B 02            [ 2] 1504 	addw	sp, #2
                                   1505 ;	se8r01-receive-car.c: 509: write_spi_reg(WRITE_REG|iRF_BANK0_FEATURE, 0x07);        // enable dynamic paload lenght; enbale payload with ack enable w_tx_payload_noack
      00879E 4B 07            [ 1] 1506 	push	#0x07
      0087A0 4B 3D            [ 1] 1507 	push	#0x3d
      0087A2 CD 80 CE         [ 4] 1508 	call	_write_spi_reg
      0087A5 5B 02            [ 2] 1509 	addw	sp, #2
                                   1510 ;	se8r01-receive-car.c: 510: PC_ODR |= (1 << CE);
      0087A7 AE 50 0A         [ 2] 1511 	ldw	x, #0x500a
      0087AA F6               [ 1] 1512 	ld	a, (x)
      0087AB AA 08            [ 1] 1513 	or	a, #0x08
      0087AD F7               [ 1] 1514 	ld	(x), a
      0087AE 5B 05            [ 2] 1515 	addw	sp, #5
      0087B0 81               [ 4] 1516 	ret
                                   1517 ;	se8r01-receive-car.c: 515: void Init_Tim2 ()
                                   1518 ;	-----------------------------------------
                                   1519 ;	 function Init_Tim2
                                   1520 ;	-----------------------------------------
      0087B1                       1521 _Init_Tim2:
                                   1522 ;	se8r01-receive-car.c: 539: TIM2_CCMR3 |=0X70;//Set the timer 2 / three channel three (PD2) output mode
      0087B1 AE 53 09         [ 2] 1523 	ldw	x, #0x5309
      0087B4 F6               [ 1] 1524 	ld	a, (x)
      0087B5 AA 70            [ 1] 1525 	or	a, #0x70
      0087B7 F7               [ 1] 1526 	ld	(x), a
                                   1527 ;	se8r01-receive-car.c: 540: TIM2_CCMR3 |=0X04;//Comparison of 3 pre load / / output enable
      0087B8 AE 53 09         [ 2] 1528 	ldw	x, #0x5309
      0087BB F6               [ 1] 1529 	ld	a, (x)
      0087BC AA 04            [ 1] 1530 	or	a, #0x04
      0087BE F7               [ 1] 1531 	ld	(x), a
                                   1532 ;	se8r01-receive-car.c: 542: TIM2_CCER2 |=0x03;//  Channel 3 enable, active low output configuration
      0087BF AE 53 0B         [ 2] 1533 	ldw	x, #0x530b
      0087C2 F6               [ 1] 1534 	ld	a, (x)
      0087C3 AA 03            [ 1] 1535 	or	a, #0x03
      0087C5 F7               [ 1] 1536 	ld	(x), a
                                   1537 ;	se8r01-receive-car.c: 544: TIM2_PSCR =0X04;// 16 Mhz/2^4 =  1Mhz  -- the prescaler is a 4 bit number!
      0087C6 AE 53 0E         [ 2] 1538 	ldw	x, #0x530e
      0087C9 A6 04            [ 1] 1539 	ld	a, #0x04
      0087CB F7               [ 1] 1540 	ld	(x), a
                                   1541 ;	se8r01-receive-car.c: 548: TIM2_ARRH =20000/256; // auto reload register
      0087CC AE 53 0F         [ 2] 1542 	ldw	x, #0x530f
      0087CF A6 4E            [ 1] 1543 	ld	a, #0x4e
      0087D1 F7               [ 1] 1544 	ld	(x), a
                                   1545 ;	se8r01-receive-car.c: 549: TIM2_ARRL =20000%256; // 1000 Khz/20000 is 50 events per second 
      0087D2 AE 53 10         [ 2] 1546 	ldw	x, #0x5310
      0087D5 A6 20            [ 1] 1547 	ld	a, #0x20
      0087D7 F7               [ 1] 1548 	ld	(x), a
                                   1549 ;	se8r01-receive-car.c: 553: TIM2_CCR3H =1000/256; //compare capture register value
      0087D8 AE 53 15         [ 2] 1550 	ldw	x, #0x5315
      0087DB A6 03            [ 1] 1551 	ld	a, #0x03
      0087DD F7               [ 1] 1552 	ld	(x), a
                                   1553 ;	se8r01-receive-car.c: 554: TIM2_CCR3L =1000%256;
      0087DE AE 53 16         [ 2] 1554 	ldw	x, #0x5316
      0087E1 A6 E8            [ 1] 1555 	ld	a, #0xe8
      0087E3 F7               [ 1] 1556 	ld	(x), a
                                   1557 ;	se8r01-receive-car.c: 555: UARTPrintF("timer init 1 = \n\r");
      0087E4 AE 8A C4         [ 2] 1558 	ldw	x, #___str_0+0
      0087E7 89               [ 2] 1559 	pushw	x
      0087E8 CD 82 79         [ 4] 1560 	call	_UARTPrintF
      0087EB 5B 02            [ 2] 1561 	addw	sp, #2
                                   1562 ;	se8r01-receive-car.c: 563: TIM2_CCER1 =0x03;//  Channel 1 enable, active low output configuration
      0087ED AE 53 0A         [ 2] 1563 	ldw	x, #0x530a
      0087F0 A6 03            [ 1] 1564 	ld	a, #0x03
      0087F2 F7               [ 1] 1565 	ld	(x), a
                                   1566 ;	se8r01-receive-car.c: 564: TIM2_CCMR2 = 0x03;
      0087F3 AE 53 08         [ 2] 1567 	ldw	x, #0x5308
      0087F6 A6 03            [ 1] 1568 	ld	a, #0x03
      0087F8 F7               [ 1] 1569 	ld	(x), a
                                   1570 ;	se8r01-receive-car.c: 565: TIM2_CCMR1 =0X70;//Set the timer 2 / channel 1 output
      0087F9 AE 53 07         [ 2] 1571 	ldw	x, #0x5307
      0087FC A6 70            [ 1] 1572 	ld	a, #0x70
      0087FE F7               [ 1] 1573 	ld	(x), a
                                   1574 ;	se8r01-receive-car.c: 570: TIM2_CCR1H =10000/256; //compare capture register value for channel 1
      0087FF AE 53 11         [ 2] 1575 	ldw	x, #0x5311
      008802 A6 27            [ 1] 1576 	ld	a, #0x27
      008804 F7               [ 1] 1577 	ld	(x), a
                                   1578 ;	se8r01-receive-car.c: 571: TIM2_CCR1L =10000%256;
      008805 AE 53 12         [ 2] 1579 	ldw	x, #0x5312
      008808 A6 10            [ 1] 1580 	ld	a, #0x10
      00880A F7               [ 1] 1581 	ld	(x), a
                                   1582 ;	se8r01-receive-car.c: 575: UARTPrintF("timer init 2 = \n\r");
      00880B AE 8A D6         [ 2] 1583 	ldw	x, #___str_1+0
      00880E 89               [ 2] 1584 	pushw	x
      00880F CD 82 79         [ 4] 1585 	call	_UARTPrintF
      008812 5B 02            [ 2] 1586 	addw	sp, #2
                                   1587 ;	se8r01-receive-car.c: 578: TIM2_CR1 |=0x81;
      008814 AE 53 00         [ 2] 1588 	ldw	x, #0x5300
      008817 F6               [ 1] 1589 	ld	a, (x)
      008818 AA 81            [ 1] 1590 	or	a, #0x81
      00881A F7               [ 1] 1591 	ld	(x), a
      00881B 81               [ 4] 1592 	ret
                                   1593 ;	se8r01-receive-car.c: 584: int main () {
                                   1594 ;	-----------------------------------------
                                   1595 ;	 function main
                                   1596 ;	-----------------------------------------
      00881C                       1597 _main:
      00881C 52 3D            [ 2] 1598 	sub	sp, #61
                                   1599 ;	se8r01-receive-car.c: 586: UCHAR rx_addr_p1[]  = { 0xd2, 0xf0, 0xf0, 0xf0, 0xf0 };
      00881E 90 96            [ 1] 1600 	ldw	y, sp
      008820 72 A9 00 27      [ 2] 1601 	addw	y, #39
      008824 A6 D2            [ 1] 1602 	ld	a, #0xd2
      008826 90 F7            [ 1] 1603 	ld	(y), a
      008828 93               [ 1] 1604 	ldw	x, y
      008829 5C               [ 2] 1605 	incw	x
      00882A A6 F0            [ 1] 1606 	ld	a, #0xf0
      00882C F7               [ 1] 1607 	ld	(x), a
      00882D 93               [ 1] 1608 	ldw	x, y
      00882E 5C               [ 2] 1609 	incw	x
      00882F 5C               [ 2] 1610 	incw	x
      008830 A6 F0            [ 1] 1611 	ld	a, #0xf0
      008832 F7               [ 1] 1612 	ld	(x), a
      008833 93               [ 1] 1613 	ldw	x, y
      008834 A6 F0            [ 1] 1614 	ld	a, #0xf0
      008836 E7 03            [ 1] 1615 	ld	(0x0003, x), a
      008838 93               [ 1] 1616 	ldw	x, y
      008839 A6 F0            [ 1] 1617 	ld	a, #0xf0
      00883B E7 04            [ 1] 1618 	ld	(0x0004, x), a
                                   1619 ;	se8r01-receive-car.c: 587: UCHAR tx_addr[]     = { 0xe1, 0xf0, 0xf0, 0xf0, 0xf0 };
      00883D 90 96            [ 1] 1620 	ldw	y, sp
      00883F 72 A9 00 22      [ 2] 1621 	addw	y, #34
      008843 A6 E1            [ 1] 1622 	ld	a, #0xe1
      008845 90 F7            [ 1] 1623 	ld	(y), a
      008847 93               [ 1] 1624 	ldw	x, y
      008848 5C               [ 2] 1625 	incw	x
      008849 A6 F0            [ 1] 1626 	ld	a, #0xf0
      00884B F7               [ 1] 1627 	ld	(x), a
      00884C 93               [ 1] 1628 	ldw	x, y
      00884D 5C               [ 2] 1629 	incw	x
      00884E 5C               [ 2] 1630 	incw	x
      00884F A6 F0            [ 1] 1631 	ld	a, #0xf0
      008851 F7               [ 1] 1632 	ld	(x), a
      008852 93               [ 1] 1633 	ldw	x, y
      008853 A6 F0            [ 1] 1634 	ld	a, #0xf0
      008855 E7 03            [ 1] 1635 	ld	(0x0003, x), a
      008857 93               [ 1] 1636 	ldw	x, y
      008858 1C 00 04         [ 2] 1637 	addw	x, #0x0004
      00885B A6 F0            [ 1] 1638 	ld	a, #0xf0
      00885D F7               [ 1] 1639 	ld	(x), a
                                   1640 ;	se8r01-receive-car.c: 592: InitializeSystemClock();
      00885E CD 81 E4         [ 4] 1641 	call	_InitializeSystemClock
                                   1642 ;	se8r01-receive-car.c: 593: InitializeUART();
      008861 CD 82 DE         [ 4] 1643 	call	_InitializeUART
                                   1644 ;	se8r01-receive-car.c: 595: InitializeSPI ();
      008864 CD 81 BC         [ 4] 1645 	call	_InitializeSPI
                                   1646 ;	se8r01-receive-car.c: 597: UARTPrintF("start debug \n\r");
      008867 AE 8A E8         [ 2] 1647 	ldw	x, #___str_2+0
      00886A 89               [ 2] 1648 	pushw	x
      00886B CD 82 79         [ 4] 1649 	call	_UARTPrintF
      00886E 5B 02            [ 2] 1650 	addw	sp, #2
                                   1651 ;	se8r01-receive-car.c: 599: memset (tx_payload, 0, sizeof(tx_payload));
      008870 96               [ 1] 1652 	ldw	x, sp
      008871 5C               [ 2] 1653 	incw	x
      008872 4B 21            [ 1] 1654 	push	#0x21
      008874 4B 00            [ 1] 1655 	push	#0x00
      008876 4B 00            [ 1] 1656 	push	#0x00
      008878 4B 00            [ 1] 1657 	push	#0x00
      00887A 89               [ 2] 1658 	pushw	x
      00887B CD 8B 7F         [ 4] 1659 	call	_memset
      00887E 5B 06            [ 2] 1660 	addw	sp, #6
                                   1661 ;	se8r01-receive-car.c: 602: init_io();    // Initialize IO port
      008880 CD 83 57         [ 4] 1662 	call	_init_io
                                   1663 ;	se8r01-receive-car.c: 603: write_spi_reg(FLUSH_RX,0); // receive data 
      008883 4B 00            [ 1] 1664 	push	#0x00
      008885 4B E2            [ 1] 1665 	push	#0xe2
      008887 CD 80 CE         [ 4] 1666 	call	_write_spi_reg
      00888A 5B 02            [ 2] 1667 	addw	sp, #2
                                   1668 ;	se8r01-receive-car.c: 604: readstatus = read_spi_reg(CONFIG);
      00888C 4B 00            [ 1] 1669 	push	#0x00
      00888E CD 81 0A         [ 4] 1670 	call	_read_spi_reg
      008891 5B 01            [ 2] 1671 	addw	sp, #1
                                   1672 ;	se8r01-receive-car.c: 605: UARTPrintF("config = \n\r");
      008893 AE 8A F7         [ 2] 1673 	ldw	x, #___str_3+0
      008896 88               [ 1] 1674 	push	a
      008897 89               [ 2] 1675 	pushw	x
      008898 CD 82 79         [ 4] 1676 	call	_UARTPrintF
      00889B 5B 02            [ 2] 1677 	addw	sp, #2
      00889D 84               [ 1] 1678 	pop	a
                                   1679 ;	se8r01-receive-car.c: 606: print_UCHAR_hex(readstatus);
      00889E 88               [ 1] 1680 	push	a
      00889F CD 82 90         [ 4] 1681 	call	_print_UCHAR_hex
      0088A2 84               [ 1] 1682 	pop	a
                                   1683 ;	se8r01-receive-car.c: 607: readstatus = read_spi_reg(STATUS);
      0088A3 4B 07            [ 1] 1684 	push	#0x07
      0088A5 CD 81 0A         [ 4] 1685 	call	_read_spi_reg
      0088A8 5B 01            [ 2] 1686 	addw	sp, #1
                                   1687 ;	se8r01-receive-car.c: 608: UARTPrintF("status = \n\r");
      0088AA AE 8B 03         [ 2] 1688 	ldw	x, #___str_4+0
      0088AD 88               [ 1] 1689 	push	a
      0088AE 89               [ 2] 1690 	pushw	x
      0088AF CD 82 79         [ 4] 1691 	call	_UARTPrintF
      0088B2 5B 02            [ 2] 1692 	addw	sp, #2
      0088B4 84               [ 1] 1693 	pop	a
                                   1694 ;	se8r01-receive-car.c: 609: print_UCHAR_hex(readstatus);
      0088B5 88               [ 1] 1695 	push	a
      0088B6 CD 82 90         [ 4] 1696 	call	_print_UCHAR_hex
      0088B9 84               [ 1] 1697 	pop	a
                                   1698 ;	se8r01-receive-car.c: 613: PD_DDR |= (1 << 2) ; // output mode
      0088BA AE 50 11         [ 2] 1699 	ldw	x, #0x5011
      0088BD F6               [ 1] 1700 	ld	a, (x)
      0088BE AA 04            [ 1] 1701 	or	a, #0x04
      0088C0 F7               [ 1] 1702 	ld	(x), a
                                   1703 ;	se8r01-receive-car.c: 614: PD_CR1 |= (1 << 2) ; // push-pull
      0088C1 AE 50 12         [ 2] 1704 	ldw	x, #0x5012
      0088C4 F6               [ 1] 1705 	ld	a, (x)
      0088C5 AA 04            [ 1] 1706 	or	a, #0x04
      0088C7 F7               [ 1] 1707 	ld	(x), a
                                   1708 ;	se8r01-receive-car.c: 615: PD_ODR |= (1 << 2);
      0088C8 AE 50 0F         [ 2] 1709 	ldw	x, #0x500f
      0088CB F6               [ 1] 1710 	ld	a, (x)
      0088CC AA 04            [ 1] 1711 	or	a, #0x04
      0088CE F7               [ 1] 1712 	ld	(x), a
                                   1713 ;	se8r01-receive-car.c: 619: Init_Tim2 (); //pwm on pd4
      0088CF CD 87 B1         [ 4] 1714 	call	_Init_Tim2
                                   1715 ;	se8r01-receive-car.c: 620: PD_DDR |= (1<<4);
      0088D2 AE 50 11         [ 2] 1716 	ldw	x, #0x5011
      0088D5 F6               [ 1] 1717 	ld	a, (x)
      0088D6 AA 10            [ 1] 1718 	or	a, #0x10
      0088D8 F7               [ 1] 1719 	ld	(x), a
                                   1720 ;	se8r01-receive-car.c: 621: PD_CR1 |= (1<<4);
      0088D9 AE 50 12         [ 2] 1721 	ldw	x, #0x5012
      0088DC F6               [ 1] 1722 	ld	a, (x)
      0088DD AA 10            [ 1] 1723 	or	a, #0x10
      0088DF F7               [ 1] 1724 	ld	(x), a
                                   1725 ;	se8r01-receive-car.c: 622: PD_CR2 |= (1<<4);
      0088E0 AE 50 13         [ 2] 1726 	ldw	x, #0x5013
      0088E3 F6               [ 1] 1727 	ld	a, (x)
      0088E4 AA 10            [ 1] 1728 	or	a, #0x10
      0088E6 F7               [ 1] 1729 	ld	(x), a
                                   1730 ;	se8r01-receive-car.c: 626: PA_DDR |= (1<<3);
      0088E7 AE 50 02         [ 2] 1731 	ldw	x, #0x5002
      0088EA F6               [ 1] 1732 	ld	a, (x)
      0088EB AA 08            [ 1] 1733 	or	a, #0x08
      0088ED F7               [ 1] 1734 	ld	(x), a
                                   1735 ;	se8r01-receive-car.c: 627: PA_CR1 |= (1<<3);
      0088EE AE 50 03         [ 2] 1736 	ldw	x, #0x5003
      0088F1 F6               [ 1] 1737 	ld	a, (x)
      0088F2 AA 08            [ 1] 1738 	or	a, #0x08
      0088F4 F7               [ 1] 1739 	ld	(x), a
                                   1740 ;	se8r01-receive-car.c: 628: PA_CR2 |= (1<<4);
      0088F5 AE 50 04         [ 2] 1741 	ldw	x, #0x5004
      0088F8 F6               [ 1] 1742 	ld	a, (x)
      0088F9 AA 10            [ 1] 1743 	or	a, #0x10
      0088FB F7               [ 1] 1744 	ld	(x), a
                                   1745 ;	se8r01-receive-car.c: 629: SE8R01_Init();
      0088FC CD 86 CB         [ 4] 1746 	call	_SE8R01_Init
                                   1747 ;	se8r01-receive-car.c: 630: UARTPrintF("timer initialised = \n\r");
      0088FF AE 8B 0F         [ 2] 1748 	ldw	x, #___str_5+0
      008902 89               [ 2] 1749 	pushw	x
      008903 CD 82 79         [ 4] 1750 	call	_UARTPrintF
      008906 5B 02            [ 2] 1751 	addw	sp, #2
                                   1752 ;	se8r01-receive-car.c: 638: PB_DDR |= (1 << 4) | (1 << 5);  // output mode
      008908 AE 50 07         [ 2] 1753 	ldw	x, #0x5007
      00890B F6               [ 1] 1754 	ld	a, (x)
      00890C AA 30            [ 1] 1755 	or	a, #0x30
      00890E F7               [ 1] 1756 	ld	(x), a
                                   1757 ;	se8r01-receive-car.c: 639: PB_CR1 |= (1 << 4) | (1 << 5);  // push-pull
      00890F AE 50 08         [ 2] 1758 	ldw	x, #0x5008
      008912 F6               [ 1] 1759 	ld	a, (x)
      008913 AA 30            [ 1] 1760 	or	a, #0x30
      008915 F7               [ 1] 1761 	ld	(x), a
                                   1762 ;	se8r01-receive-car.c: 640: PB_CR2 |= (1 << 4) | (1 << 5);  // up to 10MHz speed
      008916 AE 50 09         [ 2] 1763 	ldw	x, #0x5009
      008919 F6               [ 1] 1764 	ld	a, (x)
      00891A AA 30            [ 1] 1765 	or	a, #0x30
      00891C F7               [ 1] 1766 	ld	(x), a
                                   1767 ;	se8r01-receive-car.c: 646: PA_DDR |= (1 << 1) | (1 << 2);  // output mode
      00891D AE 50 02         [ 2] 1768 	ldw	x, #0x5002
      008920 F6               [ 1] 1769 	ld	a, (x)
      008921 AA 06            [ 1] 1770 	or	a, #0x06
      008923 F7               [ 1] 1771 	ld	(x), a
                                   1772 ;	se8r01-receive-car.c: 647: PA_CR1 |= (1 << 1) | (1 << 2);  // push-pull
      008924 AE 50 03         [ 2] 1773 	ldw	x, #0x5003
      008927 F6               [ 1] 1774 	ld	a, (x)
      008928 AA 06            [ 1] 1775 	or	a, #0x06
      00892A F7               [ 1] 1776 	ld	(x), a
                                   1777 ;	se8r01-receive-car.c: 648: PA_CR2 |= (1 << 1) | (1 << 2);  // up to 10MHz speed
      00892B AE 50 04         [ 2] 1778 	ldw	x, #0x5004
      00892E F6               [ 1] 1779 	ld	a, (x)
      00892F AA 06            [ 1] 1780 	or	a, #0x06
      008931 F7               [ 1] 1781 	ld	(x), a
                                   1782 ;	se8r01-receive-car.c: 657: PB_ODR |= 1 << 5;
      008932 AE 50 05         [ 2] 1783 	ldw	x, #0x5005
      008935 F6               [ 1] 1784 	ld	a, (x)
      008936 AA 20            [ 1] 1785 	or	a, #0x20
      008938 F7               [ 1] 1786 	ld	(x), a
                                   1787 ;	se8r01-receive-car.c: 662: PA_ODR |= 1 << 1;
      008939 AE 50 00         [ 2] 1788 	ldw	x, #0x5000
      00893C F6               [ 1] 1789 	ld	a, (x)
      00893D AA 02            [ 1] 1790 	or	a, #0x02
      00893F F7               [ 1] 1791 	ld	(x), a
                                   1792 ;	se8r01-receive-car.c: 668: while (1) {
      008940                       1793 00110$:
                                   1794 ;	se8r01-receive-car.c: 673: delay(1000);
      008940 4B E8            [ 1] 1795 	push	#0xe8
      008942 4B 03            [ 1] 1796 	push	#0x03
      008944 CD 82 2E         [ 4] 1797 	call	_delay
      008947 5B 02            [ 2] 1798 	addw	sp, #2
                                   1799 ;	se8r01-receive-car.c: 678: PD_ODR &= ~(1 << 2); //blink LED
      008949 AE 50 0F         [ 2] 1800 	ldw	x, #0x500f
      00894C F6               [ 1] 1801 	ld	a, (x)
      00894D A4 FB            [ 1] 1802 	and	a, #0xfb
      00894F F7               [ 1] 1803 	ld	(x), a
                                   1804 ;	se8r01-receive-car.c: 679: delay(500);
      008950 4B F4            [ 1] 1805 	push	#0xf4
      008952 4B 01            [ 1] 1806 	push	#0x01
      008954 CD 82 2E         [ 4] 1807 	call	_delay
      008957 5B 02            [ 2] 1808 	addw	sp, #2
                                   1809 ;	se8r01-receive-car.c: 682: delay(500);
      008959 4B F4            [ 1] 1810 	push	#0xf4
      00895B 4B 01            [ 1] 1811 	push	#0x01
      00895D CD 82 2E         [ 4] 1812 	call	_delay
      008960 5B 02            [ 2] 1813 	addw	sp, #2
                                   1814 ;	se8r01-receive-car.c: 683: if ((PD_IDR & (1 << 3))==0) //input low
      008962 AE 50 10         [ 2] 1815 	ldw	x, #0x5010
      008965 F6               [ 1] 1816 	ld	a, (x)
      008966 A5 08            [ 1] 1817 	bcp	a, #0x08
      008968 27 03            [ 1] 1818 	jreq	00170$
      00896A CC 8A 8A         [ 2] 1819 	jp	00105$
      00896D                       1820 00170$:
                                   1821 ;	se8r01-receive-car.c: 687: delay(240);
      00896D 4B F0            [ 1] 1822 	push	#0xf0
      00896F 4B 00            [ 1] 1823 	push	#0x00
      008971 CD 82 2E         [ 4] 1824 	call	_delay
      008974 5B 02            [ 2] 1825 	addw	sp, #2
                                   1826 ;	se8r01-receive-car.c: 688: signal_lv=read_spi_reg(iRF_BANK0_RPD);
      008976 4B 09            [ 1] 1827 	push	#0x09
      008978 CD 81 0A         [ 4] 1828 	call	_read_spi_reg
      00897B 5B 01            [ 2] 1829 	addw	sp, #1
      00897D C7 00 1A         [ 1] 1830 	ld	_signal_lv+0, a
                                   1831 ;	se8r01-receive-car.c: 689: status = read_spi_reg(STATUS);
      008980 4B 07            [ 1] 1832 	push	#0x07
      008982 CD 81 0A         [ 4] 1833 	call	_read_spi_reg
      008985 5B 01            [ 2] 1834 	addw	sp, #1
      008987 C7 00 1D         [ 1] 1835 	ld	_status+0, a
                                   1836 ;	se8r01-receive-car.c: 691: if(status&STA_MARK_RX)                                                 // if receive data ready (TX_DS) interrupt
      00898A 72 06 00 1D 02   [ 2] 1837 	btjt	_status+0, #6, 00171$
      00898F 20 57            [ 2] 1838 	jra	00103$
      008991                       1839 00171$:
                                   1840 ;	se8r01-receive-car.c: 694: pip= (status & 0b00001110)>>1;
      008991 C6 00 1D         [ 1] 1841 	ld	a, _status+0
      008994 A4 0E            [ 1] 1842 	and	a, #0x0e
      008996 44               [ 1] 1843 	srl	a
      008997 5F               [ 1] 1844 	clrw	x
      008998 97               [ 1] 1845 	ld	xl, a
      008999 CF 00 1B         [ 2] 1846 	ldw	_pip+0, x
                                   1847 ;	se8r01-receive-car.c: 695: pload_width_now=read_spi_reg(iRF_CMD_R_RX_PL_WID);
      00899C 4B 60            [ 1] 1848 	push	#0x60
      00899E CD 81 0A         [ 4] 1849 	call	_read_spi_reg
      0089A1 5B 01            [ 2] 1850 	addw	sp, #1
      0089A3 5F               [ 1] 1851 	clrw	x
      0089A4 97               [ 1] 1852 	ld	xl, a
      0089A5 CF 00 16         [ 2] 1853 	ldw	_pload_width_now+0, x
                                   1854 ;	se8r01-receive-car.c: 696: read_spi_buf(RD_RX_PLOAD, rx_buf,32);             // read playload to rx_buf
      0089A8 AE 00 2E         [ 2] 1855 	ldw	x, #_rx_buf+0
      0089AB 1F 32            [ 2] 1856 	ldw	(0x32, sp), x
      0089AD 1E 32            [ 2] 1857 	ldw	x, (0x32, sp)
      0089AF 4B 20            [ 1] 1858 	push	#0x20
      0089B1 89               [ 2] 1859 	pushw	x
      0089B2 4B 61            [ 1] 1860 	push	#0x61
      0089B4 CD 81 80         [ 4] 1861 	call	_read_spi_buf
      0089B7 5B 04            [ 2] 1862 	addw	sp, #4
                                   1863 ;	se8r01-receive-car.c: 697: write_spi_reg(FLUSH_RX,0);
      0089B9 4B 00            [ 1] 1864 	push	#0x00
      0089BB 4B E2            [ 1] 1865 	push	#0xe2
      0089BD CD 80 CE         [ 4] 1866 	call	_write_spi_reg
      0089C0 5B 02            [ 2] 1867 	addw	sp, #2
                                   1868 ;	se8r01-receive-car.c: 699: newdata=1;
      0089C2 35 01 00 19      [ 1] 1869 	mov	_newdata+1, #0x01
      0089C6 72 5F 00 18      [ 1] 1870 	clr	_newdata+0
                                   1871 ;	se8r01-receive-car.c: 700: for (teller=0;teller<32;++teller)
      0089CA 5F               [ 1] 1872 	clrw	x
      0089CB                       1873 00112$:
                                   1874 ;	se8r01-receive-car.c: 701: print_UCHAR_hex (rx_buf[teller]);
      0089CB 90 93            [ 1] 1875 	ldw	y, x
      0089CD 72 F9 32         [ 2] 1876 	addw	y, (0x32, sp)
      0089D0 90 F6            [ 1] 1877 	ld	a, (y)
      0089D2 89               [ 2] 1878 	pushw	x
      0089D3 88               [ 1] 1879 	push	a
      0089D4 CD 82 90         [ 4] 1880 	call	_print_UCHAR_hex
      0089D7 84               [ 1] 1881 	pop	a
      0089D8 85               [ 2] 1882 	popw	x
                                   1883 ;	se8r01-receive-car.c: 700: for (teller=0;teller<32;++teller)
      0089D9 5C               [ 2] 1884 	incw	x
      0089DA A3 00 20         [ 2] 1885 	cpw	x, #0x0020
      0089DD 2F EC            [ 1] 1886 	jrslt	00112$
                                   1887 ;	se8r01-receive-car.c: 702: UARTPrintF("\n\r");
      0089DF AE 8B 26         [ 2] 1888 	ldw	x, #___str_6+0
      0089E2 89               [ 2] 1889 	pushw	x
      0089E3 CD 82 79         [ 4] 1890 	call	_UARTPrintF
      0089E6 5B 02            [ 2] 1891 	addw	sp, #2
      0089E8                       1892 00103$:
                                   1893 ;	se8r01-receive-car.c: 705: speed = (unsigned int)rx_buf[2] << 8 | (unsigned int)rx_buf[3];
      0089E8 AE 00 2E         [ 2] 1894 	ldw	x, #_rx_buf+0
      0089EB 1F 38            [ 2] 1895 	ldw	(0x38, sp), x
      0089ED 1E 38            [ 2] 1896 	ldw	x, (0x38, sp)
      0089EF E6 02            [ 1] 1897 	ld	a, (0x2, x)
      0089F1 5F               [ 1] 1898 	clrw	x
      0089F2 97               [ 1] 1899 	ld	xl, a
      0089F3 58               [ 2] 1900 	sllw	x
      0089F4 58               [ 2] 1901 	sllw	x
      0089F5 58               [ 2] 1902 	sllw	x
      0089F6 58               [ 2] 1903 	sllw	x
      0089F7 58               [ 2] 1904 	sllw	x
      0089F8 58               [ 2] 1905 	sllw	x
      0089F9 58               [ 2] 1906 	sllw	x
      0089FA 58               [ 2] 1907 	sllw	x
      0089FB 16 38            [ 2] 1908 	ldw	y, (0x38, sp)
      0089FD 90 E6 03         [ 1] 1909 	ld	a, (0x3, y)
      008A00 0F 3C            [ 1] 1910 	clr	(0x3c, sp)
      008A02 89               [ 2] 1911 	pushw	x
      008A03 1A 02            [ 1] 1912 	or	a, (2, sp)
      008A05 85               [ 2] 1913 	popw	x
      008A06 97               [ 1] 1914 	ld	xl, a
      008A07 9E               [ 1] 1915 	ld	a, xh
      008A08 1A 3C            [ 1] 1916 	or	a, (0x3c, sp)
      008A0A 95               [ 1] 1917 	ld	xh, a
                                   1918 ;	se8r01-receive-car.c: 706: TIM2_CCR1H =speed*20/256; //compare capture register value for channel 1
      008A0B 89               [ 2] 1919 	pushw	x
      008A0C 4B 14            [ 1] 1920 	push	#0x14
      008A0E 4B 00            [ 1] 1921 	push	#0x00
      008A10 CD 8B 29         [ 4] 1922 	call	__mulint
      008A13 5B 04            [ 2] 1923 	addw	sp, #4
      008A15 1F 3A            [ 2] 1924 	ldw	(0x3a, sp), x
      008A17 4B 00            [ 1] 1925 	push	#0x00
      008A19 4B 01            [ 1] 1926 	push	#0x01
      008A1B 1E 3C            [ 2] 1927 	ldw	x, (0x3c, sp)
      008A1D 89               [ 2] 1928 	pushw	x
      008A1E CD 8B DC         [ 4] 1929 	call	__divsint
      008A21 5B 04            [ 2] 1930 	addw	sp, #4
      008A23 9F               [ 1] 1931 	ld	a, xl
      008A24 AE 53 11         [ 2] 1932 	ldw	x, #0x5311
      008A27 F7               [ 1] 1933 	ld	(x), a
                                   1934 ;	se8r01-receive-car.c: 707: TIM2_CCR1L =speed*20%256;
      008A28 4B 00            [ 1] 1935 	push	#0x00
      008A2A 4B 01            [ 1] 1936 	push	#0x01
      008A2C 1E 3C            [ 2] 1937 	ldw	x, (0x3c, sp)
      008A2E 89               [ 2] 1938 	pushw	x
      008A2F CD 8B 9E         [ 4] 1939 	call	__modsint
      008A32 5B 04            [ 2] 1940 	addw	sp, #4
      008A34 9F               [ 1] 1941 	ld	a, xl
      008A35 AE 53 12         [ 2] 1942 	ldw	x, #0x5312
      008A38 F7               [ 1] 1943 	ld	(x), a
                                   1944 ;	se8r01-receive-car.c: 710: angle = (unsigned int)rx_buf[4] << 8 | (unsigned int)rx_buf[5];
      008A39 1E 38            [ 2] 1945 	ldw	x, (0x38, sp)
      008A3B E6 04            [ 1] 1946 	ld	a, (0x4, x)
      008A3D 02               [ 1] 1947 	rlwa	x
      008A3E 4F               [ 1] 1948 	clr	a
      008A3F 01               [ 1] 1949 	rrwa	x
      008A40 97               [ 1] 1950 	ld	xl, a
      008A41 58               [ 2] 1951 	sllw	x
      008A42 58               [ 2] 1952 	sllw	x
      008A43 58               [ 2] 1953 	sllw	x
      008A44 58               [ 2] 1954 	sllw	x
      008A45 58               [ 2] 1955 	sllw	x
      008A46 58               [ 2] 1956 	sllw	x
      008A47 58               [ 2] 1957 	sllw	x
      008A48 58               [ 2] 1958 	sllw	x
      008A49 16 38            [ 2] 1959 	ldw	y, (0x38, sp)
      008A4B 90 E6 05         [ 1] 1960 	ld	a, (0x5, y)
      008A4E 0F 36            [ 1] 1961 	clr	(0x36, sp)
      008A50 89               [ 2] 1962 	pushw	x
      008A51 1A 02            [ 1] 1963 	or	a, (2, sp)
      008A53 85               [ 2] 1964 	popw	x
      008A54 97               [ 1] 1965 	ld	xl, a
      008A55 9E               [ 1] 1966 	ld	a, xh
      008A56 1A 36            [ 1] 1967 	or	a, (0x36, sp)
      008A58 95               [ 1] 1968 	ld	xh, a
                                   1969 ;	se8r01-receive-car.c: 711: TIM2_CCR3H =(1000+angle)/256; //compare capture register value
      008A59 1C 03 E8         [ 2] 1970 	addw	x, #0x03e8
      008A5C 1F 34            [ 2] 1971 	ldw	(0x34, sp), x
      008A5E 4B 00            [ 1] 1972 	push	#0x00
      008A60 4B 01            [ 1] 1973 	push	#0x01
      008A62 1E 36            [ 2] 1974 	ldw	x, (0x36, sp)
      008A64 89               [ 2] 1975 	pushw	x
      008A65 CD 8B DC         [ 4] 1976 	call	__divsint
      008A68 5B 04            [ 2] 1977 	addw	sp, #4
      008A6A 9F               [ 1] 1978 	ld	a, xl
      008A6B AE 53 15         [ 2] 1979 	ldw	x, #0x5315
      008A6E F7               [ 1] 1980 	ld	(x), a
                                   1981 ;	se8r01-receive-car.c: 712: TIM2_CCR3L =(1000+angle)%256;
      008A6F 4B 00            [ 1] 1982 	push	#0x00
      008A71 4B 01            [ 1] 1983 	push	#0x01
      008A73 1E 36            [ 2] 1984 	ldw	x, (0x36, sp)
      008A75 89               [ 2] 1985 	pushw	x
      008A76 CD 8B 9E         [ 4] 1986 	call	__modsint
      008A79 5B 04            [ 2] 1987 	addw	sp, #4
      008A7B 9F               [ 1] 1988 	ld	a, xl
      008A7C AE 53 16         [ 2] 1989 	ldw	x, #0x5316
      008A7F F7               [ 1] 1990 	ld	(x), a
                                   1991 ;	se8r01-receive-car.c: 714: write_spi_reg(WRITE_REG+STATUS,status);       // clear RX_DR or TX_DS or MAX_RT interrupt flag
      008A80 3B 00 1D         [ 1] 1992 	push	_status+0
      008A83 4B 27            [ 1] 1993 	push	#0x27
      008A85 CD 80 CE         [ 4] 1994 	call	_write_spi_reg
      008A88 5B 02            [ 2] 1995 	addw	sp, #2
      008A8A                       1996 00105$:
                                   1997 ;	se8r01-receive-car.c: 719: for (x1 = 0; x1 < 50; ++x1)
      008A8A 5F               [ 1] 1998 	clrw	x
      008A8B 1F 30            [ 2] 1999 	ldw	(0x30, sp), x
      008A8D                       2000 00121$:
      008A8D 1E 30            [ 2] 2001 	ldw	x, (0x30, sp)
      008A8F A3 00 32         [ 2] 2002 	cpw	x, #0x0032
      008A92 2F 03            [ 1] 2003 	jrslt	00173$
      008A94 CC 89 40         [ 2] 2004 	jp	00110$
      008A97                       2005 00173$:
                                   2006 ;	se8r01-receive-car.c: 720: for (y1 = 0; y1 < 50; ++y1)
      008A97 5F               [ 1] 2007 	clrw	x
      008A98 1F 2E            [ 2] 2008 	ldw	(0x2e, sp), x
      008A9A                       2009 00118$:
      008A9A 1E 2E            [ 2] 2010 	ldw	x, (0x2e, sp)
      008A9C A3 00 32         [ 2] 2011 	cpw	x, #0x0032
      008A9F 2E 19            [ 1] 2012 	jrsge	00122$
                                   2013 ;	se8r01-receive-car.c: 721: for (z1 = 0; z1 < 50; ++z1)
      008AA1 5F               [ 1] 2014 	clrw	x
      008AA2 1F 2C            [ 2] 2015 	ldw	(0x2c, sp), x
      008AA4                       2016 00115$:
      008AA4 1E 2C            [ 2] 2017 	ldw	x, (0x2c, sp)
      008AA6 A3 00 32         [ 2] 2018 	cpw	x, #0x0032
      008AA9 2E 08            [ 1] 2019 	jrsge	00119$
                                   2020 ;	se8r01-receive-car.c: 722: __asm__("nop");
      008AAB 9D               [ 1] 2021 	nop
                                   2022 ;	se8r01-receive-car.c: 721: for (z1 = 0; z1 < 50; ++z1)
      008AAC 1E 2C            [ 2] 2023 	ldw	x, (0x2c, sp)
      008AAE 5C               [ 2] 2024 	incw	x
      008AAF 1F 2C            [ 2] 2025 	ldw	(0x2c, sp), x
      008AB1 20 F1            [ 2] 2026 	jra	00115$
      008AB3                       2027 00119$:
                                   2028 ;	se8r01-receive-car.c: 720: for (y1 = 0; y1 < 50; ++y1)
      008AB3 1E 2E            [ 2] 2029 	ldw	x, (0x2e, sp)
      008AB5 5C               [ 2] 2030 	incw	x
      008AB6 1F 2E            [ 2] 2031 	ldw	(0x2e, sp), x
      008AB8 20 E0            [ 2] 2032 	jra	00118$
      008ABA                       2033 00122$:
                                   2034 ;	se8r01-receive-car.c: 719: for (x1 = 0; x1 < 50; ++x1)
      008ABA 1E 30            [ 2] 2035 	ldw	x, (0x30, sp)
      008ABC 5C               [ 2] 2036 	incw	x
      008ABD 1F 30            [ 2] 2037 	ldw	(0x30, sp), x
      008ABF 20 CC            [ 2] 2038 	jra	00121$
      008AC1 5B 3D            [ 2] 2039 	addw	sp, #61
      008AC3 81               [ 4] 2040 	ret
                                   2041 	.area CODE
      008AC4                       2042 ___str_0:
      008AC4 74 69 6D 65 72 20 69  2043 	.ascii "timer init 1 = "
             6E 69 74 20 31 20 3D
             20
      008AD3 0A                    2044 	.db 0x0A
      008AD4 0D                    2045 	.db 0x0D
      008AD5 00                    2046 	.db 0x00
      008AD6                       2047 ___str_1:
      008AD6 74 69 6D 65 72 20 69  2048 	.ascii "timer init 2 = "
             6E 69 74 20 32 20 3D
             20
      008AE5 0A                    2049 	.db 0x0A
      008AE6 0D                    2050 	.db 0x0D
      008AE7 00                    2051 	.db 0x00
      008AE8                       2052 ___str_2:
      008AE8 73 74 61 72 74 20 64  2053 	.ascii "start debug "
             65 62 75 67 20
      008AF4 0A                    2054 	.db 0x0A
      008AF5 0D                    2055 	.db 0x0D
      008AF6 00                    2056 	.db 0x00
      008AF7                       2057 ___str_3:
      008AF7 63 6F 6E 66 69 67 20  2058 	.ascii "config = "
             3D 20
      008B00 0A                    2059 	.db 0x0A
      008B01 0D                    2060 	.db 0x0D
      008B02 00                    2061 	.db 0x00
      008B03                       2062 ___str_4:
      008B03 73 74 61 74 75 73 20  2063 	.ascii "status = "
             3D 20
      008B0C 0A                    2064 	.db 0x0A
      008B0D 0D                    2065 	.db 0x0D
      008B0E 00                    2066 	.db 0x00
      008B0F                       2067 ___str_5:
      008B0F 74 69 6D 65 72 20 69  2068 	.ascii "timer initialised = "
             6E 69 74 69 61 6C 69
             73 65 64 20 3D 20
      008B23 0A                    2069 	.db 0x0A
      008B24 0D                    2070 	.db 0x0D
      008B25 00                    2071 	.db 0x00
      008B26                       2072 ___str_6:
      008B26 0A                    2073 	.db 0x0A
      008B27 0D                    2074 	.db 0x0D
      008B28 00                    2075 	.db 0x00
                                   2076 	.area INITIALIZER
      008C31                       2077 __xinit__SE8R01_DR_2M:
      008C31 00 00                 2078 	.dw #0x0000
      008C33                       2079 __xinit__SE8R01_DR_1M:
      008C33 00 00                 2080 	.dw #0x0000
      008C35                       2081 __xinit__SE8R01_DR_500K:
      008C35 00 01                 2082 	.dw #0x0001
      008C37                       2083 __xinit__pload_width_now:
      008C37 00 00                 2084 	.dw #0x0000
      008C39                       2085 __xinit__newdata:
      008C39 00 00                 2086 	.dw #0x0000
      008C3B                       2087 __xinit__signal_lv:
      008C3B 00                    2088 	.db #0x00	;  0
      008C3C                       2089 __xinit__pip:
      008C3C 00 00                 2090 	.dw #0x0000
      008C3E                       2091 __xinit__status:
      008C3E 00                    2092 	.db #0x00	; 0
      008C3F                       2093 __xinit__TX_ADDRESS:
      008C3F B3                    2094 	.db #0xB3	; 179
      008C40 43                    2095 	.db #0x43	; 67	'C'
      008C41 10                    2096 	.db #0x10	; 16
      008C42 10                    2097 	.db #0x10	; 16
      008C43                       2098 __xinit__ADDRESS2:
      008C43 B1                    2099 	.db #0xB1	; 177
      008C44                       2100 __xinit__ADDRESS3:
      008C44 B2                    2101 	.db #0xB2	; 178
      008C45                       2102 __xinit__ADDRESS4:
      008C45 B3                    2103 	.db #0xB3	; 179
      008C46                       2104 __xinit__ADDRESS5:
      008C46 B4                    2105 	.db #0xB4	; 180
      008C47                       2106 __xinit__ADDRESS1:
      008C47 B0                    2107 	.db #0xB0	; 176
      008C48 43                    2108 	.db #0x43	; 67	'C'
      008C49 10                    2109 	.db #0x10	; 16
      008C4A 10                    2110 	.db #0x10	; 16
      008C4B                       2111 __xinit__ADDRESS0:
      008C4B 34                    2112 	.db #0x34	; 52	'4'
      008C4C 43                    2113 	.db #0x43	; 67	'C'
      008C4D 10                    2114 	.db #0x10	; 16
      008C4E 10                    2115 	.db #0x10	; 16
      008C4F                       2116 __xinit__rx_buf:
      008C4F 00                    2117 	.db #0x00	; 0
      008C50 00                    2118 	.db 0x00
      008C51 00                    2119 	.db 0x00
      008C52 00                    2120 	.db 0x00
      008C53 00                    2121 	.db 0x00
      008C54 00                    2122 	.db 0x00
      008C55 00                    2123 	.db 0x00
      008C56 00                    2124 	.db 0x00
      008C57 00                    2125 	.db 0x00
      008C58 00                    2126 	.db 0x00
      008C59 00                    2127 	.db 0x00
      008C5A 00                    2128 	.db 0x00
      008C5B 00                    2129 	.db 0x00
      008C5C 00                    2130 	.db 0x00
      008C5D 00                    2131 	.db 0x00
      008C5E 00                    2132 	.db 0x00
      008C5F 00                    2133 	.db 0x00
      008C60 00                    2134 	.db 0x00
      008C61 00                    2135 	.db 0x00
      008C62 00                    2136 	.db 0x00
      008C63 00                    2137 	.db 0x00
      008C64 00                    2138 	.db 0x00
      008C65 00                    2139 	.db 0x00
      008C66 00                    2140 	.db 0x00
      008C67 00                    2141 	.db 0x00
      008C68 00                    2142 	.db 0x00
      008C69 00                    2143 	.db 0x00
      008C6A 00                    2144 	.db 0x00
      008C6B 00                    2145 	.db 0x00
      008C6C 00                    2146 	.db 0x00
      008C6D 00                    2147 	.db 0x00
      008C6E 00                    2148 	.db 0x00
      008C6F                       2149 __xinit__tx_buf:
      008C6F 00                    2150 	.db #0x00	; 0
      008C70 00                    2151 	.db 0x00
      008C71 00                    2152 	.db 0x00
      008C72 00                    2153 	.db 0x00
      008C73 00                    2154 	.db 0x00
      008C74 00                    2155 	.db 0x00
      008C75 00                    2156 	.db 0x00
      008C76 00                    2157 	.db 0x00
      008C77 00                    2158 	.db 0x00
      008C78 00                    2159 	.db 0x00
      008C79 00                    2160 	.db 0x00
      008C7A 00                    2161 	.db 0x00
      008C7B 00                    2162 	.db 0x00
      008C7C 00                    2163 	.db 0x00
      008C7D 00                    2164 	.db 0x00
      008C7E 00                    2165 	.db 0x00
      008C7F 00                    2166 	.db 0x00
      008C80 00                    2167 	.db 0x00
      008C81 00                    2168 	.db 0x00
      008C82 00                    2169 	.db 0x00
      008C83 00                    2170 	.db 0x00
      008C84 00                    2171 	.db 0x00
      008C85 00                    2172 	.db 0x00
      008C86 00                    2173 	.db 0x00
      008C87 00                    2174 	.db 0x00
      008C88 00                    2175 	.db 0x00
      008C89 00                    2176 	.db 0x00
      008C8A 00                    2177 	.db 0x00
      008C8B 00                    2178 	.db 0x00
      008C8C 00                    2179 	.db 0x00
      008C8D 00                    2180 	.db 0x00
      008C8E 00                    2181 	.db 0x00
                                   2182 	.area CABS (ABS)
