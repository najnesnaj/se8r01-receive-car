                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.0 #8981 (Jul 11 2014) (Linux)
                                      4 ; This file was generated Sun Feb 11 11:38:08 2018
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
      008094 D6 8C E3         [ 1]  168 	ld	a, (s_INITIALIZER - 1, x)
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
      008080 CC 88 1A         [ 2]  182 	jp	_main
                                    183 ;	return from main will return to caller
                                    184 ;--------------------------------------------------------
                                    185 ; code
                                    186 ;--------------------------------------------------------
                                    187 	.area CODE
                                    188 ;	se8r01-receive-car.c: 53: void delayTenMicro (void) {
                                    189 ;	-----------------------------------------
                                    190 ;	 function delayTenMicro
                                    191 ;	-----------------------------------------
      0080A0                        192 _delayTenMicro:
                                    193 ;	se8r01-receive-car.c: 55: for (a = 0; a < 50; ++a)
      0080A0 A6 32            [ 1]  194 	ld	a, #0x32
      0080A2                        195 00104$:
                                    196 ;	se8r01-receive-car.c: 56: __asm__("nop");
      0080A2 9D               [ 1]  197 	nop
      0080A3 4A               [ 1]  198 	dec	a
                                    199 ;	se8r01-receive-car.c: 55: for (a = 0; a < 50; ++a)
      0080A4 4D               [ 1]  200 	tnz	a
      0080A5 26 FB            [ 1]  201 	jrne	00104$
      0080A7 81               [ 4]  202 	ret
                                    203 ;	se8r01-receive-car.c: 58: UCHAR write_spi (UCHAR value) {
                                    204 ;	-----------------------------------------
                                    205 ;	 function write_spi
                                    206 ;	-----------------------------------------
      0080A8                        207 _write_spi:
                                    208 ;	se8r01-receive-car.c: 60: delayTenMicro ();
      0080A8 CD 80 A0         [ 4]  209 	call	_delayTenMicro
                                    210 ;	se8r01-receive-car.c: 61: SPI_DR = value;
      0080AB AE 52 04         [ 2]  211 	ldw	x, #0x5204
      0080AE 7B 03            [ 1]  212 	ld	a, (0x03, sp)
      0080B0 F7               [ 1]  213 	ld	(x), a
                                    214 ;	se8r01-receive-car.c: 62: delayTenMicro ();
      0080B1 CD 80 A0         [ 4]  215 	call	_delayTenMicro
                                    216 ;	se8r01-receive-car.c: 63: while ((SPI_SR & TXE) == 0);
      0080B4                        217 00101$:
      0080B4 AE 52 03         [ 2]  218 	ldw	x, #0x5203
      0080B7 F6               [ 1]  219 	ld	a, (x)
      0080B8 A5 02            [ 1]  220 	bcp	a, #0x02
      0080BA 27 F8            [ 1]  221 	jreq	00101$
                                    222 ;	se8r01-receive-car.c: 64: delayTenMicro ();
      0080BC CD 80 A0         [ 4]  223 	call	_delayTenMicro
                                    224 ;	se8r01-receive-car.c: 65: while ((SPI_SR & RXNE) == 0);
      0080BF                        225 00104$:
      0080BF AE 52 03         [ 2]  226 	ldw	x, #0x5203
      0080C2 F6               [ 1]  227 	ld	a, (x)
      0080C3 44               [ 1]  228 	srl	a
      0080C4 24 F9            [ 1]  229 	jrnc	00104$
                                    230 ;	se8r01-receive-car.c: 66: delayTenMicro ();
      0080C6 CD 80 A0         [ 4]  231 	call	_delayTenMicro
                                    232 ;	se8r01-receive-car.c: 67: ret = SPI_DR;
      0080C9 AE 52 04         [ 2]  233 	ldw	x, #0x5204
      0080CC F6               [ 1]  234 	ld	a, (x)
                                    235 ;	se8r01-receive-car.c: 68: return (ret);
      0080CD 81               [ 4]  236 	ret
                                    237 ;	se8r01-receive-car.c: 70: UCHAR write_spi_reg (UCHAR reg, UCHAR value) {
                                    238 ;	-----------------------------------------
                                    239 ;	 function write_spi_reg
                                    240 ;	-----------------------------------------
      0080CE                        241 _write_spi_reg:
      0080CE 88               [ 1]  242 	push	a
                                    243 ;	se8r01-receive-car.c: 72: PC_ODR &= ~(1 << CSN);
      0080CF AE 50 0A         [ 2]  244 	ldw	x, #0x500a
      0080D2 F6               [ 1]  245 	ld	a, (x)
      0080D3 A4 EF            [ 1]  246 	and	a, #0xef
      0080D5 F7               [ 1]  247 	ld	(x), a
                                    248 ;	se8r01-receive-car.c: 73: ret = write_spi (reg);
      0080D6 7B 04            [ 1]  249 	ld	a, (0x04, sp)
      0080D8 88               [ 1]  250 	push	a
      0080D9 CD 80 A8         [ 4]  251 	call	_write_spi
      0080DC 5B 01            [ 2]  252 	addw	sp, #1
      0080DE 6B 01            [ 1]  253 	ld	(0x01, sp), a
                                    254 ;	se8r01-receive-car.c: 74: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
      0080E0 7B 04            [ 1]  255 	ld	a, (0x04, sp)
      0080E2 A1 FF            [ 1]  256 	cp	a, #0xff
      0080E4 27 15            [ 1]  257 	jreq	00102$
      0080E6 7B 04            [ 1]  258 	ld	a, (0x04, sp)
      0080E8 A1 E2            [ 1]  259 	cp	a, #0xe2
      0080EA 27 0F            [ 1]  260 	jreq	00102$
      0080EC 7B 04            [ 1]  261 	ld	a, (0x04, sp)
      0080EE A1 E1            [ 1]  262 	cp	a, #0xe1
      0080F0 27 09            [ 1]  263 	jreq	00102$
                                    264 ;	se8r01-receive-car.c: 75: write_spi (value);
      0080F2 7B 05            [ 1]  265 	ld	a, (0x05, sp)
      0080F4 88               [ 1]  266 	push	a
      0080F5 CD 80 A8         [ 4]  267 	call	_write_spi
      0080F8 84               [ 1]  268 	pop	a
      0080F9 20 03            [ 2]  269 	jra	00103$
      0080FB                        270 00102$:
                                    271 ;	se8r01-receive-car.c: 77: delayTenMicro ();
      0080FB CD 80 A0         [ 4]  272 	call	_delayTenMicro
      0080FE                        273 00103$:
                                    274 ;	se8r01-receive-car.c: 78: PC_ODR |= (1 << CSN);
      0080FE AE 50 0A         [ 2]  275 	ldw	x, #0x500a
      008101 F6               [ 1]  276 	ld	a, (x)
      008102 AA 10            [ 1]  277 	or	a, #0x10
      008104 F7               [ 1]  278 	ld	(x), a
                                    279 ;	se8r01-receive-car.c: 79: return (ret);
      008105 7B 01            [ 1]  280 	ld	a, (0x01, sp)
      008107 5B 01            [ 2]  281 	addw	sp, #1
      008109 81               [ 4]  282 	ret
                                    283 ;	se8r01-receive-car.c: 81: UCHAR read_spi_reg (UCHAR reg) {
                                    284 ;	-----------------------------------------
                                    285 ;	 function read_spi_reg
                                    286 ;	-----------------------------------------
      00810A                        287 _read_spi_reg:
      00810A 88               [ 1]  288 	push	a
                                    289 ;	se8r01-receive-car.c: 83: PC_ODR &= ~(1 << CSN);
      00810B AE 50 0A         [ 2]  290 	ldw	x, #0x500a
      00810E F6               [ 1]  291 	ld	a, (x)
      00810F A4 EF            [ 1]  292 	and	a, #0xef
      008111 F7               [ 1]  293 	ld	(x), a
                                    294 ;	se8r01-receive-car.c: 84: ret = write_spi (reg);
      008112 7B 04            [ 1]  295 	ld	a, (0x04, sp)
      008114 88               [ 1]  296 	push	a
      008115 CD 80 A8         [ 4]  297 	call	_write_spi
      008118 5B 01            [ 2]  298 	addw	sp, #1
      00811A 6B 01            [ 1]  299 	ld	(0x01, sp), a
                                    300 ;	se8r01-receive-car.c: 85: if (reg != NOP && reg != FLUSH_RX && reg != FLUSH_TX)
      00811C 7B 04            [ 1]  301 	ld	a, (0x04, sp)
      00811E A1 FF            [ 1]  302 	cp	a, #0xff
      008120 27 17            [ 1]  303 	jreq	00102$
      008122 7B 04            [ 1]  304 	ld	a, (0x04, sp)
      008124 A1 E2            [ 1]  305 	cp	a, #0xe2
      008126 27 11            [ 1]  306 	jreq	00102$
      008128 7B 04            [ 1]  307 	ld	a, (0x04, sp)
      00812A A1 E1            [ 1]  308 	cp	a, #0xe1
      00812C 27 0B            [ 1]  309 	jreq	00102$
                                    310 ;	se8r01-receive-car.c: 86: ret = write_spi (NOP);
      00812E 4B FF            [ 1]  311 	push	#0xff
      008130 CD 80 A8         [ 4]  312 	call	_write_spi
      008133 5B 01            [ 2]  313 	addw	sp, #1
      008135 6B 01            [ 1]  314 	ld	(0x01, sp), a
      008137 20 03            [ 2]  315 	jra	00103$
      008139                        316 00102$:
                                    317 ;	se8r01-receive-car.c: 88: delayTenMicro ();
      008139 CD 80 A0         [ 4]  318 	call	_delayTenMicro
      00813C                        319 00103$:
                                    320 ;	se8r01-receive-car.c: 89: PC_ODR |= (1 << CSN);
      00813C AE 50 0A         [ 2]  321 	ldw	x, #0x500a
      00813F F6               [ 1]  322 	ld	a, (x)
      008140 AA 10            [ 1]  323 	or	a, #0x10
      008142 F7               [ 1]  324 	ld	(x), a
                                    325 ;	se8r01-receive-car.c: 90: return (ret);
      008143 7B 01            [ 1]  326 	ld	a, (0x01, sp)
      008145 5B 01            [ 2]  327 	addw	sp, #1
      008147 81               [ 4]  328 	ret
                                    329 ;	se8r01-receive-car.c: 92: UCHAR write_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
                                    330 ;	-----------------------------------------
                                    331 ;	 function write_spi_buf
                                    332 ;	-----------------------------------------
      008148                        333 _write_spi_buf:
      008148 52 02            [ 2]  334 	sub	sp, #2
                                    335 ;	se8r01-receive-car.c: 94: PC_ODR &= ~(1 << CSN);
      00814A AE 50 0A         [ 2]  336 	ldw	x, #0x500a
      00814D F6               [ 1]  337 	ld	a, (x)
      00814E A4 EF            [ 1]  338 	and	a, #0xef
      008150 F7               [ 1]  339 	ld	(x), a
                                    340 ;	se8r01-receive-car.c: 95: ret = write_spi (reg);
      008151 7B 05            [ 1]  341 	ld	a, (0x05, sp)
      008153 88               [ 1]  342 	push	a
      008154 CD 80 A8         [ 4]  343 	call	_write_spi
      008157 5B 01            [ 2]  344 	addw	sp, #1
      008159 6B 02            [ 1]  345 	ld	(0x02, sp), a
                                    346 ;	se8r01-receive-car.c: 96: for (n = 0; n < len; ++n)
      00815B 0F 01            [ 1]  347 	clr	(0x01, sp)
      00815D                        348 00103$:
      00815D 7B 01            [ 1]  349 	ld	a, (0x01, sp)
      00815F 11 08            [ 1]  350 	cp	a, (0x08, sp)
      008161 24 11            [ 1]  351 	jrnc	00101$
                                    352 ;	se8r01-receive-car.c: 97: write_spi (array[n]);
      008163 5F               [ 1]  353 	clrw	x
      008164 7B 01            [ 1]  354 	ld	a, (0x01, sp)
      008166 97               [ 1]  355 	ld	xl, a
      008167 72 FB 06         [ 2]  356 	addw	x, (0x06, sp)
      00816A F6               [ 1]  357 	ld	a, (x)
      00816B 88               [ 1]  358 	push	a
      00816C CD 80 A8         [ 4]  359 	call	_write_spi
      00816F 84               [ 1]  360 	pop	a
                                    361 ;	se8r01-receive-car.c: 96: for (n = 0; n < len; ++n)
      008170 0C 01            [ 1]  362 	inc	(0x01, sp)
      008172 20 E9            [ 2]  363 	jra	00103$
      008174                        364 00101$:
                                    365 ;	se8r01-receive-car.c: 98: PC_ODR |= (1 << CSN);
      008174 AE 50 0A         [ 2]  366 	ldw	x, #0x500a
      008177 F6               [ 1]  367 	ld	a, (x)
      008178 AA 10            [ 1]  368 	or	a, #0x10
      00817A F7               [ 1]  369 	ld	(x), a
                                    370 ;	se8r01-receive-car.c: 99: return (ret);
      00817B 7B 02            [ 1]  371 	ld	a, (0x02, sp)
      00817D 5B 02            [ 2]  372 	addw	sp, #2
      00817F 81               [ 4]  373 	ret
                                    374 ;	se8r01-receive-car.c: 101: UCHAR read_spi_buf (UCHAR reg, UCHAR *array, UCHAR len) {
                                    375 ;	-----------------------------------------
                                    376 ;	 function read_spi_buf
                                    377 ;	-----------------------------------------
      008180                        378 _read_spi_buf:
      008180 52 02            [ 2]  379 	sub	sp, #2
                                    380 ;	se8r01-receive-car.c: 103: PC_ODR &= ~(1 << CSN);
      008182 AE 50 0A         [ 2]  381 	ldw	x, #0x500a
      008185 F6               [ 1]  382 	ld	a, (x)
      008186 A4 EF            [ 1]  383 	and	a, #0xef
      008188 F7               [ 1]  384 	ld	(x), a
                                    385 ;	se8r01-receive-car.c: 104: ret = write_spi (reg);
      008189 7B 05            [ 1]  386 	ld	a, (0x05, sp)
      00818B 88               [ 1]  387 	push	a
      00818C CD 80 A8         [ 4]  388 	call	_write_spi
      00818F 5B 01            [ 2]  389 	addw	sp, #1
      008191 6B 01            [ 1]  390 	ld	(0x01, sp), a
                                    391 ;	se8r01-receive-car.c: 105: for (n = 0; n < len; ++n)
      008193 0F 02            [ 1]  392 	clr	(0x02, sp)
      008195                        393 00103$:
      008195 7B 02            [ 1]  394 	ld	a, (0x02, sp)
      008197 11 08            [ 1]  395 	cp	a, (0x08, sp)
      008199 24 15            [ 1]  396 	jrnc	00101$
                                    397 ;	se8r01-receive-car.c: 106: array[n] = write_spi (NOP);
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
                                    408 ;	se8r01-receive-car.c: 105: for (n = 0; n < len; ++n)
      0081AC 0C 02            [ 1]  409 	inc	(0x02, sp)
      0081AE 20 E5            [ 2]  410 	jra	00103$
      0081B0                        411 00101$:
                                    412 ;	se8r01-receive-car.c: 107: PC_ODR |= (1 << CSN);
      0081B0 AE 50 0A         [ 2]  413 	ldw	x, #0x500a
      0081B3 F6               [ 1]  414 	ld	a, (x)
      0081B4 AA 10            [ 1]  415 	or	a, #0x10
      0081B6 F7               [ 1]  416 	ld	(x), a
                                    417 ;	se8r01-receive-car.c: 108: return (ret);
      0081B7 7B 01            [ 1]  418 	ld	a, (0x01, sp)
      0081B9 5B 02            [ 2]  419 	addw	sp, #2
      0081BB 81               [ 4]  420 	ret
                                    421 ;	se8r01-receive-car.c: 110: void InitializeSPI () {
                                    422 ;	-----------------------------------------
                                    423 ;	 function InitializeSPI
                                    424 ;	-----------------------------------------
      0081BC                        425 _InitializeSPI:
                                    426 ;	se8r01-receive-car.c: 111: SPI_CR1 = MSBFIRST | SPI_ENABLE | BR_DIV256 | MASTER | CPOL0 | CPHA0;
      0081BC AE 52 00         [ 2]  427 	ldw	x, #0x5200
      0081BF A6 7C            [ 1]  428 	ld	a, #0x7c
      0081C1 F7               [ 1]  429 	ld	(x), a
                                    430 ;	se8r01-receive-car.c: 112: SPI_CR2 = BDM_2LINE | CRCEN_OFF | CRCNEXT_TXBUF | FULL_DUPLEX | SSM_DISABLE;
      0081C2 AE 52 01         [ 2]  431 	ldw	x, #0x5201
      0081C5 7F               [ 1]  432 	clr	(x)
                                    433 ;	se8r01-receive-car.c: 113: SPI_ICR = TXIE_MASKED | RXIE_MASKED | ERRIE_MASKED | WKIE_MASKED;
      0081C6 AE 52 02         [ 2]  434 	ldw	x, #0x5202
      0081C9 7F               [ 1]  435 	clr	(x)
                                    436 ;	se8r01-receive-car.c: 114: PC_DDR = (1 << PC3) | (1 << PC4); // output mode
      0081CA AE 50 0C         [ 2]  437 	ldw	x, #0x500c
      0081CD A6 18            [ 1]  438 	ld	a, #0x18
      0081CF F7               [ 1]  439 	ld	(x), a
                                    440 ;	se8r01-receive-car.c: 115: PC_CR1 = (1 << PC3) | (1 << PC4); // push-pull
      0081D0 AE 50 0D         [ 2]  441 	ldw	x, #0x500d
      0081D3 A6 18            [ 1]  442 	ld	a, #0x18
      0081D5 F7               [ 1]  443 	ld	(x), a
                                    444 ;	se8r01-receive-car.c: 116: PC_CR2 = (1 << PC3) | (1 << PC4); // up to 10MHz speed
      0081D6 AE 50 0E         [ 2]  445 	ldw	x, #0x500e
      0081D9 A6 18            [ 1]  446 	ld	a, #0x18
      0081DB F7               [ 1]  447 	ld	(x), a
                                    448 ;	se8r01-receive-car.c: 118: PC_ODR &= ~(1 << CE);
      0081DC AE 50 0A         [ 2]  449 	ldw	x, #0x500a
      0081DF F6               [ 1]  450 	ld	a, (x)
      0081E0 A4 F7            [ 1]  451 	and	a, #0xf7
      0081E2 F7               [ 1]  452 	ld	(x), a
      0081E3 81               [ 4]  453 	ret
                                    454 ;	se8r01-receive-car.c: 120: void InitializeSystemClock() {
                                    455 ;	-----------------------------------------
                                    456 ;	 function InitializeSystemClock
                                    457 ;	-----------------------------------------
      0081E4                        458 _InitializeSystemClock:
                                    459 ;	se8r01-receive-car.c: 121: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
      0081E4 AE 50 C0         [ 2]  460 	ldw	x, #0x50c0
      0081E7 7F               [ 1]  461 	clr	(x)
                                    462 ;	se8r01-receive-car.c: 122: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
      0081E8 AE 50 C0         [ 2]  463 	ldw	x, #0x50c0
      0081EB A6 01            [ 1]  464 	ld	a, #0x01
      0081ED F7               [ 1]  465 	ld	(x), a
                                    466 ;	se8r01-receive-car.c: 123: CLK_ECKR = 0;                       //  Disable the external clock.
      0081EE AE 50 C1         [ 2]  467 	ldw	x, #0x50c1
      0081F1 7F               [ 1]  468 	clr	(x)
                                    469 ;	se8r01-receive-car.c: 124: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
      0081F2                        470 00101$:
      0081F2 AE 50 C0         [ 2]  471 	ldw	x, #0x50c0
      0081F5 F6               [ 1]  472 	ld	a, (x)
      0081F6 A5 02            [ 1]  473 	bcp	a, #0x02
      0081F8 27 F8            [ 1]  474 	jreq	00101$
                                    475 ;	se8r01-receive-car.c: 125: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
      0081FA AE 50 C6         [ 2]  476 	ldw	x, #0x50c6
      0081FD 7F               [ 1]  477 	clr	(x)
                                    478 ;	se8r01-receive-car.c: 126: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
      0081FE AE 50 C7         [ 2]  479 	ldw	x, #0x50c7
      008201 A6 FF            [ 1]  480 	ld	a, #0xff
      008203 F7               [ 1]  481 	ld	(x), a
                                    482 ;	se8r01-receive-car.c: 127: CLK_PCKENR2 = 0xff;                 //  Ditto.
      008204 AE 50 CA         [ 2]  483 	ldw	x, #0x50ca
      008207 A6 FF            [ 1]  484 	ld	a, #0xff
      008209 F7               [ 1]  485 	ld	(x), a
                                    486 ;	se8r01-receive-car.c: 128: CLK_CCOR = 0;                       //  Turn off CCO.
      00820A AE 50 C9         [ 2]  487 	ldw	x, #0x50c9
      00820D 7F               [ 1]  488 	clr	(x)
                                    489 ;	se8r01-receive-car.c: 129: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
      00820E AE 50 CC         [ 2]  490 	ldw	x, #0x50cc
      008211 7F               [ 1]  491 	clr	(x)
                                    492 ;	se8r01-receive-car.c: 130: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
      008212 AE 50 CD         [ 2]  493 	ldw	x, #0x50cd
      008215 7F               [ 1]  494 	clr	(x)
                                    495 ;	se8r01-receive-car.c: 131: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
      008216 AE 50 C4         [ 2]  496 	ldw	x, #0x50c4
      008219 A6 E1            [ 1]  497 	ld	a, #0xe1
      00821B F7               [ 1]  498 	ld	(x), a
                                    499 ;	se8r01-receive-car.c: 132: CLK_SWCR = 0;                       //  Reset the clock switch control register.
      00821C AE 50 C5         [ 2]  500 	ldw	x, #0x50c5
      00821F 7F               [ 1]  501 	clr	(x)
                                    502 ;	se8r01-receive-car.c: 133: CLK_SWCR = CLK_SWEN;                //  Enable switching.
      008220 AE 50 C5         [ 2]  503 	ldw	x, #0x50c5
      008223 A6 02            [ 1]  504 	ld	a, #0x02
      008225 F7               [ 1]  505 	ld	(x), a
                                    506 ;	se8r01-receive-car.c: 134: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
      008226                        507 00104$:
      008226 AE 50 C5         [ 2]  508 	ldw	x, #0x50c5
      008229 F6               [ 1]  509 	ld	a, (x)
      00822A 44               [ 1]  510 	srl	a
      00822B 25 F9            [ 1]  511 	jrc	00104$
      00822D 81               [ 4]  512 	ret
                                    513 ;	se8r01-receive-car.c: 136: void delay (int time_ms) {
                                    514 ;	-----------------------------------------
                                    515 ;	 function delay
                                    516 ;	-----------------------------------------
      00822E                        517 _delay:
      00822E 52 0A            [ 2]  518 	sub	sp, #10
                                    519 ;	se8r01-receive-car.c: 138: for (x = 0; x < 1036*time_ms; ++x)
      008230 5F               [ 1]  520 	clrw	x
      008231 1F 03            [ 2]  521 	ldw	(0x03, sp), x
      008233 1F 01            [ 2]  522 	ldw	(0x01, sp), x
      008235 1E 0D            [ 2]  523 	ldw	x, (0x0d, sp)
      008237 89               [ 2]  524 	pushw	x
      008238 4B 0C            [ 1]  525 	push	#0x0c
      00823A 4B 04            [ 1]  526 	push	#0x04
      00823C CD 8B DC         [ 4]  527 	call	__mulint
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
                                    546 ;	se8r01-receive-car.c: 139: __asm__("nop");
      00825F 9D               [ 1]  547 	nop
                                    548 ;	se8r01-receive-car.c: 138: for (x = 0; x < 1036*time_ms; ++x)
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
                                    563 ;	se8r01-receive-car.c: 144: void UARTPrintF (char *message) {
                                    564 ;	-----------------------------------------
                                    565 ;	 function UARTPrintF
                                    566 ;	-----------------------------------------
      008279                        567 _UARTPrintF:
                                    568 ;	se8r01-receive-car.c: 145: char *ch = message;
      008279 16 03            [ 2]  569 	ldw	y, (0x03, sp)
                                    570 ;	se8r01-receive-car.c: 146: while (*ch) {
      00827B                        571 00104$:
      00827B 90 F6            [ 1]  572 	ld	a, (y)
      00827D 4D               [ 1]  573 	tnz	a
      00827E 27 0F            [ 1]  574 	jreq	00107$
                                    575 ;	se8r01-receive-car.c: 147: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
      008280 AE 52 31         [ 2]  576 	ldw	x, #0x5231
      008283 F7               [ 1]  577 	ld	(x), a
                                    578 ;	se8r01-receive-car.c: 148: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
      008284                        579 00101$:
      008284 AE 52 30         [ 2]  580 	ldw	x, #0x5230
      008287 F6               [ 1]  581 	ld	a, (x)
      008288 48               [ 1]  582 	sll	a
      008289 24 F9            [ 1]  583 	jrnc	00101$
                                    584 ;	se8r01-receive-car.c: 149: ch++;                               //  Grab the next character.
      00828B 90 5C            [ 2]  585 	incw	y
      00828D 20 EC            [ 2]  586 	jra	00104$
      00828F                        587 00107$:
      00828F 81               [ 4]  588 	ret
                                    589 ;	se8r01-receive-car.c: 152: void print_UCHAR_hex (unsigned char buffer) {
                                    590 ;	-----------------------------------------
                                    591 ;	 function print_UCHAR_hex
                                    592 ;	-----------------------------------------
      008290                        593 _print_UCHAR_hex:
      008290 52 0C            [ 2]  594 	sub	sp, #12
                                    595 ;	se8r01-receive-car.c: 155: a = (buffer >> 4);
      008292 7B 0F            [ 1]  596 	ld	a, (0x0f, sp)
      008294 4E               [ 1]  597 	swap	a
      008295 A4 0F            [ 1]  598 	and	a, #0x0f
      008297 5F               [ 1]  599 	clrw	x
      008298 97               [ 1]  600 	ld	xl, a
                                    601 ;	se8r01-receive-car.c: 156: if (a > 9)
      008299 A3 00 09         [ 2]  602 	cpw	x, #0x0009
      00829C 2D 07            [ 1]  603 	jrsle	00102$
                                    604 ;	se8r01-receive-car.c: 157: a = a + 'a' - 10;
      00829E 1C 00 57         [ 2]  605 	addw	x, #0x0057
      0082A1 1F 0B            [ 2]  606 	ldw	(0x0b, sp), x
      0082A3 20 05            [ 2]  607 	jra	00103$
      0082A5                        608 00102$:
                                    609 ;	se8r01-receive-car.c: 159: a += '0'; 
      0082A5 1C 00 30         [ 2]  610 	addw	x, #0x0030
      0082A8 1F 0B            [ 2]  611 	ldw	(0x0b, sp), x
      0082AA                        612 00103$:
                                    613 ;	se8r01-receive-car.c: 160: b = buffer & 0x0f;
      0082AA 7B 0F            [ 1]  614 	ld	a, (0x0f, sp)
      0082AC A4 0F            [ 1]  615 	and	a, #0x0f
      0082AE 5F               [ 1]  616 	clrw	x
      0082AF 97               [ 1]  617 	ld	xl, a
                                    618 ;	se8r01-receive-car.c: 161: if (b > 9)
      0082B0 A3 00 09         [ 2]  619 	cpw	x, #0x0009
      0082B3 2D 07            [ 1]  620 	jrsle	00105$
                                    621 ;	se8r01-receive-car.c: 162: b = b + 'a' - 10;
      0082B5 1C 00 57         [ 2]  622 	addw	x, #0x0057
      0082B8 1F 09            [ 2]  623 	ldw	(0x09, sp), x
      0082BA 20 05            [ 2]  624 	jra	00106$
      0082BC                        625 00105$:
                                    626 ;	se8r01-receive-car.c: 164: b += '0'; 
      0082BC 1C 00 30         [ 2]  627 	addw	x, #0x0030
      0082BF 1F 09            [ 2]  628 	ldw	(0x09, sp), x
      0082C1                        629 00106$:
                                    630 ;	se8r01-receive-car.c: 165: message[0] = a;
      0082C1 90 96            [ 1]  631 	ldw	y, sp
      0082C3 90 5C            [ 2]  632 	incw	y
      0082C5 7B 0C            [ 1]  633 	ld	a, (0x0c, sp)
      0082C7 90 F7            [ 1]  634 	ld	(y), a
                                    635 ;	se8r01-receive-car.c: 166: message[1] = b;
      0082C9 93               [ 1]  636 	ldw	x, y
      0082CA 5C               [ 2]  637 	incw	x
      0082CB 7B 0A            [ 1]  638 	ld	a, (0x0a, sp)
      0082CD F7               [ 1]  639 	ld	(x), a
                                    640 ;	se8r01-receive-car.c: 167: message[2] = 0;
      0082CE 93               [ 1]  641 	ldw	x, y
      0082CF 5C               [ 2]  642 	incw	x
      0082D0 5C               [ 2]  643 	incw	x
      0082D1 7F               [ 1]  644 	clr	(x)
                                    645 ;	se8r01-receive-car.c: 168: UARTPrintF (message);
      0082D2 90 89            [ 2]  646 	pushw	y
      0082D4 CD 82 79         [ 4]  647 	call	_UARTPrintF
      0082D7 5B 02            [ 2]  648 	addw	sp, #2
      0082D9 5B 0C            [ 2]  649 	addw	sp, #12
      0082DB 81               [ 4]  650 	ret
                                    651 ;	se8r01-receive-car.c: 171: void InitializeUART() {
                                    652 ;	-----------------------------------------
                                    653 ;	 function InitializeUART
                                    654 ;	-----------------------------------------
      0082DC                        655 _InitializeUART:
                                    656 ;	se8r01-receive-car.c: 181: UART1_CR1 = 0;
      0082DC AE 52 34         [ 2]  657 	ldw	x, #0x5234
      0082DF 7F               [ 1]  658 	clr	(x)
                                    659 ;	se8r01-receive-car.c: 182: UART1_CR2 = 0;
      0082E0 AE 52 35         [ 2]  660 	ldw	x, #0x5235
      0082E3 7F               [ 1]  661 	clr	(x)
                                    662 ;	se8r01-receive-car.c: 183: UART1_CR4 = 0;
      0082E4 AE 52 37         [ 2]  663 	ldw	x, #0x5237
      0082E7 7F               [ 1]  664 	clr	(x)
                                    665 ;	se8r01-receive-car.c: 184: UART1_CR3 = 0;
      0082E8 AE 52 36         [ 2]  666 	ldw	x, #0x5236
      0082EB 7F               [ 1]  667 	clr	(x)
                                    668 ;	se8r01-receive-car.c: 185: UART1_CR5 = 0;
      0082EC AE 52 38         [ 2]  669 	ldw	x, #0x5238
      0082EF 7F               [ 1]  670 	clr	(x)
                                    671 ;	se8r01-receive-car.c: 186: UART1_GTR = 0;
      0082F0 AE 52 39         [ 2]  672 	ldw	x, #0x5239
      0082F3 7F               [ 1]  673 	clr	(x)
                                    674 ;	se8r01-receive-car.c: 187: UART1_PSCR = 0;
      0082F4 AE 52 3A         [ 2]  675 	ldw	x, #0x523a
      0082F7 7F               [ 1]  676 	clr	(x)
                                    677 ;	se8r01-receive-car.c: 191: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
      0082F8 AE 52 34         [ 2]  678 	ldw	x, #0x5234
      0082FB F6               [ 1]  679 	ld	a, (x)
      0082FC A4 EF            [ 1]  680 	and	a, #0xef
      0082FE F7               [ 1]  681 	ld	(x), a
                                    682 ;	se8r01-receive-car.c: 192: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
      0082FF AE 52 34         [ 2]  683 	ldw	x, #0x5234
      008302 F6               [ 1]  684 	ld	a, (x)
      008303 A4 FB            [ 1]  685 	and	a, #0xfb
      008305 F7               [ 1]  686 	ld	(x), a
                                    687 ;	se8r01-receive-car.c: 193: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
      008306 AE 52 36         [ 2]  688 	ldw	x, #0x5236
      008309 F6               [ 1]  689 	ld	a, (x)
      00830A A4 DF            [ 1]  690 	and	a, #0xdf
      00830C F7               [ 1]  691 	ld	(x), a
                                    692 ;	se8r01-receive-car.c: 194: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
      00830D AE 52 36         [ 2]  693 	ldw	x, #0x5236
      008310 F6               [ 1]  694 	ld	a, (x)
      008311 A4 EF            [ 1]  695 	and	a, #0xef
      008313 F7               [ 1]  696 	ld	(x), a
                                    697 ;	se8r01-receive-car.c: 195: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
      008314 AE 52 33         [ 2]  698 	ldw	x, #0x5233
      008317 A6 0A            [ 1]  699 	ld	a, #0x0a
      008319 F7               [ 1]  700 	ld	(x), a
                                    701 ;	se8r01-receive-car.c: 196: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
      00831A AE 52 32         [ 2]  702 	ldw	x, #0x5232
      00831D A6 08            [ 1]  703 	ld	a, #0x08
      00831F F7               [ 1]  704 	ld	(x), a
                                    705 ;	se8r01-receive-car.c: 200: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
      008320 AE 52 35         [ 2]  706 	ldw	x, #0x5235
      008323 F6               [ 1]  707 	ld	a, (x)
      008324 A4 F7            [ 1]  708 	and	a, #0xf7
      008326 F7               [ 1]  709 	ld	(x), a
                                    710 ;	se8r01-receive-car.c: 201: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
      008327 AE 52 35         [ 2]  711 	ldw	x, #0x5235
      00832A F6               [ 1]  712 	ld	a, (x)
      00832B A4 FB            [ 1]  713 	and	a, #0xfb
      00832D F7               [ 1]  714 	ld	(x), a
                                    715 ;	se8r01-receive-car.c: 205: SET (UART1_CR3, CR3_CPOL);
      00832E AE 52 36         [ 2]  716 	ldw	x, #0x5236
      008331 F6               [ 1]  717 	ld	a, (x)
      008332 AA 04            [ 1]  718 	or	a, #0x04
      008334 F7               [ 1]  719 	ld	(x), a
                                    720 ;	se8r01-receive-car.c: 206: SET (UART1_CR3, CR3_CPHA);
      008335 AE 52 36         [ 2]  721 	ldw	x, #0x5236
      008338 F6               [ 1]  722 	ld	a, (x)
      008339 AA 02            [ 1]  723 	or	a, #0x02
      00833B F7               [ 1]  724 	ld	(x), a
                                    725 ;	se8r01-receive-car.c: 207: SET (UART1_CR3, CR3_LBCL);
      00833C 72 10 52 36      [ 1]  726 	bset	0x5236, #0
                                    727 ;	se8r01-receive-car.c: 211: SET (UART1_CR2, CR2_TEN);
      008340 AE 52 35         [ 2]  728 	ldw	x, #0x5235
      008343 F6               [ 1]  729 	ld	a, (x)
      008344 AA 08            [ 1]  730 	or	a, #0x08
      008346 F7               [ 1]  731 	ld	(x), a
                                    732 ;	se8r01-receive-car.c: 212: SET (UART1_CR2, CR2_REN);
      008347 AE 52 35         [ 2]  733 	ldw	x, #0x5235
      00834A F6               [ 1]  734 	ld	a, (x)
      00834B AA 04            [ 1]  735 	or	a, #0x04
      00834D F7               [ 1]  736 	ld	(x), a
                                    737 ;	se8r01-receive-car.c: 213: UART1_CR3 = CR3_CLKEN;
      00834E AE 52 36         [ 2]  738 	ldw	x, #0x5236
      008351 A6 08            [ 1]  739 	ld	a, #0x08
      008353 F7               [ 1]  740 	ld	(x), a
      008354 81               [ 4]  741 	ret
                                    742 ;	se8r01-receive-car.c: 286: void init_io(void)
                                    743 ;	-----------------------------------------
                                    744 ;	 function init_io
                                    745 ;	-----------------------------------------
      008355                        746 _init_io:
                                    747 ;	se8r01-receive-car.c: 294: PC_ODR &= ~(1 << CE);
      008355 AE 50 0A         [ 2]  748 	ldw	x, #0x500a
      008358 F6               [ 1]  749 	ld	a, (x)
      008359 A4 F7            [ 1]  750 	and	a, #0xf7
      00835B F7               [ 1]  751 	ld	(x), a
                                    752 ;	se8r01-receive-car.c: 296: PC_ODR |= (1 << CSN);
      00835C AE 50 0A         [ 2]  753 	ldw	x, #0x500a
      00835F F6               [ 1]  754 	ld	a, (x)
      008360 AA 10            [ 1]  755 	or	a, #0x10
      008362 F7               [ 1]  756 	ld	(x), a
      008363 81               [ 4]  757 	ret
                                    758 ;	se8r01-receive-car.c: 302: void rf_switch_bank(unsigned char bankindex)
                                    759 ;	-----------------------------------------
                                    760 ;	 function rf_switch_bank
                                    761 ;	-----------------------------------------
      008364                        762 _rf_switch_bank:
      008364 88               [ 1]  763 	push	a
                                    764 ;	se8r01-receive-car.c: 305: temp1 = bankindex;
      008365 7B 04            [ 1]  765 	ld	a, (0x04, sp)
      008367 6B 01            [ 1]  766 	ld	(0x01, sp), a
                                    767 ;	se8r01-receive-car.c: 307: temp0 = write_spi(iRF_BANK0_STATUS);
      008369 4B 07            [ 1]  768 	push	#0x07
      00836B CD 80 A8         [ 4]  769 	call	_write_spi
      00836E 5B 01            [ 2]  770 	addw	sp, #1
                                    771 ;	se8r01-receive-car.c: 309: if((temp0&0x80)!=temp1)
      008370 A4 80            [ 1]  772 	and	a, #0x80
      008372 11 01            [ 1]  773 	cp	a, (0x01, sp)
      008374 27 09            [ 1]  774 	jreq	00103$
                                    775 ;	se8r01-receive-car.c: 311: write_spi_reg(iRF_CMD_ACTIVATE,0x53);
      008376 4B 53            [ 1]  776 	push	#0x53
      008378 4B 50            [ 1]  777 	push	#0x50
      00837A CD 80 CE         [ 4]  778 	call	_write_spi_reg
      00837D 5B 02            [ 2]  779 	addw	sp, #2
      00837F                        780 00103$:
      00837F 84               [ 1]  781 	pop	a
      008380 81               [ 4]  782 	ret
                                    783 ;	se8r01-receive-car.c: 318: void SE8R01_Calibration()
                                    784 ;	-----------------------------------------
                                    785 ;	 function SE8R01_Calibration
                                    786 ;	-----------------------------------------
      008381                        787 _SE8R01_Calibration:
      008381 52 0D            [ 2]  788 	sub	sp, #13
                                    789 ;	se8r01-receive-car.c: 321: rf_switch_bank(iBANK0);
      008383 4B 00            [ 1]  790 	push	#0x00
      008385 CD 83 64         [ 4]  791 	call	_rf_switch_bank
      008388 84               [ 1]  792 	pop	a
                                    793 ;	se8r01-receive-car.c: 322: temp[0]=0x03;
      008389 96               [ 1]  794 	ldw	x, sp
      00838A 5C               [ 2]  795 	incw	x
      00838B 1F 06            [ 2]  796 	ldw	(0x06, sp), x
      00838D 1E 06            [ 2]  797 	ldw	x, (0x06, sp)
      00838F A6 03            [ 1]  798 	ld	a, #0x03
      008391 F7               [ 1]  799 	ld	(x), a
                                    800 ;	se8r01-receive-car.c: 323: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_CONFIG,temp, 1);
      008392 1E 06            [ 2]  801 	ldw	x, (0x06, sp)
      008394 4B 01            [ 1]  802 	push	#0x01
      008396 89               [ 2]  803 	pushw	x
      008397 4B 20            [ 1]  804 	push	#0x20
      008399 CD 81 48         [ 4]  805 	call	_write_spi_buf
      00839C 5B 04            [ 2]  806 	addw	sp, #4
                                    807 ;	se8r01-receive-car.c: 325: temp[0]=0x32;
      00839E 1E 06            [ 2]  808 	ldw	x, (0x06, sp)
      0083A0 A6 32            [ 1]  809 	ld	a, #0x32
      0083A2 F7               [ 1]  810 	ld	(x), a
                                    811 ;	se8r01-receive-car.c: 327: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_CH, temp,1);
      0083A3 1E 06            [ 2]  812 	ldw	x, (0x06, sp)
      0083A5 4B 01            [ 1]  813 	push	#0x01
      0083A7 89               [ 2]  814 	pushw	x
      0083A8 4B 25            [ 1]  815 	push	#0x25
      0083AA CD 81 48         [ 4]  816 	call	_write_spi_buf
      0083AD 5B 04            [ 2]  817 	addw	sp, #4
                                    818 ;	se8r01-receive-car.c: 331: if (SE8R01_DR_2M==1)
      0083AF CE 00 10         [ 2]  819 	ldw	x, _SE8R01_DR_2M+0
      0083B2 A3 00 01         [ 2]  820 	cpw	x, #0x0001
      0083B5 26 07            [ 1]  821 	jrne	00105$
                                    822 ;	se8r01-receive-car.c: 332: {temp[0]=0x48;}
      0083B7 1E 06            [ 2]  823 	ldw	x, (0x06, sp)
      0083B9 A6 48            [ 1]  824 	ld	a, #0x48
      0083BB F7               [ 1]  825 	ld	(x), a
      0083BC 20 14            [ 2]  826 	jra	00106$
      0083BE                        827 00105$:
                                    828 ;	se8r01-receive-car.c: 333: else if (SE8R01_DR_1M==1)
      0083BE CE 00 12         [ 2]  829 	ldw	x, _SE8R01_DR_1M+0
      0083C1 A3 00 01         [ 2]  830 	cpw	x, #0x0001
      0083C4 26 07            [ 1]  831 	jrne	00102$
                                    832 ;	se8r01-receive-car.c: 334: {temp[0]=0x40;}
      0083C6 1E 06            [ 2]  833 	ldw	x, (0x06, sp)
      0083C8 A6 40            [ 1]  834 	ld	a, #0x40
      0083CA F7               [ 1]  835 	ld	(x), a
      0083CB 20 05            [ 2]  836 	jra	00106$
      0083CD                        837 00102$:
                                    838 ;	se8r01-receive-car.c: 336: {temp[0]=0x68;}   
      0083CD 1E 06            [ 2]  839 	ldw	x, (0x06, sp)
      0083CF A6 68            [ 1]  840 	ld	a, #0x68
      0083D1 F7               [ 1]  841 	ld	(x), a
      0083D2                        842 00106$:
                                    843 ;	se8r01-receive-car.c: 338: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
      0083D2 1E 06            [ 2]  844 	ldw	x, (0x06, sp)
      0083D4 4B 01            [ 1]  845 	push	#0x01
      0083D6 89               [ 2]  846 	pushw	x
      0083D7 4B 26            [ 1]  847 	push	#0x26
      0083D9 CD 81 48         [ 4]  848 	call	_write_spi_buf
      0083DC 5B 04            [ 2]  849 	addw	sp, #4
                                    850 ;	se8r01-receive-car.c: 339: temp[0]=0x77;
      0083DE 1E 06            [ 2]  851 	ldw	x, (0x06, sp)
      0083E0 A6 77            [ 1]  852 	ld	a, #0x77
      0083E2 F7               [ 1]  853 	ld	(x), a
                                    854 ;	se8r01-receive-car.c: 340: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_PRE_GURD, temp,1);
      0083E3 1E 06            [ 2]  855 	ldw	x, (0x06, sp)
      0083E5 4B 01            [ 1]  856 	push	#0x01
      0083E7 89               [ 2]  857 	pushw	x
      0083E8 4B 3F            [ 1]  858 	push	#0x3f
      0083EA CD 81 48         [ 4]  859 	call	_write_spi_buf
      0083ED 5B 04            [ 2]  860 	addw	sp, #4
                                    861 ;	se8r01-receive-car.c: 342: rf_switch_bank(iBANK1);
      0083EF 4B 80            [ 1]  862 	push	#0x80
      0083F1 CD 83 64         [ 4]  863 	call	_rf_switch_bank
      0083F4 84               [ 1]  864 	pop	a
                                    865 ;	se8r01-receive-car.c: 343: temp[0]=0x40;
      0083F5 1E 06            [ 2]  866 	ldw	x, (0x06, sp)
      0083F7 A6 40            [ 1]  867 	ld	a, #0x40
      0083F9 F7               [ 1]  868 	ld	(x), a
                                    869 ;	se8r01-receive-car.c: 344: temp[1]=0x00;
      0083FA 1E 06            [ 2]  870 	ldw	x, (0x06, sp)
      0083FC 5C               [ 2]  871 	incw	x
      0083FD 1F 0C            [ 2]  872 	ldw	(0x0c, sp), x
      0083FF 1E 0C            [ 2]  873 	ldw	x, (0x0c, sp)
      008401 7F               [ 1]  874 	clr	(x)
                                    875 ;	se8r01-receive-car.c: 345: temp[2]=0x10;
      008402 1E 06            [ 2]  876 	ldw	x, (0x06, sp)
      008404 5C               [ 2]  877 	incw	x
      008405 5C               [ 2]  878 	incw	x
      008406 1F 0A            [ 2]  879 	ldw	(0x0a, sp), x
      008408 1E 0A            [ 2]  880 	ldw	x, (0x0a, sp)
      00840A A6 10            [ 1]  881 	ld	a, #0x10
      00840C F7               [ 1]  882 	ld	(x), a
                                    883 ;	se8r01-receive-car.c: 347: {temp[3]=0xE6;}
      00840D 1E 06            [ 2]  884 	ldw	x, (0x06, sp)
      00840F 1C 00 03         [ 2]  885 	addw	x, #0x0003
      008412 1F 08            [ 2]  886 	ldw	(0x08, sp), x
                                    887 ;	se8r01-receive-car.c: 346: if (SE8R01_DR_2M==1)
      008414 CE 00 10         [ 2]  888 	ldw	x, _SE8R01_DR_2M+0
      008417 A3 00 01         [ 2]  889 	cpw	x, #0x0001
      00841A 26 07            [ 1]  890 	jrne	00108$
                                    891 ;	se8r01-receive-car.c: 347: {temp[3]=0xE6;}
      00841C 1E 08            [ 2]  892 	ldw	x, (0x08, sp)
      00841E A6 E6            [ 1]  893 	ld	a, #0xe6
      008420 F7               [ 1]  894 	ld	(x), a
      008421 20 05            [ 2]  895 	jra	00109$
      008423                        896 00108$:
                                    897 ;	se8r01-receive-car.c: 349: {temp[3]=0xE4;}
      008423 1E 08            [ 2]  898 	ldw	x, (0x08, sp)
      008425 A6 E4            [ 1]  899 	ld	a, #0xe4
      008427 F7               [ 1]  900 	ld	(x), a
      008428                        901 00109$:
                                    902 ;	se8r01-receive-car.c: 351: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp, 4);
      008428 1E 06            [ 2]  903 	ldw	x, (0x06, sp)
      00842A 4B 04            [ 1]  904 	push	#0x04
      00842C 89               [ 2]  905 	pushw	x
      00842D 4B 21            [ 1]  906 	push	#0x21
      00842F CD 81 48         [ 4]  907 	call	_write_spi_buf
      008432 5B 04            [ 2]  908 	addw	sp, #4
                                    909 ;	se8r01-receive-car.c: 353: temp[0]=0x20;
      008434 1E 06            [ 2]  910 	ldw	x, (0x06, sp)
      008436 A6 20            [ 1]  911 	ld	a, #0x20
      008438 F7               [ 1]  912 	ld	(x), a
                                    913 ;	se8r01-receive-car.c: 354: temp[1]=0x08;
      008439 1E 0C            [ 2]  914 	ldw	x, (0x0c, sp)
      00843B A6 08            [ 1]  915 	ld	a, #0x08
      00843D F7               [ 1]  916 	ld	(x), a
                                    917 ;	se8r01-receive-car.c: 355: temp[2]=0x50;
      00843E 1E 0A            [ 2]  918 	ldw	x, (0x0a, sp)
      008440 A6 50            [ 1]  919 	ld	a, #0x50
      008442 F7               [ 1]  920 	ld	(x), a
                                    921 ;	se8r01-receive-car.c: 356: temp[3]=0x40;
      008443 1E 08            [ 2]  922 	ldw	x, (0x08, sp)
      008445 A6 40            [ 1]  923 	ld	a, #0x40
      008447 F7               [ 1]  924 	ld	(x), a
                                    925 ;	se8r01-receive-car.c: 357: temp[4]=0x50;
      008448 1E 06            [ 2]  926 	ldw	x, (0x06, sp)
      00844A A6 50            [ 1]  927 	ld	a, #0x50
      00844C E7 04            [ 1]  928 	ld	(0x0004, x), a
                                    929 ;	se8r01-receive-car.c: 358: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp, 5);
      00844E 1E 06            [ 2]  930 	ldw	x, (0x06, sp)
      008450 4B 05            [ 1]  931 	push	#0x05
      008452 89               [ 2]  932 	pushw	x
      008453 4B 23            [ 1]  933 	push	#0x23
      008455 CD 81 48         [ 4]  934 	call	_write_spi_buf
      008458 5B 04            [ 2]  935 	addw	sp, #4
                                    936 ;	se8r01-receive-car.c: 360: temp[0]=0x00;
      00845A 1E 06            [ 2]  937 	ldw	x, (0x06, sp)
      00845C 7F               [ 1]  938 	clr	(x)
                                    939 ;	se8r01-receive-car.c: 361: temp[1]=0x00;
      00845D 1E 0C            [ 2]  940 	ldw	x, (0x0c, sp)
      00845F 7F               [ 1]  941 	clr	(x)
                                    942 ;	se8r01-receive-car.c: 362: if (SE8R01_DR_2M==1)
      008460 CE 00 10         [ 2]  943 	ldw	x, _SE8R01_DR_2M+0
      008463 A3 00 01         [ 2]  944 	cpw	x, #0x0001
      008466 26 07            [ 1]  945 	jrne	00111$
                                    946 ;	se8r01-receive-car.c: 363: { temp[2]=0x1E;}
      008468 1E 0A            [ 2]  947 	ldw	x, (0x0a, sp)
      00846A A6 1E            [ 1]  948 	ld	a, #0x1e
      00846C F7               [ 1]  949 	ld	(x), a
      00846D 20 05            [ 2]  950 	jra	00112$
      00846F                        951 00111$:
                                    952 ;	se8r01-receive-car.c: 365: { temp[2]=0x1F;}
      00846F 1E 0A            [ 2]  953 	ldw	x, (0x0a, sp)
      008471 A6 1F            [ 1]  954 	ld	a, #0x1f
      008473 F7               [ 1]  955 	ld	(x), a
      008474                        956 00112$:
                                    957 ;	se8r01-receive-car.c: 367: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_IF_FREQ, temp, 3);
      008474 1E 06            [ 2]  958 	ldw	x, (0x06, sp)
      008476 4B 03            [ 1]  959 	push	#0x03
      008478 89               [ 2]  960 	pushw	x
      008479 4B 2A            [ 1]  961 	push	#0x2a
      00847B CD 81 48         [ 4]  962 	call	_write_spi_buf
      00847E 5B 04            [ 2]  963 	addw	sp, #4
                                    964 ;	se8r01-receive-car.c: 369: if (SE8R01_DR_2M==1)
      008480 CE 00 10         [ 2]  965 	ldw	x, _SE8R01_DR_2M+0
      008483 A3 00 01         [ 2]  966 	cpw	x, #0x0001
      008486 26 07            [ 1]  967 	jrne	00114$
                                    968 ;	se8r01-receive-car.c: 370: { temp[0]=0x29;}
      008488 1E 06            [ 2]  969 	ldw	x, (0x06, sp)
      00848A A6 29            [ 1]  970 	ld	a, #0x29
      00848C F7               [ 1]  971 	ld	(x), a
      00848D 20 05            [ 2]  972 	jra	00115$
      00848F                        973 00114$:
                                    974 ;	se8r01-receive-car.c: 372: { temp[0]=0x14;}
      00848F 1E 06            [ 2]  975 	ldw	x, (0x06, sp)
      008491 A6 14            [ 1]  976 	ld	a, #0x14
      008493 F7               [ 1]  977 	ld	(x), a
      008494                        978 00115$:
                                    979 ;	se8r01-receive-car.c: 374: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp, 1);
      008494 1E 06            [ 2]  980 	ldw	x, (0x06, sp)
      008496 4B 01            [ 1]  981 	push	#0x01
      008498 89               [ 2]  982 	pushw	x
      008499 4B 2C            [ 1]  983 	push	#0x2c
      00849B CD 81 48         [ 4]  984 	call	_write_spi_buf
      00849E 5B 04            [ 2]  985 	addw	sp, #4
                                    986 ;	se8r01-receive-car.c: 376: temp[0]=0x00;
      0084A0 1E 06            [ 2]  987 	ldw	x, (0x06, sp)
      0084A2 7F               [ 1]  988 	clr	(x)
                                    989 ;	se8r01-receive-car.c: 377: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_LOW,temp,1);
      0084A3 1E 06            [ 2]  990 	ldw	x, (0x06, sp)
      0084A5 4B 01            [ 1]  991 	push	#0x01
      0084A7 89               [ 2]  992 	pushw	x
      0084A8 4B 37            [ 1]  993 	push	#0x37
      0084AA CD 81 48         [ 4]  994 	call	_write_spi_buf
      0084AD 5B 04            [ 2]  995 	addw	sp, #4
                                    996 ;	se8r01-receive-car.c: 379: temp[0]=0x7F;
      0084AF 1E 06            [ 2]  997 	ldw	x, (0x06, sp)
      0084B1 A6 7F            [ 1]  998 	ld	a, #0x7f
      0084B3 F7               [ 1]  999 	ld	(x), a
                                   1000 ;	se8r01-receive-car.c: 380: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_HI,temp,1);
      0084B4 1E 06            [ 2] 1001 	ldw	x, (0x06, sp)
      0084B6 4B 01            [ 1] 1002 	push	#0x01
      0084B8 89               [ 2] 1003 	pushw	x
      0084B9 4B 38            [ 1] 1004 	push	#0x38
      0084BB CD 81 48         [ 4] 1005 	call	_write_spi_buf
      0084BE 5B 04            [ 2] 1006 	addw	sp, #4
                                   1007 ;	se8r01-receive-car.c: 382: temp[0]=0x02;
      0084C0 1E 06            [ 2] 1008 	ldw	x, (0x06, sp)
      0084C2 A6 02            [ 1] 1009 	ld	a, #0x02
      0084C4 F7               [ 1] 1010 	ld	(x), a
                                   1011 ;	se8r01-receive-car.c: 383: temp[1]=0xC1;
      0084C5 1E 0C            [ 2] 1012 	ldw	x, (0x0c, sp)
      0084C7 A6 C1            [ 1] 1013 	ld	a, #0xc1
      0084C9 F7               [ 1] 1014 	ld	(x), a
                                   1015 ;	se8r01-receive-car.c: 384: temp[2]=0xEB;            
      0084CA 1E 0A            [ 2] 1016 	ldw	x, (0x0a, sp)
      0084CC A6 EB            [ 1] 1017 	ld	a, #0xeb
      0084CE F7               [ 1] 1018 	ld	(x), a
                                   1019 ;	se8r01-receive-car.c: 385: temp[3]=0x1C;
      0084CF 1E 08            [ 2] 1020 	ldw	x, (0x08, sp)
      0084D1 A6 1C            [ 1] 1021 	ld	a, #0x1c
      0084D3 F7               [ 1] 1022 	ld	(x), a
                                   1023 ;	se8r01-receive-car.c: 386: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
      0084D4 1E 06            [ 2] 1024 	ldw	x, (0x06, sp)
      0084D6 4B 04            [ 1] 1025 	push	#0x04
      0084D8 89               [ 2] 1026 	pushw	x
      0084D9 4B 3D            [ 1] 1027 	push	#0x3d
      0084DB CD 81 48         [ 4] 1028 	call	_write_spi_buf
      0084DE 5B 04            [ 2] 1029 	addw	sp, #4
                                   1030 ;	se8r01-receive-car.c: 388: temp[0]=0x97;
      0084E0 1E 06            [ 2] 1031 	ldw	x, (0x06, sp)
      0084E2 A6 97            [ 1] 1032 	ld	a, #0x97
      0084E4 F7               [ 1] 1033 	ld	(x), a
                                   1034 ;	se8r01-receive-car.c: 389: temp[1]=0x64;
      0084E5 1E 0C            [ 2] 1035 	ldw	x, (0x0c, sp)
      0084E7 A6 64            [ 1] 1036 	ld	a, #0x64
      0084E9 F7               [ 1] 1037 	ld	(x), a
                                   1038 ;	se8r01-receive-car.c: 390: temp[2]=0x00;
      0084EA 1E 0A            [ 2] 1039 	ldw	x, (0x0a, sp)
      0084EC 7F               [ 1] 1040 	clr	(x)
                                   1041 ;	se8r01-receive-car.c: 391: temp[3]=0x81;
      0084ED 1E 08            [ 2] 1042 	ldw	x, (0x08, sp)
      0084EF A6 81            [ 1] 1043 	ld	a, #0x81
      0084F1 F7               [ 1] 1044 	ld	(x), a
                                   1045 ;	se8r01-receive-car.c: 392: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp, 4);
      0084F2 1E 06            [ 2] 1046 	ldw	x, (0x06, sp)
      0084F4 4B 04            [ 1] 1047 	push	#0x04
      0084F6 89               [ 2] 1048 	pushw	x
      0084F7 4B 3E            [ 1] 1049 	push	#0x3e
      0084F9 CD 81 48         [ 4] 1050 	call	_write_spi_buf
      0084FC 5B 04            [ 2] 1051 	addw	sp, #4
                                   1052 ;	se8r01-receive-car.c: 393: rf_switch_bank(iBANK0);
      0084FE 4B 00            [ 1] 1053 	push	#0x00
      008500 CD 83 64         [ 4] 1054 	call	_rf_switch_bank
      008503 84               [ 1] 1055 	pop	a
                                   1056 ;	se8r01-receive-car.c: 398: delayTenMicro();
      008504 CD 80 A0         [ 4] 1057 	call	_delayTenMicro
                                   1058 ;	se8r01-receive-car.c: 399: PC_ODR |= (1 << CE);
      008507 AE 50 0A         [ 2] 1059 	ldw	x, #0x500a
      00850A F6               [ 1] 1060 	ld	a, (x)
      00850B AA 08            [ 1] 1061 	or	a, #0x08
      00850D F7               [ 1] 1062 	ld	(x), a
                                   1063 ;	se8r01-receive-car.c: 400: delayTenMicro();
      00850E CD 80 A0         [ 4] 1064 	call	_delayTenMicro
                                   1065 ;	se8r01-receive-car.c: 401: delayTenMicro();
      008511 CD 80 A0         [ 4] 1066 	call	_delayTenMicro
                                   1067 ;	se8r01-receive-car.c: 402: delayTenMicro();
      008514 CD 80 A0         [ 4] 1068 	call	_delayTenMicro
                                   1069 ;	se8r01-receive-car.c: 403: PC_ODR &= ~(1 << CE);
      008517 AE 50 0A         [ 2] 1070 	ldw	x, #0x500a
      00851A F6               [ 1] 1071 	ld	a, (x)
      00851B A4 F7            [ 1] 1072 	and	a, #0xf7
      00851D F7               [ 1] 1073 	ld	(x), a
                                   1074 ;	se8r01-receive-car.c: 404: delay(50);                            // delay 50ms waitting for calibaration.
      00851E 4B 32            [ 1] 1075 	push	#0x32
      008520 4B 00            [ 1] 1076 	push	#0x00
      008522 CD 82 2E         [ 4] 1077 	call	_delay
      008525 5B 02            [ 2] 1078 	addw	sp, #2
                                   1079 ;	se8r01-receive-car.c: 409: delayTenMicro();
      008527 CD 80 A0         [ 4] 1080 	call	_delayTenMicro
                                   1081 ;	se8r01-receive-car.c: 410: PC_ODR |= (1 << CE);
      00852A AE 50 0A         [ 2] 1082 	ldw	x, #0x500a
      00852D F6               [ 1] 1083 	ld	a, (x)
      00852E AA 08            [ 1] 1084 	or	a, #0x08
      008530 F7               [ 1] 1085 	ld	(x), a
                                   1086 ;	se8r01-receive-car.c: 411: delayTenMicro();
      008531 CD 80 A0         [ 4] 1087 	call	_delayTenMicro
                                   1088 ;	se8r01-receive-car.c: 412: delayTenMicro();
      008534 CD 80 A0         [ 4] 1089 	call	_delayTenMicro
                                   1090 ;	se8r01-receive-car.c: 413: delayTenMicro();
      008537 CD 80 A0         [ 4] 1091 	call	_delayTenMicro
                                   1092 ;	se8r01-receive-car.c: 414: PC_ODR &= ~(1 << CE);
      00853A AE 50 0A         [ 2] 1093 	ldw	x, #0x500a
      00853D F6               [ 1] 1094 	ld	a, (x)
      00853E A4 F7            [ 1] 1095 	and	a, #0xf7
      008540 F7               [ 1] 1096 	ld	(x), a
                                   1097 ;	se8r01-receive-car.c: 415: delay(50);                            // delay 50ms waitting for calibaration.
      008541 4B 32            [ 1] 1098 	push	#0x32
      008543 4B 00            [ 1] 1099 	push	#0x00
      008545 CD 82 2E         [ 4] 1100 	call	_delay
      008548 5B 02            [ 2] 1101 	addw	sp, #2
      00854A 5B 0D            [ 2] 1102 	addw	sp, #13
      00854C 81               [ 4] 1103 	ret
                                   1104 ;	se8r01-receive-car.c: 419: void SE8R01_Analog_Init()           //SE8R01 初始化
                                   1105 ;	-----------------------------------------
                                   1106 ;	 function SE8R01_Analog_Init
                                   1107 ;	-----------------------------------------
      00854D                       1108 _SE8R01_Analog_Init:
      00854D 52 15            [ 2] 1109 	sub	sp, #21
                                   1110 ;	se8r01-receive-car.c: 424: gtemp[0]=0x28;
      00854F AE 00 01         [ 2] 1111 	ldw	x, #_gtemp+0
      008552 1F 14            [ 2] 1112 	ldw	(0x14, sp), x
      008554 1E 14            [ 2] 1113 	ldw	x, (0x14, sp)
      008556 A6 28            [ 1] 1114 	ld	a, #0x28
      008558 F7               [ 1] 1115 	ld	(x), a
                                   1116 ;	se8r01-receive-car.c: 425: gtemp[1]=0x32;
      008559 1E 14            [ 2] 1117 	ldw	x, (0x14, sp)
      00855B 5C               [ 2] 1118 	incw	x
      00855C 1F 12            [ 2] 1119 	ldw	(0x12, sp), x
      00855E 1E 12            [ 2] 1120 	ldw	x, (0x12, sp)
      008560 A6 32            [ 1] 1121 	ld	a, #0x32
      008562 F7               [ 1] 1122 	ld	(x), a
                                   1123 ;	se8r01-receive-car.c: 426: gtemp[2]=0x80;
      008563 1E 14            [ 2] 1124 	ldw	x, (0x14, sp)
      008565 5C               [ 2] 1125 	incw	x
      008566 5C               [ 2] 1126 	incw	x
      008567 1F 10            [ 2] 1127 	ldw	(0x10, sp), x
      008569 1E 10            [ 2] 1128 	ldw	x, (0x10, sp)
      00856B A6 80            [ 1] 1129 	ld	a, #0x80
      00856D F7               [ 1] 1130 	ld	(x), a
                                   1131 ;	se8r01-receive-car.c: 427: gtemp[3]=0x90;
      00856E 1E 14            [ 2] 1132 	ldw	x, (0x14, sp)
      008570 1C 00 03         [ 2] 1133 	addw	x, #0x0003
      008573 1F 0E            [ 2] 1134 	ldw	(0x0e, sp), x
      008575 1E 0E            [ 2] 1135 	ldw	x, (0x0e, sp)
      008577 A6 90            [ 1] 1136 	ld	a, #0x90
      008579 F7               [ 1] 1137 	ld	(x), a
                                   1138 ;	se8r01-receive-car.c: 428: gtemp[4]=0x00;
      00857A 1E 14            [ 2] 1139 	ldw	x, (0x14, sp)
      00857C 1C 00 04         [ 2] 1140 	addw	x, #0x0004
      00857F 7F               [ 1] 1141 	clr	(x)
                                   1142 ;	se8r01-receive-car.c: 429: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_SETUP_VALUE, gtemp, 5);
      008580 1E 14            [ 2] 1143 	ldw	x, (0x14, sp)
      008582 4B 05            [ 1] 1144 	push	#0x05
      008584 89               [ 2] 1145 	pushw	x
      008585 4B 3E            [ 1] 1146 	push	#0x3e
      008587 CD 81 48         [ 4] 1147 	call	_write_spi_buf
      00858A 5B 04            [ 2] 1148 	addw	sp, #4
                                   1149 ;	se8r01-receive-car.c: 430: delay(2);
      00858C 4B 02            [ 1] 1150 	push	#0x02
      00858E 4B 00            [ 1] 1151 	push	#0x00
      008590 CD 82 2E         [ 4] 1152 	call	_delay
      008593 5B 02            [ 2] 1153 	addw	sp, #2
                                   1154 ;	se8r01-receive-car.c: 433: rf_switch_bank(iBANK1);
      008595 4B 80            [ 1] 1155 	push	#0x80
      008597 CD 83 64         [ 4] 1156 	call	_rf_switch_bank
      00859A 84               [ 1] 1157 	pop	a
                                   1158 ;	se8r01-receive-car.c: 435: temp[0]=0x40;
      00859B 96               [ 1] 1159 	ldw	x, sp
      00859C 5C               [ 2] 1160 	incw	x
      00859D 1F 0C            [ 2] 1161 	ldw	(0x0c, sp), x
      00859F 1E 0C            [ 2] 1162 	ldw	x, (0x0c, sp)
      0085A1 A6 40            [ 1] 1163 	ld	a, #0x40
      0085A3 F7               [ 1] 1164 	ld	(x), a
                                   1165 ;	se8r01-receive-car.c: 436: temp[1]=0x01;               
      0085A4 1E 0C            [ 2] 1166 	ldw	x, (0x0c, sp)
      0085A6 5C               [ 2] 1167 	incw	x
      0085A7 1F 0A            [ 2] 1168 	ldw	(0x0a, sp), x
      0085A9 1E 0A            [ 2] 1169 	ldw	x, (0x0a, sp)
      0085AB A6 01            [ 1] 1170 	ld	a, #0x01
      0085AD F7               [ 1] 1171 	ld	(x), a
                                   1172 ;	se8r01-receive-car.c: 437: temp[2]=0x30;               
      0085AE 1E 0C            [ 2] 1173 	ldw	x, (0x0c, sp)
      0085B0 5C               [ 2] 1174 	incw	x
      0085B1 5C               [ 2] 1175 	incw	x
      0085B2 1F 08            [ 2] 1176 	ldw	(0x08, sp), x
      0085B4 1E 08            [ 2] 1177 	ldw	x, (0x08, sp)
      0085B6 A6 30            [ 1] 1178 	ld	a, #0x30
      0085B8 F7               [ 1] 1179 	ld	(x), a
                                   1180 ;	se8r01-receive-car.c: 439: { temp[3]=0xE2; }              
      0085B9 1E 0C            [ 2] 1181 	ldw	x, (0x0c, sp)
      0085BB 1C 00 03         [ 2] 1182 	addw	x, #0x0003
      0085BE 1F 06            [ 2] 1183 	ldw	(0x06, sp), x
                                   1184 ;	se8r01-receive-car.c: 438: if (SE8R01_DR_2M==1)
      0085C0 CE 00 10         [ 2] 1185 	ldw	x, _SE8R01_DR_2M+0
      0085C3 A3 00 01         [ 2] 1186 	cpw	x, #0x0001
      0085C6 26 07            [ 1] 1187 	jrne	00102$
                                   1188 ;	se8r01-receive-car.c: 439: { temp[3]=0xE2; }              
      0085C8 1E 06            [ 2] 1189 	ldw	x, (0x06, sp)
      0085CA A6 E2            [ 1] 1190 	ld	a, #0xe2
      0085CC F7               [ 1] 1191 	ld	(x), a
      0085CD 20 05            [ 2] 1192 	jra	00103$
      0085CF                       1193 00102$:
                                   1194 ;	se8r01-receive-car.c: 441: { temp[3]=0xE0;}
      0085CF 1E 06            [ 2] 1195 	ldw	x, (0x06, sp)
      0085D1 A6 E0            [ 1] 1196 	ld	a, #0xe0
      0085D3 F7               [ 1] 1197 	ld	(x), a
      0085D4                       1198 00103$:
                                   1199 ;	se8r01-receive-car.c: 443: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp,4);
      0085D4 1E 0C            [ 2] 1200 	ldw	x, (0x0c, sp)
      0085D6 4B 04            [ 1] 1201 	push	#0x04
      0085D8 89               [ 2] 1202 	pushw	x
      0085D9 4B 21            [ 1] 1203 	push	#0x21
      0085DB CD 81 48         [ 4] 1204 	call	_write_spi_buf
      0085DE 5B 04            [ 2] 1205 	addw	sp, #4
                                   1206 ;	se8r01-receive-car.c: 445: temp[0]=0x29;
      0085E0 1E 0C            [ 2] 1207 	ldw	x, (0x0c, sp)
      0085E2 A6 29            [ 1] 1208 	ld	a, #0x29
      0085E4 F7               [ 1] 1209 	ld	(x), a
                                   1210 ;	se8r01-receive-car.c: 446: temp[1]=0x89;
      0085E5 1E 0A            [ 2] 1211 	ldw	x, (0x0a, sp)
      0085E7 A6 89            [ 1] 1212 	ld	a, #0x89
      0085E9 F7               [ 1] 1213 	ld	(x), a
                                   1214 ;	se8r01-receive-car.c: 447: temp[2]=0x55;                     
      0085EA 1E 08            [ 2] 1215 	ldw	x, (0x08, sp)
      0085EC A6 55            [ 1] 1216 	ld	a, #0x55
      0085EE F7               [ 1] 1217 	ld	(x), a
                                   1218 ;	se8r01-receive-car.c: 448: temp[3]=0x40;
      0085EF 1E 06            [ 2] 1219 	ldw	x, (0x06, sp)
      0085F1 A6 40            [ 1] 1220 	ld	a, #0x40
      0085F3 F7               [ 1] 1221 	ld	(x), a
                                   1222 ;	se8r01-receive-car.c: 449: temp[4]=0x50;
      0085F4 1E 0C            [ 2] 1223 	ldw	x, (0x0c, sp)
      0085F6 A6 50            [ 1] 1224 	ld	a, #0x50
      0085F8 E7 04            [ 1] 1225 	ld	(0x0004, x), a
                                   1226 ;	se8r01-receive-car.c: 450: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp,5);
      0085FA 1E 0C            [ 2] 1227 	ldw	x, (0x0c, sp)
      0085FC 4B 05            [ 1] 1228 	push	#0x05
      0085FE 89               [ 2] 1229 	pushw	x
      0085FF 4B 23            [ 1] 1230 	push	#0x23
      008601 CD 81 48         [ 4] 1231 	call	_write_spi_buf
      008604 5B 04            [ 2] 1232 	addw	sp, #4
                                   1233 ;	se8r01-receive-car.c: 452: if (SE8R01_DR_2M==1)
      008606 CE 00 10         [ 2] 1234 	ldw	x, _SE8R01_DR_2M+0
      008609 A3 00 01         [ 2] 1235 	cpw	x, #0x0001
      00860C 26 07            [ 1] 1236 	jrne	00105$
                                   1237 ;	se8r01-receive-car.c: 453: { temp[0]=0x29;}
      00860E 1E 0C            [ 2] 1238 	ldw	x, (0x0c, sp)
      008610 A6 29            [ 1] 1239 	ld	a, #0x29
      008612 F7               [ 1] 1240 	ld	(x), a
      008613 20 05            [ 2] 1241 	jra	00106$
      008615                       1242 00105$:
                                   1243 ;	se8r01-receive-car.c: 455: { temp[0]=0x14;}
      008615 1E 0C            [ 2] 1244 	ldw	x, (0x0c, sp)
      008617 A6 14            [ 1] 1245 	ld	a, #0x14
      008619 F7               [ 1] 1246 	ld	(x), a
      00861A                       1247 00106$:
                                   1248 ;	se8r01-receive-car.c: 457: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp,1);
      00861A 1E 0C            [ 2] 1249 	ldw	x, (0x0c, sp)
      00861C 4B 01            [ 1] 1250 	push	#0x01
      00861E 89               [ 2] 1251 	pushw	x
      00861F 4B 2C            [ 1] 1252 	push	#0x2c
      008621 CD 81 48         [ 4] 1253 	call	_write_spi_buf
      008624 5B 04            [ 2] 1254 	addw	sp, #4
                                   1255 ;	se8r01-receive-car.c: 459: temp[0]=0x55;
      008626 1E 0C            [ 2] 1256 	ldw	x, (0x0c, sp)
      008628 A6 55            [ 1] 1257 	ld	a, #0x55
      00862A F7               [ 1] 1258 	ld	(x), a
                                   1259 ;	se8r01-receive-car.c: 460: temp[1]=0xC2;
      00862B 1E 0A            [ 2] 1260 	ldw	x, (0x0a, sp)
      00862D A6 C2            [ 1] 1261 	ld	a, #0xc2
      00862F F7               [ 1] 1262 	ld	(x), a
                                   1263 ;	se8r01-receive-car.c: 461: temp[2]=0x09;
      008630 1E 08            [ 2] 1264 	ldw	x, (0x08, sp)
      008632 A6 09            [ 1] 1265 	ld	a, #0x09
      008634 F7               [ 1] 1266 	ld	(x), a
                                   1267 ;	se8r01-receive-car.c: 462: temp[3]=0xAC;  
      008635 1E 06            [ 2] 1268 	ldw	x, (0x06, sp)
      008637 A6 AC            [ 1] 1269 	ld	a, #0xac
      008639 F7               [ 1] 1270 	ld	(x), a
                                   1271 ;	se8r01-receive-car.c: 463: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RX_CTRL,temp,4);
      00863A 1E 0C            [ 2] 1272 	ldw	x, (0x0c, sp)
      00863C 4B 04            [ 1] 1273 	push	#0x04
      00863E 89               [ 2] 1274 	pushw	x
      00863F 4B 31            [ 1] 1275 	push	#0x31
      008641 CD 81 48         [ 4] 1276 	call	_write_spi_buf
      008644 5B 04            [ 2] 1277 	addw	sp, #4
                                   1278 ;	se8r01-receive-car.c: 465: temp[0]=0x00;
      008646 1E 0C            [ 2] 1279 	ldw	x, (0x0c, sp)
      008648 7F               [ 1] 1280 	clr	(x)
                                   1281 ;	se8r01-receive-car.c: 466: temp[1]=0x14;
      008649 1E 0A            [ 2] 1282 	ldw	x, (0x0a, sp)
      00864B A6 14            [ 1] 1283 	ld	a, #0x14
      00864D F7               [ 1] 1284 	ld	(x), a
                                   1285 ;	se8r01-receive-car.c: 467: temp[2]=0x08;   
      00864E 1E 08            [ 2] 1286 	ldw	x, (0x08, sp)
      008650 A6 08            [ 1] 1287 	ld	a, #0x08
      008652 F7               [ 1] 1288 	ld	(x), a
                                   1289 ;	se8r01-receive-car.c: 468: temp[3]=0x29;
      008653 1E 06            [ 2] 1290 	ldw	x, (0x06, sp)
      008655 A6 29            [ 1] 1291 	ld	a, #0x29
      008657 F7               [ 1] 1292 	ld	(x), a
                                   1293 ;	se8r01-receive-car.c: 469: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FAGC_CTRL_1, temp,4);
      008658 1E 0C            [ 2] 1294 	ldw	x, (0x0c, sp)
      00865A 4B 04            [ 1] 1295 	push	#0x04
      00865C 89               [ 2] 1296 	pushw	x
      00865D 4B 33            [ 1] 1297 	push	#0x33
      00865F CD 81 48         [ 4] 1298 	call	_write_spi_buf
      008662 5B 04            [ 2] 1299 	addw	sp, #4
                                   1300 ;	se8r01-receive-car.c: 471: temp[0]=0x02;
      008664 1E 0C            [ 2] 1301 	ldw	x, (0x0c, sp)
      008666 A6 02            [ 1] 1302 	ld	a, #0x02
      008668 F7               [ 1] 1303 	ld	(x), a
                                   1304 ;	se8r01-receive-car.c: 472: temp[1]=0xC1;
      008669 1E 0A            [ 2] 1305 	ldw	x, (0x0a, sp)
      00866B A6 C1            [ 1] 1306 	ld	a, #0xc1
      00866D F7               [ 1] 1307 	ld	(x), a
                                   1308 ;	se8r01-receive-car.c: 473: temp[2]=0xCB;  
      00866E 1E 08            [ 2] 1309 	ldw	x, (0x08, sp)
      008670 A6 CB            [ 1] 1310 	ld	a, #0xcb
      008672 F7               [ 1] 1311 	ld	(x), a
                                   1312 ;	se8r01-receive-car.c: 474: temp[3]=0x1C;
      008673 1E 06            [ 2] 1313 	ldw	x, (0x06, sp)
      008675 A6 1C            [ 1] 1314 	ld	a, #0x1c
      008677 F7               [ 1] 1315 	ld	(x), a
                                   1316 ;	se8r01-receive-car.c: 475: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
      008678 1E 0C            [ 2] 1317 	ldw	x, (0x0c, sp)
      00867A 4B 04            [ 1] 1318 	push	#0x04
      00867C 89               [ 2] 1319 	pushw	x
      00867D 4B 3D            [ 1] 1320 	push	#0x3d
      00867F CD 81 48         [ 4] 1321 	call	_write_spi_buf
      008682 5B 04            [ 2] 1322 	addw	sp, #4
                                   1323 ;	se8r01-receive-car.c: 477: temp[0]=0x97;
      008684 1E 0C            [ 2] 1324 	ldw	x, (0x0c, sp)
      008686 A6 97            [ 1] 1325 	ld	a, #0x97
      008688 F7               [ 1] 1326 	ld	(x), a
                                   1327 ;	se8r01-receive-car.c: 478: temp[1]=0x64;
      008689 1E 0A            [ 2] 1328 	ldw	x, (0x0a, sp)
      00868B A6 64            [ 1] 1329 	ld	a, #0x64
      00868D F7               [ 1] 1330 	ld	(x), a
                                   1331 ;	se8r01-receive-car.c: 479: temp[2]=0x00;
      00868E 1E 08            [ 2] 1332 	ldw	x, (0x08, sp)
      008690 7F               [ 1] 1333 	clr	(x)
                                   1334 ;	se8r01-receive-car.c: 480: temp[3]=0x01;
      008691 1E 06            [ 2] 1335 	ldw	x, (0x06, sp)
      008693 A6 01            [ 1] 1336 	ld	a, #0x01
      008695 F7               [ 1] 1337 	ld	(x), a
                                   1338 ;	se8r01-receive-car.c: 481: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp,4);
      008696 1E 0C            [ 2] 1339 	ldw	x, (0x0c, sp)
      008698 4B 04            [ 1] 1340 	push	#0x04
      00869A 89               [ 2] 1341 	pushw	x
      00869B 4B 3E            [ 1] 1342 	push	#0x3e
      00869D CD 81 48         [ 4] 1343 	call	_write_spi_buf
      0086A0 5B 04            [ 2] 1344 	addw	sp, #4
                                   1345 ;	se8r01-receive-car.c: 483: gtemp[0]=0x2A;
      0086A2 1E 14            [ 2] 1346 	ldw	x, (0x14, sp)
      0086A4 A6 2A            [ 1] 1347 	ld	a, #0x2a
      0086A6 F7               [ 1] 1348 	ld	(x), a
                                   1349 ;	se8r01-receive-car.c: 484: gtemp[1]=0x04;
      0086A7 1E 12            [ 2] 1350 	ldw	x, (0x12, sp)
      0086A9 A6 04            [ 1] 1351 	ld	a, #0x04
      0086AB F7               [ 1] 1352 	ld	(x), a
                                   1353 ;	se8r01-receive-car.c: 485: gtemp[2]=0x00;
      0086AC 1E 10            [ 2] 1354 	ldw	x, (0x10, sp)
      0086AE 7F               [ 1] 1355 	clr	(x)
                                   1356 ;	se8r01-receive-car.c: 486: gtemp[3]=0x7D;
      0086AF 1E 0E            [ 2] 1357 	ldw	x, (0x0e, sp)
      0086B1 A6 7D            [ 1] 1358 	ld	a, #0x7d
      0086B3 F7               [ 1] 1359 	ld	(x), a
                                   1360 ;	se8r01-receive-car.c: 487: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_TEST_PKDET, gtemp, 4);
      0086B4 1E 14            [ 2] 1361 	ldw	x, (0x14, sp)
      0086B6 4B 04            [ 1] 1362 	push	#0x04
      0086B8 89               [ 2] 1363 	pushw	x
      0086B9 4B 3F            [ 1] 1364 	push	#0x3f
      0086BB CD 81 48         [ 4] 1365 	call	_write_spi_buf
      0086BE 5B 04            [ 2] 1366 	addw	sp, #4
                                   1367 ;	se8r01-receive-car.c: 489: rf_switch_bank(iBANK0);
      0086C0 4B 00            [ 1] 1368 	push	#0x00
      0086C2 CD 83 64         [ 4] 1369 	call	_rf_switch_bank
      0086C5 84               [ 1] 1370 	pop	a
      0086C6 5B 15            [ 2] 1371 	addw	sp, #21
      0086C8 81               [ 4] 1372 	ret
                                   1373 ;	se8r01-receive-car.c: 492: void SE8R01_Init()  
                                   1374 ;	-----------------------------------------
                                   1375 ;	 function SE8R01_Init
                                   1376 ;	-----------------------------------------
      0086C9                       1377 _SE8R01_Init:
      0086C9 52 05            [ 2] 1378 	sub	sp, #5
                                   1379 ;	se8r01-receive-car.c: 495: SE8R01_Calibration();   
      0086CB CD 83 81         [ 4] 1380 	call	_SE8R01_Calibration
                                   1381 ;	se8r01-receive-car.c: 496: SE8R01_Analog_Init();   
      0086CE CD 85 4D         [ 4] 1382 	call	_SE8R01_Analog_Init
                                   1383 ;	se8r01-receive-car.c: 500: if (SE8R01_DR_2M==1)
      0086D1 CE 00 10         [ 2] 1384 	ldw	x, _SE8R01_DR_2M+0
      0086D4 A3 00 01         [ 2] 1385 	cpw	x, #0x0001
      0086D7 26 07            [ 1] 1386 	jrne	00105$
                                   1387 ;	se8r01-receive-car.c: 501: {  temp[0]=0b01001111; }     //2MHz,+5dbm
      0086D9 96               [ 1] 1388 	ldw	x, sp
      0086DA 5C               [ 2] 1389 	incw	x
      0086DB A6 4F            [ 1] 1390 	ld	a, #0x4f
      0086DD F7               [ 1] 1391 	ld	(x), a
      0086DE 20 14            [ 2] 1392 	jra	00106$
      0086E0                       1393 00105$:
                                   1394 ;	se8r01-receive-car.c: 502: else if  (SE8R01_DR_1M==1)
      0086E0 CE 00 12         [ 2] 1395 	ldw	x, _SE8R01_DR_1M+0
      0086E3 A3 00 01         [ 2] 1396 	cpw	x, #0x0001
      0086E6 26 07            [ 1] 1397 	jrne	00102$
                                   1398 ;	se8r01-receive-car.c: 503: {  temp[0]=0b01000111;  }     //1MHz,+5dbm
      0086E8 96               [ 1] 1399 	ldw	x, sp
      0086E9 5C               [ 2] 1400 	incw	x
      0086EA A6 47            [ 1] 1401 	ld	a, #0x47
      0086EC F7               [ 1] 1402 	ld	(x), a
      0086ED 20 05            [ 2] 1403 	jra	00106$
      0086EF                       1404 00102$:
                                   1405 ;	se8r01-receive-car.c: 505: {temp[0]=0b01101111;  }     //500K,+5dbm
      0086EF 96               [ 1] 1406 	ldw	x, sp
      0086F0 5C               [ 2] 1407 	incw	x
      0086F1 A6 6F            [ 1] 1408 	ld	a, #0x6f
      0086F3 F7               [ 1] 1409 	ld	(x), a
      0086F4                       1410 00106$:
                                   1411 ;	se8r01-receive-car.c: 507: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
      0086F4 96               [ 1] 1412 	ldw	x, sp
      0086F5 5C               [ 2] 1413 	incw	x
      0086F6 4B 01            [ 1] 1414 	push	#0x01
      0086F8 89               [ 2] 1415 	pushw	x
      0086F9 4B 26            [ 1] 1416 	push	#0x26
      0086FB CD 81 48         [ 4] 1417 	call	_write_spi_buf
      0086FE 5B 04            [ 2] 1418 	addw	sp, #4
                                   1419 ;	se8r01-receive-car.c: 508: write_spi_reg(WRITE_REG|iRF_BANK0_EN_AA, 0b00111111);          //enable auto acc on pip 1
      008700 4B 3F            [ 1] 1420 	push	#0x3f
      008702 4B 21            [ 1] 1421 	push	#0x21
      008704 CD 80 CE         [ 4] 1422 	call	_write_spi_reg
      008707 5B 02            [ 2] 1423 	addw	sp, #2
                                   1424 ;	se8r01-receive-car.c: 509: write_spi_reg(WRITE_REG|iRF_BANK0_EN_RXADDR, 0b00111111);      //enable pip 1
      008709 4B 3F            [ 1] 1425 	push	#0x3f
      00870B 4B 22            [ 1] 1426 	push	#0x22
      00870D CD 80 CE         [ 4] 1427 	call	_write_spi_reg
      008710 5B 02            [ 2] 1428 	addw	sp, #2
                                   1429 ;	se8r01-receive-car.c: 510: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_AW, 0x02);  
      008712 4B 02            [ 1] 1430 	push	#0x02
      008714 4B 23            [ 1] 1431 	push	#0x23
      008716 CD 80 CE         [ 4] 1432 	call	_write_spi_reg
      008719 5B 02            [ 2] 1433 	addw	sp, #2
                                   1434 ;	se8r01-receive-car.c: 511: write_spi_reg(WRITE_REG|iRF_BANK0_RF_CH, 40);
      00871B 4B 28            [ 1] 1435 	push	#0x28
      00871D 4B 25            [ 1] 1436 	push	#0x25
      00871F CD 80 CE         [ 4] 1437 	call	_write_spi_reg
      008722 5B 02            [ 2] 1438 	addw	sp, #2
                                   1439 ;	se8r01-receive-car.c: 513: write_spi_buf(WRITE_REG + TX_ADDR, ADDRESS0, ADR_WIDTH);    	
      008724 AE 00 2A         [ 2] 1440 	ldw	x, #_ADDRESS0+0
      008727 90 93            [ 1] 1441 	ldw	y, x
      008729 89               [ 2] 1442 	pushw	x
      00872A 4B 04            [ 1] 1443 	push	#0x04
      00872C 90 89            [ 2] 1444 	pushw	y
      00872E 4B 30            [ 1] 1445 	push	#0x30
      008730 CD 81 48         [ 4] 1446 	call	_write_spi_buf
      008733 5B 04            [ 2] 1447 	addw	sp, #4
      008735 85               [ 2] 1448 	popw	x
                                   1449 ;	se8r01-receive-car.c: 514: write_spi_buf(WRITE_REG + RX_ADDR_P0, ADDRESS0, ADR_WIDTH); 
      008736 4B 04            [ 1] 1450 	push	#0x04
      008738 89               [ 2] 1451 	pushw	x
      008739 4B 2A            [ 1] 1452 	push	#0x2a
      00873B CD 81 48         [ 4] 1453 	call	_write_spi_buf
      00873E 5B 04            [ 2] 1454 	addw	sp, #4
                                   1455 ;	se8r01-receive-car.c: 515: write_spi_buf(WRITE_REG + RX_ADDR_P1, ADDRESS1, ADR_WIDTH); 
      008740 AE 00 26         [ 2] 1456 	ldw	x, #_ADDRESS1+0
      008743 4B 04            [ 1] 1457 	push	#0x04
      008745 89               [ 2] 1458 	pushw	x
      008746 4B 2B            [ 1] 1459 	push	#0x2b
      008748 CD 81 48         [ 4] 1460 	call	_write_spi_buf
      00874B 5B 04            [ 2] 1461 	addw	sp, #4
                                   1462 ;	se8r01-receive-car.c: 516: write_spi_buf(WRITE_REG + RX_ADDR_P2, ADDRESS2, 1); 
      00874D AE 00 22         [ 2] 1463 	ldw	x, #_ADDRESS2+0
      008750 4B 01            [ 1] 1464 	push	#0x01
      008752 89               [ 2] 1465 	pushw	x
      008753 4B 2C            [ 1] 1466 	push	#0x2c
      008755 CD 81 48         [ 4] 1467 	call	_write_spi_buf
      008758 5B 04            [ 2] 1468 	addw	sp, #4
                                   1469 ;	se8r01-receive-car.c: 517: write_spi_buf(WRITE_REG + RX_ADDR_P3, ADDRESS3, 1); 
      00875A AE 00 23         [ 2] 1470 	ldw	x, #_ADDRESS3+0
      00875D 4B 01            [ 1] 1471 	push	#0x01
      00875F 89               [ 2] 1472 	pushw	x
      008760 4B 2D            [ 1] 1473 	push	#0x2d
      008762 CD 81 48         [ 4] 1474 	call	_write_spi_buf
      008765 5B 04            [ 2] 1475 	addw	sp, #4
                                   1476 ;	se8r01-receive-car.c: 518: write_spi_buf(WRITE_REG + RX_ADDR_P4, ADDRESS4, 1); 
      008767 AE 00 24         [ 2] 1477 	ldw	x, #_ADDRESS4+0
      00876A 4B 01            [ 1] 1478 	push	#0x01
      00876C 89               [ 2] 1479 	pushw	x
      00876D 4B 2E            [ 1] 1480 	push	#0x2e
      00876F CD 81 48         [ 4] 1481 	call	_write_spi_buf
      008772 5B 04            [ 2] 1482 	addw	sp, #4
                                   1483 ;	se8r01-receive-car.c: 519: write_spi_buf(WRITE_REG + RX_ADDR_P5, ADDRESS5, 1); 
      008774 AE 00 25         [ 2] 1484 	ldw	x, #_ADDRESS5+0
      008777 4B 01            [ 1] 1485 	push	#0x01
      008779 89               [ 2] 1486 	pushw	x
      00877A 4B 2F            [ 1] 1487 	push	#0x2f
      00877C CD 81 48         [ 4] 1488 	call	_write_spi_buf
      00877F 5B 04            [ 2] 1489 	addw	sp, #4
                                   1490 ;	se8r01-receive-car.c: 520: write_spi_reg(WRITE_REG + RX_PW_P0, PLOAD_WIDTH); 
      008781 4B 20            [ 1] 1491 	push	#0x20
      008783 4B 31            [ 1] 1492 	push	#0x31
      008785 CD 80 CE         [ 4] 1493 	call	_write_spi_reg
      008788 5B 02            [ 2] 1494 	addw	sp, #2
                                   1495 ;	se8r01-receive-car.c: 521: write_spi_reg(WRITE_REG|iRF_BANK0_CONFIG, 0x3f); 
      00878A 4B 3F            [ 1] 1496 	push	#0x3f
      00878C 4B 20            [ 1] 1497 	push	#0x20
      00878E CD 80 CE         [ 4] 1498 	call	_write_spi_reg
      008791 5B 02            [ 2] 1499 	addw	sp, #2
                                   1500 ;	se8r01-receive-car.c: 522: write_spi_reg(WRITE_REG|iRF_BANK0_DYNPD, 0b00111111);          // enable dynamic payload length data
      008793 4B 3F            [ 1] 1501 	push	#0x3f
      008795 4B 3C            [ 1] 1502 	push	#0x3c
      008797 CD 80 CE         [ 4] 1503 	call	_write_spi_reg
      00879A 5B 02            [ 2] 1504 	addw	sp, #2
                                   1505 ;	se8r01-receive-car.c: 523: write_spi_reg(WRITE_REG|iRF_BANK0_FEATURE, 0x07);        // enable dynamic paload lenght; enbale payload with ack enable w_tx_payload_noack
      00879C 4B 07            [ 1] 1506 	push	#0x07
      00879E 4B 3D            [ 1] 1507 	push	#0x3d
      0087A0 CD 80 CE         [ 4] 1508 	call	_write_spi_reg
      0087A3 5B 02            [ 2] 1509 	addw	sp, #2
                                   1510 ;	se8r01-receive-car.c: 524: PC_ODR |= (1 << CE);
      0087A5 AE 50 0A         [ 2] 1511 	ldw	x, #0x500a
      0087A8 F6               [ 1] 1512 	ld	a, (x)
      0087A9 AA 08            [ 1] 1513 	or	a, #0x08
      0087AB F7               [ 1] 1514 	ld	(x), a
      0087AC 5B 05            [ 2] 1515 	addw	sp, #5
      0087AE 81               [ 4] 1516 	ret
                                   1517 ;	se8r01-receive-car.c: 529: void Init_Tim2 ()
                                   1518 ;	-----------------------------------------
                                   1519 ;	 function Init_Tim2
                                   1520 ;	-----------------------------------------
      0087AF                       1521 _Init_Tim2:
                                   1522 ;	se8r01-receive-car.c: 553: TIM2_CCMR3 |=0X70;//Set the timer 2 / three channel three (PD2) output mode
      0087AF AE 53 09         [ 2] 1523 	ldw	x, #0x5309
      0087B2 F6               [ 1] 1524 	ld	a, (x)
      0087B3 AA 70            [ 1] 1525 	or	a, #0x70
      0087B5 F7               [ 1] 1526 	ld	(x), a
                                   1527 ;	se8r01-receive-car.c: 554: TIM2_CCMR3 |=0X04;//Comparison of 3 pre load / / output enable
      0087B6 AE 53 09         [ 2] 1528 	ldw	x, #0x5309
      0087B9 F6               [ 1] 1529 	ld	a, (x)
      0087BA AA 04            [ 1] 1530 	or	a, #0x04
      0087BC F7               [ 1] 1531 	ld	(x), a
                                   1532 ;	se8r01-receive-car.c: 556: TIM2_CCER2 |=0x03;//  Channel 3 enable, active low output configuration
      0087BD AE 53 0B         [ 2] 1533 	ldw	x, #0x530b
      0087C0 F6               [ 1] 1534 	ld	a, (x)
      0087C1 AA 03            [ 1] 1535 	or	a, #0x03
      0087C3 F7               [ 1] 1536 	ld	(x), a
                                   1537 ;	se8r01-receive-car.c: 558: TIM2_PSCR =0X04;// 16 Mhz/2^4 =  1Mhz  -- the prescaler is a 4 bit number!
      0087C4 AE 53 0E         [ 2] 1538 	ldw	x, #0x530e
      0087C7 A6 04            [ 1] 1539 	ld	a, #0x04
      0087C9 F7               [ 1] 1540 	ld	(x), a
                                   1541 ;	se8r01-receive-car.c: 562: TIM2_ARRH =20000/256; // auto reload register
      0087CA AE 53 0F         [ 2] 1542 	ldw	x, #0x530f
      0087CD A6 4E            [ 1] 1543 	ld	a, #0x4e
      0087CF F7               [ 1] 1544 	ld	(x), a
                                   1545 ;	se8r01-receive-car.c: 563: TIM2_ARRL =20000%256; // 1000 Khz/20000 is 50 events per second 
      0087D0 AE 53 10         [ 2] 1546 	ldw	x, #0x5310
      0087D3 A6 20            [ 1] 1547 	ld	a, #0x20
      0087D5 F7               [ 1] 1548 	ld	(x), a
                                   1549 ;	se8r01-receive-car.c: 567: TIM2_CCR3H =1000/256; //compare capture register value
      0087D6 AE 53 15         [ 2] 1550 	ldw	x, #0x5315
      0087D9 A6 03            [ 1] 1551 	ld	a, #0x03
      0087DB F7               [ 1] 1552 	ld	(x), a
                                   1553 ;	se8r01-receive-car.c: 568: TIM2_CCR3L =1000%256;
      0087DC AE 53 16         [ 2] 1554 	ldw	x, #0x5316
      0087DF A6 E8            [ 1] 1555 	ld	a, #0xe8
      0087E1 F7               [ 1] 1556 	ld	(x), a
                                   1557 ;	se8r01-receive-car.c: 569: UARTPrintF("timer init 1 = \n\r");
      0087E2 AE 8B 77         [ 2] 1558 	ldw	x, #___str_0+0
      0087E5 89               [ 2] 1559 	pushw	x
      0087E6 CD 82 79         [ 4] 1560 	call	_UARTPrintF
      0087E9 5B 02            [ 2] 1561 	addw	sp, #2
                                   1562 ;	se8r01-receive-car.c: 577: TIM2_CCER1 =0x03;//  Channel 1 enable, active low output configuration
      0087EB AE 53 0A         [ 2] 1563 	ldw	x, #0x530a
      0087EE A6 03            [ 1] 1564 	ld	a, #0x03
      0087F0 F7               [ 1] 1565 	ld	(x), a
                                   1566 ;	se8r01-receive-car.c: 578: TIM2_CCMR2 = 0x03;
      0087F1 AE 53 08         [ 2] 1567 	ldw	x, #0x5308
      0087F4 A6 03            [ 1] 1568 	ld	a, #0x03
      0087F6 F7               [ 1] 1569 	ld	(x), a
                                   1570 ;	se8r01-receive-car.c: 579: TIM2_CCMR1 =0X70;//Set the timer 2 / channel 1 output
      0087F7 AE 53 07         [ 2] 1571 	ldw	x, #0x5307
      0087FA A6 70            [ 1] 1572 	ld	a, #0x70
      0087FC F7               [ 1] 1573 	ld	(x), a
                                   1574 ;	se8r01-receive-car.c: 584: TIM2_CCR1H =10000/256; //compare capture register value for channel 1
      0087FD AE 53 11         [ 2] 1575 	ldw	x, #0x5311
      008800 A6 27            [ 1] 1576 	ld	a, #0x27
      008802 F7               [ 1] 1577 	ld	(x), a
                                   1578 ;	se8r01-receive-car.c: 585: TIM2_CCR1L =10000%256;
      008803 AE 53 12         [ 2] 1579 	ldw	x, #0x5312
      008806 A6 10            [ 1] 1580 	ld	a, #0x10
      008808 F7               [ 1] 1581 	ld	(x), a
                                   1582 ;	se8r01-receive-car.c: 589: UARTPrintF("timer init 2 = \n\r");
      008809 AE 8B 89         [ 2] 1583 	ldw	x, #___str_1+0
      00880C 89               [ 2] 1584 	pushw	x
      00880D CD 82 79         [ 4] 1585 	call	_UARTPrintF
      008810 5B 02            [ 2] 1586 	addw	sp, #2
                                   1587 ;	se8r01-receive-car.c: 592: TIM2_CR1 |=0x81;
      008812 AE 53 00         [ 2] 1588 	ldw	x, #0x5300
      008815 F6               [ 1] 1589 	ld	a, (x)
      008816 AA 81            [ 1] 1590 	or	a, #0x81
      008818 F7               [ 1] 1591 	ld	(x), a
      008819 81               [ 4] 1592 	ret
                                   1593 ;	se8r01-receive-car.c: 598: int main () {
                                   1594 ;	-----------------------------------------
                                   1595 ;	 function main
                                   1596 ;	-----------------------------------------
      00881A                       1597 _main:
      00881A 52 45            [ 2] 1598 	sub	sp, #69
                                   1599 ;	se8r01-receive-car.c: 600: UCHAR rx_addr_p1[]  = { 0xd2, 0xf0, 0xf0, 0xf0, 0xf0 };
      00881C 90 96            [ 1] 1600 	ldw	y, sp
      00881E 72 A9 00 31      [ 2] 1601 	addw	y, #49
      008822 A6 D2            [ 1] 1602 	ld	a, #0xd2
      008824 90 F7            [ 1] 1603 	ld	(y), a
      008826 93               [ 1] 1604 	ldw	x, y
      008827 5C               [ 2] 1605 	incw	x
      008828 A6 F0            [ 1] 1606 	ld	a, #0xf0
      00882A F7               [ 1] 1607 	ld	(x), a
      00882B 93               [ 1] 1608 	ldw	x, y
      00882C 5C               [ 2] 1609 	incw	x
      00882D 5C               [ 2] 1610 	incw	x
      00882E A6 F0            [ 1] 1611 	ld	a, #0xf0
      008830 F7               [ 1] 1612 	ld	(x), a
      008831 93               [ 1] 1613 	ldw	x, y
      008832 A6 F0            [ 1] 1614 	ld	a, #0xf0
      008834 E7 03            [ 1] 1615 	ld	(0x0003, x), a
      008836 93               [ 1] 1616 	ldw	x, y
      008837 1C 00 04         [ 2] 1617 	addw	x, #0x0004
      00883A A6 F0            [ 1] 1618 	ld	a, #0xf0
      00883C F7               [ 1] 1619 	ld	(x), a
                                   1620 ;	se8r01-receive-car.c: 601: UCHAR tx_addr[]     = { 0xe1, 0xf0, 0xf0, 0xf0, 0xf0 };
      00883D 90 96            [ 1] 1621 	ldw	y, sp
      00883F 90 5C            [ 2] 1622 	incw	y
      008841 A6 E1            [ 1] 1623 	ld	a, #0xe1
      008843 90 F7            [ 1] 1624 	ld	(y), a
      008845 93               [ 1] 1625 	ldw	x, y
      008846 5C               [ 2] 1626 	incw	x
      008847 A6 F0            [ 1] 1627 	ld	a, #0xf0
      008849 F7               [ 1] 1628 	ld	(x), a
      00884A 93               [ 1] 1629 	ldw	x, y
      00884B 5C               [ 2] 1630 	incw	x
      00884C 5C               [ 2] 1631 	incw	x
      00884D A6 F0            [ 1] 1632 	ld	a, #0xf0
      00884F F7               [ 1] 1633 	ld	(x), a
      008850 93               [ 1] 1634 	ldw	x, y
      008851 A6 F0            [ 1] 1635 	ld	a, #0xf0
      008853 E7 03            [ 1] 1636 	ld	(0x0003, x), a
      008855 93               [ 1] 1637 	ldw	x, y
      008856 1C 00 04         [ 2] 1638 	addw	x, #0x0004
      008859 A6 F0            [ 1] 1639 	ld	a, #0xf0
      00885B F7               [ 1] 1640 	ld	(x), a
                                   1641 ;	se8r01-receive-car.c: 606: InitializeSystemClock();
      00885C CD 81 E4         [ 4] 1642 	call	_InitializeSystemClock
                                   1643 ;	se8r01-receive-car.c: 607: InitializeUART();
      00885F CD 82 DC         [ 4] 1644 	call	_InitializeUART
                                   1645 ;	se8r01-receive-car.c: 609: InitializeSPI ();
      008862 CD 81 BC         [ 4] 1646 	call	_InitializeSPI
                                   1647 ;	se8r01-receive-car.c: 611: UARTPrintF("start debug \n\r");
      008865 AE 8B 9B         [ 2] 1648 	ldw	x, #___str_2+0
      008868 89               [ 2] 1649 	pushw	x
      008869 CD 82 79         [ 4] 1650 	call	_UARTPrintF
      00886C 5B 02            [ 2] 1651 	addw	sp, #2
                                   1652 ;	se8r01-receive-car.c: 613: memset (tx_payload, 0, sizeof(tx_payload));
      00886E 96               [ 1] 1653 	ldw	x, sp
      00886F 1C 00 10         [ 2] 1654 	addw	x, #16
      008872 4B 21            [ 1] 1655 	push	#0x21
      008874 4B 00            [ 1] 1656 	push	#0x00
      008876 4B 00            [ 1] 1657 	push	#0x00
      008878 4B 00            [ 1] 1658 	push	#0x00
      00887A 89               [ 2] 1659 	pushw	x
      00887B CD 8C 32         [ 4] 1660 	call	_memset
      00887E 5B 06            [ 2] 1661 	addw	sp, #6
                                   1662 ;	se8r01-receive-car.c: 616: init_io();    // Initialize IO port
      008880 CD 83 55         [ 4] 1663 	call	_init_io
                                   1664 ;	se8r01-receive-car.c: 617: write_spi_reg(FLUSH_RX,0); // receive data 
      008883 4B 00            [ 1] 1665 	push	#0x00
      008885 4B E2            [ 1] 1666 	push	#0xe2
      008887 CD 80 CE         [ 4] 1667 	call	_write_spi_reg
      00888A 5B 02            [ 2] 1668 	addw	sp, #2
                                   1669 ;	se8r01-receive-car.c: 618: readstatus = read_spi_reg(CONFIG);
      00888C 4B 00            [ 1] 1670 	push	#0x00
      00888E CD 81 0A         [ 4] 1671 	call	_read_spi_reg
      008891 5B 01            [ 2] 1672 	addw	sp, #1
                                   1673 ;	se8r01-receive-car.c: 619: UARTPrintF("config = \n\r");
      008893 AE 8B AA         [ 2] 1674 	ldw	x, #___str_3+0
      008896 88               [ 1] 1675 	push	a
      008897 89               [ 2] 1676 	pushw	x
      008898 CD 82 79         [ 4] 1677 	call	_UARTPrintF
      00889B 5B 02            [ 2] 1678 	addw	sp, #2
      00889D 84               [ 1] 1679 	pop	a
                                   1680 ;	se8r01-receive-car.c: 620: print_UCHAR_hex(readstatus);
      00889E 88               [ 1] 1681 	push	a
      00889F CD 82 90         [ 4] 1682 	call	_print_UCHAR_hex
      0088A2 84               [ 1] 1683 	pop	a
                                   1684 ;	se8r01-receive-car.c: 621: readstatus = read_spi_reg(STATUS);
      0088A3 4B 07            [ 1] 1685 	push	#0x07
      0088A5 CD 81 0A         [ 4] 1686 	call	_read_spi_reg
      0088A8 5B 01            [ 2] 1687 	addw	sp, #1
                                   1688 ;	se8r01-receive-car.c: 622: UARTPrintF("status = \n\r");
      0088AA AE 8B B6         [ 2] 1689 	ldw	x, #___str_4+0
      0088AD 88               [ 1] 1690 	push	a
      0088AE 89               [ 2] 1691 	pushw	x
      0088AF CD 82 79         [ 4] 1692 	call	_UARTPrintF
      0088B2 5B 02            [ 2] 1693 	addw	sp, #2
      0088B4 84               [ 1] 1694 	pop	a
                                   1695 ;	se8r01-receive-car.c: 623: print_UCHAR_hex(readstatus);
      0088B5 88               [ 1] 1696 	push	a
      0088B6 CD 82 90         [ 4] 1697 	call	_print_UCHAR_hex
      0088B9 84               [ 1] 1698 	pop	a
                                   1699 ;	se8r01-receive-car.c: 627: PD_DDR |= (1 << 2) ; // output mode
      0088BA AE 50 11         [ 2] 1700 	ldw	x, #0x5011
      0088BD F6               [ 1] 1701 	ld	a, (x)
      0088BE AA 04            [ 1] 1702 	or	a, #0x04
      0088C0 F7               [ 1] 1703 	ld	(x), a
                                   1704 ;	se8r01-receive-car.c: 628: PD_CR1 |= (1 << 2) ; // push-pull
      0088C1 AE 50 12         [ 2] 1705 	ldw	x, #0x5012
      0088C4 F6               [ 1] 1706 	ld	a, (x)
      0088C5 AA 04            [ 1] 1707 	or	a, #0x04
      0088C7 F7               [ 1] 1708 	ld	(x), a
                                   1709 ;	se8r01-receive-car.c: 629: PD_ODR |= (1 << 2);
      0088C8 AE 50 0F         [ 2] 1710 	ldw	x, #0x500f
      0088CB F6               [ 1] 1711 	ld	a, (x)
      0088CC AA 04            [ 1] 1712 	or	a, #0x04
      0088CE F7               [ 1] 1713 	ld	(x), a
                                   1714 ;	se8r01-receive-car.c: 633: Init_Tim2 (); //pwm on pd4
      0088CF CD 87 AF         [ 4] 1715 	call	_Init_Tim2
                                   1716 ;	se8r01-receive-car.c: 634: PD_DDR |= (1<<4);
      0088D2 AE 50 11         [ 2] 1717 	ldw	x, #0x5011
      0088D5 F6               [ 1] 1718 	ld	a, (x)
      0088D6 AA 10            [ 1] 1719 	or	a, #0x10
      0088D8 F7               [ 1] 1720 	ld	(x), a
                                   1721 ;	se8r01-receive-car.c: 635: PD_CR1 |= (1<<4);
      0088D9 AE 50 12         [ 2] 1722 	ldw	x, #0x5012
      0088DC F6               [ 1] 1723 	ld	a, (x)
      0088DD AA 10            [ 1] 1724 	or	a, #0x10
      0088DF F7               [ 1] 1725 	ld	(x), a
                                   1726 ;	se8r01-receive-car.c: 636: PD_CR2 |= (1<<4);
      0088E0 AE 50 13         [ 2] 1727 	ldw	x, #0x5013
      0088E3 F6               [ 1] 1728 	ld	a, (x)
      0088E4 AA 10            [ 1] 1729 	or	a, #0x10
      0088E6 F7               [ 1] 1730 	ld	(x), a
                                   1731 ;	se8r01-receive-car.c: 640: PA_DDR |= (1<<3);
      0088E7 AE 50 02         [ 2] 1732 	ldw	x, #0x5002
      0088EA F6               [ 1] 1733 	ld	a, (x)
      0088EB AA 08            [ 1] 1734 	or	a, #0x08
      0088ED F7               [ 1] 1735 	ld	(x), a
                                   1736 ;	se8r01-receive-car.c: 641: PA_CR1 |= (1<<3);
      0088EE AE 50 03         [ 2] 1737 	ldw	x, #0x5003
      0088F1 F6               [ 1] 1738 	ld	a, (x)
      0088F2 AA 08            [ 1] 1739 	or	a, #0x08
      0088F4 F7               [ 1] 1740 	ld	(x), a
                                   1741 ;	se8r01-receive-car.c: 642: PA_CR2 |= (1<<4);
      0088F5 AE 50 04         [ 2] 1742 	ldw	x, #0x5004
      0088F8 F6               [ 1] 1743 	ld	a, (x)
      0088F9 AA 10            [ 1] 1744 	or	a, #0x10
      0088FB F7               [ 1] 1745 	ld	(x), a
                                   1746 ;	se8r01-receive-car.c: 644: SE8R01_Init();
      0088FC CD 86 C9         [ 4] 1747 	call	_SE8R01_Init
                                   1748 ;	se8r01-receive-car.c: 645: UARTPrintF("timer initialised = \n\r");
      0088FF AE 8B C2         [ 2] 1749 	ldw	x, #___str_5+0
      008902 89               [ 2] 1750 	pushw	x
      008903 CD 82 79         [ 4] 1751 	call	_UARTPrintF
      008906 5B 02            [ 2] 1752 	addw	sp, #2
                                   1753 ;	se8r01-receive-car.c: 653: PB_DDR |= (1 << 4) | (1 << 5);  // output mode
      008908 AE 50 07         [ 2] 1754 	ldw	x, #0x5007
      00890B F6               [ 1] 1755 	ld	a, (x)
      00890C AA 30            [ 1] 1756 	or	a, #0x30
      00890E F7               [ 1] 1757 	ld	(x), a
                                   1758 ;	se8r01-receive-car.c: 654: PB_CR1 |= (1 << 4) | (1 << 5);  // push-pull
      00890F AE 50 08         [ 2] 1759 	ldw	x, #0x5008
      008912 F6               [ 1] 1760 	ld	a, (x)
      008913 AA 30            [ 1] 1761 	or	a, #0x30
      008915 F7               [ 1] 1762 	ld	(x), a
                                   1763 ;	se8r01-receive-car.c: 655: PB_CR2 |= (1 << 4) | (1 << 5);  // up to 10MHz speed
      008916 AE 50 09         [ 2] 1764 	ldw	x, #0x5009
      008919 F6               [ 1] 1765 	ld	a, (x)
      00891A AA 30            [ 1] 1766 	or	a, #0x30
      00891C F7               [ 1] 1767 	ld	(x), a
                                   1768 ;	se8r01-receive-car.c: 661: PA_DDR |= (1 << 1) | (1 << 2);  // output mode
      00891D AE 50 02         [ 2] 1769 	ldw	x, #0x5002
      008920 F6               [ 1] 1770 	ld	a, (x)
      008921 AA 06            [ 1] 1771 	or	a, #0x06
      008923 F7               [ 1] 1772 	ld	(x), a
                                   1773 ;	se8r01-receive-car.c: 662: PA_CR1 |= (1 << 1) | (1 << 2);  // push-pull
      008924 AE 50 03         [ 2] 1774 	ldw	x, #0x5003
      008927 F6               [ 1] 1775 	ld	a, (x)
      008928 AA 06            [ 1] 1776 	or	a, #0x06
      00892A F7               [ 1] 1777 	ld	(x), a
                                   1778 ;	se8r01-receive-car.c: 663: PA_CR2 |= (1 << 1) | (1 << 2);  // up to 10MHz speed
      00892B AE 50 04         [ 2] 1779 	ldw	x, #0x5004
      00892E F6               [ 1] 1780 	ld	a, (x)
      00892F AA 06            [ 1] 1781 	or	a, #0x06
      008931 F7               [ 1] 1782 	ld	(x), a
                                   1783 ;	se8r01-receive-car.c: 668: PB_ODR |= 1 << 4; //only if pwm does not work jj
      008932 AE 50 05         [ 2] 1784 	ldw	x, #0x5005
      008935 F6               [ 1] 1785 	ld	a, (x)
      008936 AA 10            [ 1] 1786 	or	a, #0x10
      008938 F7               [ 1] 1787 	ld	(x), a
                                   1788 ;	se8r01-receive-car.c: 672: PB_ODR |= 1 << 5;
      008939 AE 50 05         [ 2] 1789 	ldw	x, #0x5005
      00893C F6               [ 1] 1790 	ld	a, (x)
      00893D AA 20            [ 1] 1791 	or	a, #0x20
      00893F F7               [ 1] 1792 	ld	(x), a
                                   1793 ;	se8r01-receive-car.c: 676: while (1) {
      008940                       1794 00120$:
                                   1795 ;	se8r01-receive-car.c: 681: delay(1000);
      008940 4B E8            [ 1] 1796 	push	#0xe8
      008942 4B 03            [ 1] 1797 	push	#0x03
      008944 CD 82 2E         [ 4] 1798 	call	_delay
      008947 5B 02            [ 2] 1799 	addw	sp, #2
                                   1800 ;	se8r01-receive-car.c: 686: PD_ODR &= ~(1 << 2); //blink LED
      008949 AE 50 0F         [ 2] 1801 	ldw	x, #0x500f
      00894C F6               [ 1] 1802 	ld	a, (x)
      00894D A4 FB            [ 1] 1803 	and	a, #0xfb
      00894F F7               [ 1] 1804 	ld	(x), a
                                   1805 ;	se8r01-receive-car.c: 687: delay(500);
      008950 4B F4            [ 1] 1806 	push	#0xf4
      008952 4B 01            [ 1] 1807 	push	#0x01
      008954 CD 82 2E         [ 4] 1808 	call	_delay
      008957 5B 02            [ 2] 1809 	addw	sp, #2
                                   1810 ;	se8r01-receive-car.c: 690: delay(500);
      008959 4B F4            [ 1] 1811 	push	#0xf4
      00895B 4B 01            [ 1] 1812 	push	#0x01
      00895D CD 82 2E         [ 4] 1813 	call	_delay
      008960 5B 02            [ 2] 1814 	addw	sp, #2
                                   1815 ;	se8r01-receive-car.c: 691: if ((PD_IDR & (1 << 3))==0) //input low
      008962 AE 50 10         [ 2] 1816 	ldw	x, #0x5010
      008965 F6               [ 1] 1817 	ld	a, (x)
      008966 A5 08            [ 1] 1818 	bcp	a, #0x08
      008968 27 03            [ 1] 1819 	jreq	00204$
      00896A CC 8B 3D         [ 2] 1820 	jp	00115$
      00896D                       1821 00204$:
                                   1822 ;	se8r01-receive-car.c: 695: delay(240);
      00896D 4B F0            [ 1] 1823 	push	#0xf0
      00896F 4B 00            [ 1] 1824 	push	#0x00
      008971 CD 82 2E         [ 4] 1825 	call	_delay
      008974 5B 02            [ 2] 1826 	addw	sp, #2
                                   1827 ;	se8r01-receive-car.c: 696: signal_lv=read_spi_reg(iRF_BANK0_RPD);
      008976 4B 09            [ 1] 1828 	push	#0x09
      008978 CD 81 0A         [ 4] 1829 	call	_read_spi_reg
      00897B 5B 01            [ 2] 1830 	addw	sp, #1
      00897D C7 00 1A         [ 1] 1831 	ld	_signal_lv+0, a
                                   1832 ;	se8r01-receive-car.c: 697: status = read_spi_reg(STATUS);
      008980 4B 07            [ 1] 1833 	push	#0x07
      008982 CD 81 0A         [ 4] 1834 	call	_read_spi_reg
      008985 5B 01            [ 2] 1835 	addw	sp, #1
      008987 C7 00 1D         [ 1] 1836 	ld	_status+0, a
                                   1837 ;	se8r01-receive-car.c: 699: if(status&STA_MARK_RX)                                                 // if receive data ready (TX_DS) interrupt
      00898A 72 06 00 1D 02   [ 2] 1838 	btjt	_status+0, #6, 00205$
      00898F 20 5C            [ 2] 1839 	jra	00103$
      008991                       1840 00205$:
                                   1841 ;	se8r01-receive-car.c: 702: pip= (status & 0b00001110)>>1;
      008991 C6 00 1D         [ 1] 1842 	ld	a, _status+0
      008994 A4 0E            [ 1] 1843 	and	a, #0x0e
      008996 44               [ 1] 1844 	srl	a
      008997 5F               [ 1] 1845 	clrw	x
      008998 97               [ 1] 1846 	ld	xl, a
      008999 CF 00 1B         [ 2] 1847 	ldw	_pip+0, x
                                   1848 ;	se8r01-receive-car.c: 703: pload_width_now=read_spi_reg(iRF_CMD_R_RX_PL_WID);
      00899C 4B 60            [ 1] 1849 	push	#0x60
      00899E CD 81 0A         [ 4] 1850 	call	_read_spi_reg
      0089A1 5B 01            [ 2] 1851 	addw	sp, #1
      0089A3 5F               [ 1] 1852 	clrw	x
      0089A4 97               [ 1] 1853 	ld	xl, a
      0089A5 CF 00 16         [ 2] 1854 	ldw	_pload_width_now+0, x
                                   1855 ;	se8r01-receive-car.c: 704: read_spi_buf(RD_RX_PLOAD, rx_buf,32);             // read playload to rx_buf
      0089A8 AE 00 2E         [ 2] 1856 	ldw	x, #_rx_buf+0
      0089AB 1F 41            [ 2] 1857 	ldw	(0x41, sp), x
      0089AD 1E 41            [ 2] 1858 	ldw	x, (0x41, sp)
      0089AF 4B 20            [ 1] 1859 	push	#0x20
      0089B1 89               [ 2] 1860 	pushw	x
      0089B2 4B 61            [ 1] 1861 	push	#0x61
      0089B4 CD 81 80         [ 4] 1862 	call	_read_spi_buf
      0089B7 5B 04            [ 2] 1863 	addw	sp, #4
                                   1864 ;	se8r01-receive-car.c: 705: write_spi_reg(FLUSH_RX,0);
      0089B9 4B 00            [ 1] 1865 	push	#0x00
      0089BB 4B E2            [ 1] 1866 	push	#0xe2
      0089BD CD 80 CE         [ 4] 1867 	call	_write_spi_reg
      0089C0 5B 02            [ 2] 1868 	addw	sp, #2
                                   1869 ;	se8r01-receive-car.c: 707: newdata=1;
      0089C2 35 01 00 19      [ 1] 1870 	mov	_newdata+1, #0x01
      0089C6 72 5F 00 18      [ 1] 1871 	clr	_newdata+0
                                   1872 ;	se8r01-receive-car.c: 708: for (teller=0;teller<32;++teller)
      0089CA 5F               [ 1] 1873 	clrw	x
      0089CB 1F 0E            [ 2] 1874 	ldw	(0x0e, sp), x
      0089CD                       1875 00122$:
                                   1876 ;	se8r01-receive-car.c: 709: print_UCHAR_hex (rx_buf[teller]);
      0089CD 1E 41            [ 2] 1877 	ldw	x, (0x41, sp)
      0089CF 72 FB 0E         [ 2] 1878 	addw	x, (0x0e, sp)
      0089D2 F6               [ 1] 1879 	ld	a, (x)
      0089D3 88               [ 1] 1880 	push	a
      0089D4 CD 82 90         [ 4] 1881 	call	_print_UCHAR_hex
      0089D7 84               [ 1] 1882 	pop	a
                                   1883 ;	se8r01-receive-car.c: 708: for (teller=0;teller<32;++teller)
      0089D8 1E 0E            [ 2] 1884 	ldw	x, (0x0e, sp)
      0089DA 5C               [ 2] 1885 	incw	x
      0089DB 1F 0E            [ 2] 1886 	ldw	(0x0e, sp), x
      0089DD 1E 0E            [ 2] 1887 	ldw	x, (0x0e, sp)
      0089DF A3 00 20         [ 2] 1888 	cpw	x, #0x0020
      0089E2 2F E9            [ 1] 1889 	jrslt	00122$
                                   1890 ;	se8r01-receive-car.c: 710: UARTPrintF("\n\r");
      0089E4 AE 8B D9         [ 2] 1891 	ldw	x, #___str_6+0
      0089E7 89               [ 2] 1892 	pushw	x
      0089E8 CD 82 79         [ 4] 1893 	call	_UARTPrintF
      0089EB 5B 02            [ 2] 1894 	addw	sp, #2
      0089ED                       1895 00103$:
                                   1896 ;	se8r01-receive-car.c: 713: if (rx_buf[0]==0xac && rx_buf[1]==0xcc) //the first two are a code to only accept these lines in the transmitted lines to avoid errors
      0089ED AE 00 2E         [ 2] 1897 	ldw	x, #_rx_buf+0
      0089F0 1F 36            [ 2] 1898 	ldw	(0x36, sp), x
      0089F2 1E 36            [ 2] 1899 	ldw	x, (0x36, sp)
      0089F4 F6               [ 1] 1900 	ld	a, (x)
      0089F5 A1 AC            [ 1] 1901 	cp	a, #0xac
      0089F7 27 03            [ 1] 1902 	jreq	00209$
      0089F9 CC 8B 33         [ 2] 1903 	jp	00112$
      0089FC                       1904 00209$:
      0089FC 1E 36            [ 2] 1905 	ldw	x, (0x36, sp)
      0089FE E6 01            [ 1] 1906 	ld	a, (0x1, x)
      008A00 A1 CC            [ 1] 1907 	cp	a, #0xcc
      008A02 27 03            [ 1] 1908 	jreq	00212$
      008A04 CC 8B 33         [ 2] 1909 	jp	00112$
      008A07                       1910 00212$:
                                   1911 ;	se8r01-receive-car.c: 715: speed = (unsigned int)rx_buf[2] << 8 | (unsigned int)rx_buf[3];
      008A07 1E 36            [ 2] 1912 	ldw	x, (0x36, sp)
      008A09 E6 02            [ 1] 1913 	ld	a, (0x2, x)
      008A0B 5F               [ 1] 1914 	clrw	x
      008A0C 97               [ 1] 1915 	ld	xl, a
      008A0D 58               [ 2] 1916 	sllw	x
      008A0E 58               [ 2] 1917 	sllw	x
      008A0F 58               [ 2] 1918 	sllw	x
      008A10 58               [ 2] 1919 	sllw	x
      008A11 58               [ 2] 1920 	sllw	x
      008A12 58               [ 2] 1921 	sllw	x
      008A13 58               [ 2] 1922 	sllw	x
      008A14 58               [ 2] 1923 	sllw	x
      008A15 16 36            [ 2] 1924 	ldw	y, (0x36, sp)
      008A17 90 E6 03         [ 1] 1925 	ld	a, (0x3, y)
      008A1A 0F 38            [ 1] 1926 	clr	(0x38, sp)
      008A1C 89               [ 2] 1927 	pushw	x
      008A1D 1A 02            [ 1] 1928 	or	a, (2, sp)
      008A1F 85               [ 2] 1929 	popw	x
      008A20 6B 0D            [ 1] 1930 	ld	(0x0d, sp), a
      008A22 9E               [ 1] 1931 	ld	a, xh
      008A23 1A 38            [ 1] 1932 	or	a, (0x38, sp)
      008A25 6B 0C            [ 1] 1933 	ld	(0x0c, sp), a
                                   1934 ;	se8r01-receive-car.c: 716: if ((speed <= 0x0210) && (speed >= 0x0190)) {
      008A27 1E 0C            [ 2] 1935 	ldw	x, (0x0c, sp)
      008A29 A3 02 10         [ 2] 1936 	cpw	x, #0x0210
      008A2C 2C 04            [ 1] 1937 	jrsgt	00213$
      008A2E 0F 45            [ 1] 1938 	clr	(0x45, sp)
      008A30 20 04            [ 2] 1939 	jra	00214$
      008A32                       1940 00213$:
      008A32 A6 01            [ 1] 1941 	ld	a, #0x01
      008A34 6B 45            [ 1] 1942 	ld	(0x45, sp), a
      008A36                       1943 00214$:
      008A36 1E 0C            [ 2] 1944 	ldw	x, (0x0c, sp)
      008A38 A3 01 90         [ 2] 1945 	cpw	x, #0x0190
      008A3B 2F 04            [ 1] 1946 	jrslt	00215$
      008A3D 0F 40            [ 1] 1947 	clr	(0x40, sp)
      008A3F 20 04            [ 2] 1948 	jra	00216$
      008A41                       1949 00215$:
      008A41 A6 01            [ 1] 1950 	ld	a, #0x01
      008A43 6B 40            [ 1] 1951 	ld	(0x40, sp), a
      008A45                       1952 00216$:
      008A45 0D 45            [ 1] 1953 	tnz	(0x45, sp)
      008A47 26 1A            [ 1] 1954 	jrne	00105$
      008A49 0D 40            [ 1] 1955 	tnz	(0x40, sp)
      008A4B 26 16            [ 1] 1956 	jrne	00105$
                                   1957 ;	se8r01-receive-car.c: 717: PA_ODR &= ~(1 << 2);
      008A4D AE 50 00         [ 2] 1958 	ldw	x, #0x5000
      008A50 F6               [ 1] 1959 	ld	a, (x)
      008A51 A4 FB            [ 1] 1960 	and	a, #0xfb
      008A53 F7               [ 1] 1961 	ld	(x), a
                                   1962 ;	se8r01-receive-car.c: 718: PA_ODR &= ~(1 << 1);
      008A54 AE 50 00         [ 2] 1963 	ldw	x, #0x5000
      008A57 F6               [ 1] 1964 	ld	a, (x)
      008A58 A4 FD            [ 1] 1965 	and	a, #0xfd
      008A5A F7               [ 1] 1966 	ld	(x), a
                                   1967 ;	se8r01-receive-car.c: 719: TIM2_CCR1H = 0; //compare capture register value for channel 1
      008A5B AE 53 11         [ 2] 1968 	ldw	x, #0x5311
      008A5E 7F               [ 1] 1969 	clr	(x)
                                   1970 ;	se8r01-receive-car.c: 720: TIM2_CCR1L = 0;
      008A5F AE 53 12         [ 2] 1971 	ldw	x, #0x5312
      008A62 7F               [ 1] 1972 	clr	(x)
      008A63                       1973 00105$:
                                   1974 ;	se8r01-receive-car.c: 725: if (speed > 0x0210) { //forward
      008A63 0D 45            [ 1] 1975 	tnz	(0x45, sp)
      008A65 27 41            [ 1] 1976 	jreq	00108$
                                   1977 ;	se8r01-receive-car.c: 726: PA_ODR &= ~(1 << 2);
      008A67 AE 50 00         [ 2] 1978 	ldw	x, #0x5000
      008A6A F6               [ 1] 1979 	ld	a, (x)
      008A6B A4 FB            [ 1] 1980 	and	a, #0xfb
      008A6D F7               [ 1] 1981 	ld	(x), a
                                   1982 ;	se8r01-receive-car.c: 727: PA_ODR |= 1 << 1;
      008A6E AE 50 00         [ 2] 1983 	ldw	x, #0x5000
      008A71 F6               [ 1] 1984 	ld	a, (x)
      008A72 AA 02            [ 1] 1985 	or	a, #0x02
      008A74 F7               [ 1] 1986 	ld	(x), a
                                   1987 ;	se8r01-receive-car.c: 728: TIM2_CCR1H =(speed-500)*40/256; //compare capture register value for channel 1
      008A75 1E 0C            [ 2] 1988 	ldw	x, (0x0c, sp)
      008A77 1D 01 F4         [ 2] 1989 	subw	x, #0x01f4
      008A7A 89               [ 2] 1990 	pushw	x
      008A7B 4B 28            [ 1] 1991 	push	#0x28
      008A7D 4B 00            [ 1] 1992 	push	#0x00
      008A7F CD 8B DC         [ 4] 1993 	call	__mulint
      008A82 5B 04            [ 2] 1994 	addw	sp, #4
      008A84 1F 3A            [ 2] 1995 	ldw	(0x3a, sp), x
      008A86 4B 00            [ 1] 1996 	push	#0x00
      008A88 4B 01            [ 1] 1997 	push	#0x01
      008A8A 1E 3C            [ 2] 1998 	ldw	x, (0x3c, sp)
      008A8C 89               [ 2] 1999 	pushw	x
      008A8D CD 8C 8F         [ 4] 2000 	call	__divsint
      008A90 5B 04            [ 2] 2001 	addw	sp, #4
      008A92 9F               [ 1] 2002 	ld	a, xl
      008A93 AE 53 11         [ 2] 2003 	ldw	x, #0x5311
      008A96 F7               [ 1] 2004 	ld	(x), a
                                   2005 ;	se8r01-receive-car.c: 729: TIM2_CCR1L =(speed-500)*40%256;
      008A97 4B 00            [ 1] 2006 	push	#0x00
      008A99 4B 01            [ 1] 2007 	push	#0x01
      008A9B 1E 3C            [ 2] 2008 	ldw	x, (0x3c, sp)
      008A9D 89               [ 2] 2009 	pushw	x
      008A9E CD 8C 51         [ 4] 2010 	call	__modsint
      008AA1 5B 04            [ 2] 2011 	addw	sp, #4
      008AA3 9F               [ 1] 2012 	ld	a, xl
      008AA4 AE 53 12         [ 2] 2013 	ldw	x, #0x5312
      008AA7 F7               [ 1] 2014 	ld	(x), a
      008AA8                       2015 00108$:
                                   2016 ;	se8r01-receive-car.c: 731: if (speed < 0x0190) { //reverse
      008AA8 0D 40            [ 1] 2017 	tnz	(0x40, sp)
      008AAA 27 42            [ 1] 2018 	jreq	00110$
                                   2019 ;	se8r01-receive-car.c: 732: PA_ODR &= ~(1 << 1);
      008AAC AE 50 00         [ 2] 2020 	ldw	x, #0x5000
      008AAF F6               [ 1] 2021 	ld	a, (x)
      008AB0 A4 FD            [ 1] 2022 	and	a, #0xfd
      008AB2 F7               [ 1] 2023 	ld	(x), a
                                   2024 ;	se8r01-receive-car.c: 733: PA_ODR |= 1 << 2;
      008AB3 AE 50 00         [ 2] 2025 	ldw	x, #0x5000
      008AB6 F6               [ 1] 2026 	ld	a, (x)
      008AB7 AA 04            [ 1] 2027 	or	a, #0x04
      008AB9 F7               [ 1] 2028 	ld	(x), a
                                   2029 ;	se8r01-receive-car.c: 734: TIM2_CCR1H =(500-speed)*40/256; //compare capture register value for channel 1
      008ABA AE 01 F4         [ 2] 2030 	ldw	x, #0x01f4
      008ABD 72 F0 0C         [ 2] 2031 	subw	x, (0x0c, sp)
      008AC0 89               [ 2] 2032 	pushw	x
      008AC1 4B 28            [ 1] 2033 	push	#0x28
      008AC3 4B 00            [ 1] 2034 	push	#0x00
      008AC5 CD 8B DC         [ 4] 2035 	call	__mulint
      008AC8 5B 04            [ 2] 2036 	addw	sp, #4
      008ACA 1F 43            [ 2] 2037 	ldw	(0x43, sp), x
      008ACC 4B 00            [ 1] 2038 	push	#0x00
      008ACE 4B 01            [ 1] 2039 	push	#0x01
      008AD0 1E 45            [ 2] 2040 	ldw	x, (0x45, sp)
      008AD2 89               [ 2] 2041 	pushw	x
      008AD3 CD 8C 8F         [ 4] 2042 	call	__divsint
      008AD6 5B 04            [ 2] 2043 	addw	sp, #4
      008AD8 9F               [ 1] 2044 	ld	a, xl
      008AD9 AE 53 11         [ 2] 2045 	ldw	x, #0x5311
      008ADC F7               [ 1] 2046 	ld	(x), a
                                   2047 ;	se8r01-receive-car.c: 735: TIM2_CCR1L =(500-speed)*40%256;
      008ADD 4B 00            [ 1] 2048 	push	#0x00
      008ADF 4B 01            [ 1] 2049 	push	#0x01
      008AE1 1E 45            [ 2] 2050 	ldw	x, (0x45, sp)
      008AE3 89               [ 2] 2051 	pushw	x
      008AE4 CD 8C 51         [ 4] 2052 	call	__modsint
      008AE7 5B 04            [ 2] 2053 	addw	sp, #4
      008AE9 9F               [ 1] 2054 	ld	a, xl
      008AEA AE 53 12         [ 2] 2055 	ldw	x, #0x5312
      008AED F7               [ 1] 2056 	ld	(x), a
      008AEE                       2057 00110$:
                                   2058 ;	se8r01-receive-car.c: 738: angle = (unsigned int)rx_buf[4] << 8 | (unsigned int)rx_buf[5]; //angle of servo motor
      008AEE 1E 36            [ 2] 2059 	ldw	x, (0x36, sp)
      008AF0 E6 04            [ 1] 2060 	ld	a, (0x4, x)
      008AF2 5F               [ 1] 2061 	clrw	x
      008AF3 97               [ 1] 2062 	ld	xl, a
      008AF4 58               [ 2] 2063 	sllw	x
      008AF5 58               [ 2] 2064 	sllw	x
      008AF6 58               [ 2] 2065 	sllw	x
      008AF7 58               [ 2] 2066 	sllw	x
      008AF8 58               [ 2] 2067 	sllw	x
      008AF9 58               [ 2] 2068 	sllw	x
      008AFA 58               [ 2] 2069 	sllw	x
      008AFB 58               [ 2] 2070 	sllw	x
      008AFC 16 36            [ 2] 2071 	ldw	y, (0x36, sp)
      008AFE 90 E6 05         [ 1] 2072 	ld	a, (0x5, y)
      008B01 0F 3E            [ 1] 2073 	clr	(0x3e, sp)
      008B03 89               [ 2] 2074 	pushw	x
      008B04 1A 02            [ 1] 2075 	or	a, (2, sp)
      008B06 85               [ 2] 2076 	popw	x
      008B07 97               [ 1] 2077 	ld	xl, a
      008B08 9E               [ 1] 2078 	ld	a, xh
      008B09 1A 3E            [ 1] 2079 	or	a, (0x3e, sp)
      008B0B 95               [ 1] 2080 	ld	xh, a
                                   2081 ;	se8r01-receive-car.c: 739: TIM2_CCR3H =(1000+angle)/256; //compare capture register value
      008B0C 1C 03 E8         [ 2] 2082 	addw	x, #0x03e8
      008B0F 1F 3C            [ 2] 2083 	ldw	(0x3c, sp), x
      008B11 4B 00            [ 1] 2084 	push	#0x00
      008B13 4B 01            [ 1] 2085 	push	#0x01
      008B15 1E 3E            [ 2] 2086 	ldw	x, (0x3e, sp)
      008B17 89               [ 2] 2087 	pushw	x
      008B18 CD 8C 8F         [ 4] 2088 	call	__divsint
      008B1B 5B 04            [ 2] 2089 	addw	sp, #4
      008B1D 9F               [ 1] 2090 	ld	a, xl
      008B1E AE 53 15         [ 2] 2091 	ldw	x, #0x5315
      008B21 F7               [ 1] 2092 	ld	(x), a
                                   2093 ;	se8r01-receive-car.c: 740: TIM2_CCR3L =(1000+angle)%256;
      008B22 4B 00            [ 1] 2094 	push	#0x00
      008B24 4B 01            [ 1] 2095 	push	#0x01
      008B26 1E 3E            [ 2] 2096 	ldw	x, (0x3e, sp)
      008B28 89               [ 2] 2097 	pushw	x
      008B29 CD 8C 51         [ 4] 2098 	call	__modsint
      008B2C 5B 04            [ 2] 2099 	addw	sp, #4
      008B2E 9F               [ 1] 2100 	ld	a, xl
      008B2F AE 53 16         [ 2] 2101 	ldw	x, #0x5316
      008B32 F7               [ 1] 2102 	ld	(x), a
      008B33                       2103 00112$:
                                   2104 ;	se8r01-receive-car.c: 742: write_spi_reg(WRITE_REG+STATUS,status);       // clear RX_DR or TX_DS or MAX_RT interrupt flag
      008B33 3B 00 1D         [ 1] 2105 	push	_status+0
      008B36 4B 27            [ 1] 2106 	push	#0x27
      008B38 CD 80 CE         [ 4] 2107 	call	_write_spi_reg
      008B3B 5B 02            [ 2] 2108 	addw	sp, #2
      008B3D                       2109 00115$:
                                   2110 ;	se8r01-receive-car.c: 747: for (x1 = 0; x1 < 50; ++x1)
      008B3D 5F               [ 1] 2111 	clrw	x
      008B3E 1F 0A            [ 2] 2112 	ldw	(0x0a, sp), x
      008B40                       2113 00131$:
      008B40 1E 0A            [ 2] 2114 	ldw	x, (0x0a, sp)
      008B42 A3 00 32         [ 2] 2115 	cpw	x, #0x0032
      008B45 2F 03            [ 1] 2116 	jrslt	00221$
      008B47 CC 89 40         [ 2] 2117 	jp	00120$
      008B4A                       2118 00221$:
                                   2119 ;	se8r01-receive-car.c: 748: for (y1 = 0; y1 < 50; ++y1)
      008B4A 5F               [ 1] 2120 	clrw	x
      008B4B 1F 08            [ 2] 2121 	ldw	(0x08, sp), x
      008B4D                       2122 00128$:
      008B4D 1E 08            [ 2] 2123 	ldw	x, (0x08, sp)
      008B4F A3 00 32         [ 2] 2124 	cpw	x, #0x0032
      008B52 2E 19            [ 1] 2125 	jrsge	00132$
                                   2126 ;	se8r01-receive-car.c: 749: for (z1 = 0; z1 < 50; ++z1)
      008B54 5F               [ 1] 2127 	clrw	x
      008B55 1F 06            [ 2] 2128 	ldw	(0x06, sp), x
      008B57                       2129 00125$:
      008B57 1E 06            [ 2] 2130 	ldw	x, (0x06, sp)
      008B59 A3 00 32         [ 2] 2131 	cpw	x, #0x0032
      008B5C 2E 08            [ 1] 2132 	jrsge	00129$
                                   2133 ;	se8r01-receive-car.c: 750: __asm__("nop");
      008B5E 9D               [ 1] 2134 	nop
                                   2135 ;	se8r01-receive-car.c: 749: for (z1 = 0; z1 < 50; ++z1)
      008B5F 1E 06            [ 2] 2136 	ldw	x, (0x06, sp)
      008B61 5C               [ 2] 2137 	incw	x
      008B62 1F 06            [ 2] 2138 	ldw	(0x06, sp), x
      008B64 20 F1            [ 2] 2139 	jra	00125$
      008B66                       2140 00129$:
                                   2141 ;	se8r01-receive-car.c: 748: for (y1 = 0; y1 < 50; ++y1)
      008B66 1E 08            [ 2] 2142 	ldw	x, (0x08, sp)
      008B68 5C               [ 2] 2143 	incw	x
      008B69 1F 08            [ 2] 2144 	ldw	(0x08, sp), x
      008B6B 20 E0            [ 2] 2145 	jra	00128$
      008B6D                       2146 00132$:
                                   2147 ;	se8r01-receive-car.c: 747: for (x1 = 0; x1 < 50; ++x1)
      008B6D 1E 0A            [ 2] 2148 	ldw	x, (0x0a, sp)
      008B6F 5C               [ 2] 2149 	incw	x
      008B70 1F 0A            [ 2] 2150 	ldw	(0x0a, sp), x
      008B72 20 CC            [ 2] 2151 	jra	00131$
      008B74 5B 45            [ 2] 2152 	addw	sp, #69
      008B76 81               [ 4] 2153 	ret
                                   2154 	.area CODE
      008B77                       2155 ___str_0:
      008B77 74 69 6D 65 72 20 69  2156 	.ascii "timer init 1 = "
             6E 69 74 20 31 20 3D
             20
      008B86 0A                    2157 	.db 0x0A
      008B87 0D                    2158 	.db 0x0D
      008B88 00                    2159 	.db 0x00
      008B89                       2160 ___str_1:
      008B89 74 69 6D 65 72 20 69  2161 	.ascii "timer init 2 = "
             6E 69 74 20 32 20 3D
             20
      008B98 0A                    2162 	.db 0x0A
      008B99 0D                    2163 	.db 0x0D
      008B9A 00                    2164 	.db 0x00
      008B9B                       2165 ___str_2:
      008B9B 73 74 61 72 74 20 64  2166 	.ascii "start debug "
             65 62 75 67 20
      008BA7 0A                    2167 	.db 0x0A
      008BA8 0D                    2168 	.db 0x0D
      008BA9 00                    2169 	.db 0x00
      008BAA                       2170 ___str_3:
      008BAA 63 6F 6E 66 69 67 20  2171 	.ascii "config = "
             3D 20
      008BB3 0A                    2172 	.db 0x0A
      008BB4 0D                    2173 	.db 0x0D
      008BB5 00                    2174 	.db 0x00
      008BB6                       2175 ___str_4:
      008BB6 73 74 61 74 75 73 20  2176 	.ascii "status = "
             3D 20
      008BBF 0A                    2177 	.db 0x0A
      008BC0 0D                    2178 	.db 0x0D
      008BC1 00                    2179 	.db 0x00
      008BC2                       2180 ___str_5:
      008BC2 74 69 6D 65 72 20 69  2181 	.ascii "timer initialised = "
             6E 69 74 69 61 6C 69
             73 65 64 20 3D 20
      008BD6 0A                    2182 	.db 0x0A
      008BD7 0D                    2183 	.db 0x0D
      008BD8 00                    2184 	.db 0x00
      008BD9                       2185 ___str_6:
      008BD9 0A                    2186 	.db 0x0A
      008BDA 0D                    2187 	.db 0x0D
      008BDB 00                    2188 	.db 0x00
                                   2189 	.area INITIALIZER
      008CE4                       2190 __xinit__SE8R01_DR_2M:
      008CE4 00 00                 2191 	.dw #0x0000
      008CE6                       2192 __xinit__SE8R01_DR_1M:
      008CE6 00 00                 2193 	.dw #0x0000
      008CE8                       2194 __xinit__SE8R01_DR_500K:
      008CE8 00 01                 2195 	.dw #0x0001
      008CEA                       2196 __xinit__pload_width_now:
      008CEA 00 00                 2197 	.dw #0x0000
      008CEC                       2198 __xinit__newdata:
      008CEC 00 00                 2199 	.dw #0x0000
      008CEE                       2200 __xinit__signal_lv:
      008CEE 00                    2201 	.db #0x00	;  0
      008CEF                       2202 __xinit__pip:
      008CEF 00 00                 2203 	.dw #0x0000
      008CF1                       2204 __xinit__status:
      008CF1 00                    2205 	.db #0x00	; 0
      008CF2                       2206 __xinit__TX_ADDRESS:
      008CF2 B3                    2207 	.db #0xB3	; 179
      008CF3 43                    2208 	.db #0x43	; 67	'C'
      008CF4 10                    2209 	.db #0x10	; 16
      008CF5 10                    2210 	.db #0x10	; 16
      008CF6                       2211 __xinit__ADDRESS2:
      008CF6 B1                    2212 	.db #0xB1	; 177
      008CF7                       2213 __xinit__ADDRESS3:
      008CF7 B2                    2214 	.db #0xB2	; 178
      008CF8                       2215 __xinit__ADDRESS4:
      008CF8 B3                    2216 	.db #0xB3	; 179
      008CF9                       2217 __xinit__ADDRESS5:
      008CF9 B4                    2218 	.db #0xB4	; 180
      008CFA                       2219 __xinit__ADDRESS1:
      008CFA B0                    2220 	.db #0xB0	; 176
      008CFB 43                    2221 	.db #0x43	; 67	'C'
      008CFC 10                    2222 	.db #0x10	; 16
      008CFD 10                    2223 	.db #0x10	; 16
      008CFE                       2224 __xinit__ADDRESS0:
      008CFE 34                    2225 	.db #0x34	; 52	'4'
      008CFF 43                    2226 	.db #0x43	; 67	'C'
      008D00 10                    2227 	.db #0x10	; 16
      008D01 10                    2228 	.db #0x10	; 16
      008D02                       2229 __xinit__rx_buf:
      008D02 00                    2230 	.db #0x00	; 0
      008D03 00                    2231 	.db 0x00
      008D04 00                    2232 	.db 0x00
      008D05 00                    2233 	.db 0x00
      008D06 00                    2234 	.db 0x00
      008D07 00                    2235 	.db 0x00
      008D08 00                    2236 	.db 0x00
      008D09 00                    2237 	.db 0x00
      008D0A 00                    2238 	.db 0x00
      008D0B 00                    2239 	.db 0x00
      008D0C 00                    2240 	.db 0x00
      008D0D 00                    2241 	.db 0x00
      008D0E 00                    2242 	.db 0x00
      008D0F 00                    2243 	.db 0x00
      008D10 00                    2244 	.db 0x00
      008D11 00                    2245 	.db 0x00
      008D12 00                    2246 	.db 0x00
      008D13 00                    2247 	.db 0x00
      008D14 00                    2248 	.db 0x00
      008D15 00                    2249 	.db 0x00
      008D16 00                    2250 	.db 0x00
      008D17 00                    2251 	.db 0x00
      008D18 00                    2252 	.db 0x00
      008D19 00                    2253 	.db 0x00
      008D1A 00                    2254 	.db 0x00
      008D1B 00                    2255 	.db 0x00
      008D1C 00                    2256 	.db 0x00
      008D1D 00                    2257 	.db 0x00
      008D1E 00                    2258 	.db 0x00
      008D1F 00                    2259 	.db 0x00
      008D20 00                    2260 	.db 0x00
      008D21 00                    2261 	.db 0x00
      008D22                       2262 __xinit__tx_buf:
      008D22 00                    2263 	.db #0x00	; 0
      008D23 00                    2264 	.db 0x00
      008D24 00                    2265 	.db 0x00
      008D25 00                    2266 	.db 0x00
      008D26 00                    2267 	.db 0x00
      008D27 00                    2268 	.db 0x00
      008D28 00                    2269 	.db 0x00
      008D29 00                    2270 	.db 0x00
      008D2A 00                    2271 	.db 0x00
      008D2B 00                    2272 	.db 0x00
      008D2C 00                    2273 	.db 0x00
      008D2D 00                    2274 	.db 0x00
      008D2E 00                    2275 	.db 0x00
      008D2F 00                    2276 	.db 0x00
      008D30 00                    2277 	.db 0x00
      008D31 00                    2278 	.db 0x00
      008D32 00                    2279 	.db 0x00
      008D33 00                    2280 	.db 0x00
      008D34 00                    2281 	.db 0x00
      008D35 00                    2282 	.db 0x00
      008D36 00                    2283 	.db 0x00
      008D37 00                    2284 	.db 0x00
      008D38 00                    2285 	.db 0x00
      008D39 00                    2286 	.db 0x00
      008D3A 00                    2287 	.db 0x00
      008D3B 00                    2288 	.db 0x00
      008D3C 00                    2289 	.db 0x00
      008D3D 00                    2290 	.db 0x00
      008D3E 00                    2291 	.db 0x00
      008D3F 00                    2292 	.db 0x00
      008D40 00                    2293 	.db 0x00
      008D41 00                    2294 	.db 0x00
                                   2295 	.area CABS (ABS)
