                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.0 #8981 (Jul 11 2014) (Linux)
                                      4 ; This file was generated Wed Feb  7 10:05:44 2018
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
      008094 D6 8A FB         [ 1]  168 	ld	a, (s_INITIALIZER - 1, x)
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
      008080 CC 88 34         [ 2]  182 	jp	_main
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
      0080D3 A4 F7            [ 1]  246 	and	a, #0xf7
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
      008102 AA 08            [ 1]  277 	or	a, #0x08
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
      00810F A4 F7            [ 1]  292 	and	a, #0xf7
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
      008140 AA 08            [ 1]  323 	or	a, #0x08
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
      00814E A4 F7            [ 1]  338 	and	a, #0xf7
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
      008178 AA 08            [ 1]  368 	or	a, #0x08
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
      008186 A4 F7            [ 1]  383 	and	a, #0xf7
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
      0081B4 AA 08            [ 1]  415 	or	a, #0x08
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
      0081E0 A4 EF            [ 1]  451 	and	a, #0xef
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
      00823C CD 8A 87         [ 4]  527 	call	__mulint
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
                                    747 ;	se8r01-receive-car.c: 274: PD_DDR &= ~(1 << 3); // input mode
      008357 AE 50 11         [ 2]  748 	ldw	x, #0x5011
      00835A F6               [ 1]  749 	ld	a, (x)
      00835B A4 F7            [ 1]  750 	and	a, #0xf7
      00835D F7               [ 1]  751 	ld	(x), a
                                    752 ;	se8r01-receive-car.c: 275: PD_CR1 |= (1 << 3); // input with pull up 
      00835E AE 50 12         [ 2]  753 	ldw	x, #0x5012
      008361 F6               [ 1]  754 	ld	a, (x)
      008362 AA 08            [ 1]  755 	or	a, #0x08
      008364 F7               [ 1]  756 	ld	(x), a
                                    757 ;	se8r01-receive-car.c: 276: PD_CR2 |= (1 << 3); // interrupt enabled 
      008365 AE 50 13         [ 2]  758 	ldw	x, #0x5013
      008368 F6               [ 1]  759 	ld	a, (x)
      008369 AA 08            [ 1]  760 	or	a, #0x08
      00836B F7               [ 1]  761 	ld	(x), a
                                    762 ;	se8r01-receive-car.c: 280: PC_ODR &= ~(1 << CE);
      00836C AE 50 0A         [ 2]  763 	ldw	x, #0x500a
      00836F F6               [ 1]  764 	ld	a, (x)
      008370 A4 EF            [ 1]  765 	and	a, #0xef
      008372 F7               [ 1]  766 	ld	(x), a
                                    767 ;	se8r01-receive-car.c: 282: PC_ODR |= (1 << CSN);
      008373 AE 50 0A         [ 2]  768 	ldw	x, #0x500a
      008376 F6               [ 1]  769 	ld	a, (x)
      008377 AA 08            [ 1]  770 	or	a, #0x08
      008379 F7               [ 1]  771 	ld	(x), a
      00837A 81               [ 4]  772 	ret
                                    773 ;	se8r01-receive-car.c: 288: void rf_switch_bank(unsigned char bankindex)
                                    774 ;	-----------------------------------------
                                    775 ;	 function rf_switch_bank
                                    776 ;	-----------------------------------------
      00837B                        777 _rf_switch_bank:
      00837B 88               [ 1]  778 	push	a
                                    779 ;	se8r01-receive-car.c: 291: temp1 = bankindex;
      00837C 7B 04            [ 1]  780 	ld	a, (0x04, sp)
      00837E 6B 01            [ 1]  781 	ld	(0x01, sp), a
                                    782 ;	se8r01-receive-car.c: 293: temp0 = write_spi(iRF_BANK0_STATUS);
      008380 4B 07            [ 1]  783 	push	#0x07
      008382 CD 80 A8         [ 4]  784 	call	_write_spi
      008385 5B 01            [ 2]  785 	addw	sp, #1
                                    786 ;	se8r01-receive-car.c: 295: if((temp0&0x80)!=temp1)
      008387 A4 80            [ 1]  787 	and	a, #0x80
      008389 11 01            [ 1]  788 	cp	a, (0x01, sp)
      00838B 27 09            [ 1]  789 	jreq	00103$
                                    790 ;	se8r01-receive-car.c: 297: write_spi_reg(iRF_CMD_ACTIVATE,0x53);
      00838D 4B 53            [ 1]  791 	push	#0x53
      00838F 4B 50            [ 1]  792 	push	#0x50
      008391 CD 80 CE         [ 4]  793 	call	_write_spi_reg
      008394 5B 02            [ 2]  794 	addw	sp, #2
      008396                        795 00103$:
      008396 84               [ 1]  796 	pop	a
      008397 81               [ 4]  797 	ret
                                    798 ;	se8r01-receive-car.c: 304: void SE8R01_Calibration()
                                    799 ;	-----------------------------------------
                                    800 ;	 function SE8R01_Calibration
                                    801 ;	-----------------------------------------
      008398                        802 _SE8R01_Calibration:
      008398 52 0D            [ 2]  803 	sub	sp, #13
                                    804 ;	se8r01-receive-car.c: 307: rf_switch_bank(iBANK0);
      00839A 4B 00            [ 1]  805 	push	#0x00
      00839C CD 83 7B         [ 4]  806 	call	_rf_switch_bank
      00839F 84               [ 1]  807 	pop	a
                                    808 ;	se8r01-receive-car.c: 308: temp[0]=0x03;
      0083A0 96               [ 1]  809 	ldw	x, sp
      0083A1 5C               [ 2]  810 	incw	x
      0083A2 1F 0C            [ 2]  811 	ldw	(0x0c, sp), x
      0083A4 1E 0C            [ 2]  812 	ldw	x, (0x0c, sp)
      0083A6 A6 03            [ 1]  813 	ld	a, #0x03
      0083A8 F7               [ 1]  814 	ld	(x), a
                                    815 ;	se8r01-receive-car.c: 309: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_CONFIG,temp, 1);
      0083A9 1E 0C            [ 2]  816 	ldw	x, (0x0c, sp)
      0083AB 4B 01            [ 1]  817 	push	#0x01
      0083AD 89               [ 2]  818 	pushw	x
      0083AE 4B 20            [ 1]  819 	push	#0x20
      0083B0 CD 81 48         [ 4]  820 	call	_write_spi_buf
      0083B3 5B 04            [ 2]  821 	addw	sp, #4
                                    822 ;	se8r01-receive-car.c: 311: temp[0]=0x32;
      0083B5 1E 0C            [ 2]  823 	ldw	x, (0x0c, sp)
      0083B7 A6 32            [ 1]  824 	ld	a, #0x32
      0083B9 F7               [ 1]  825 	ld	(x), a
                                    826 ;	se8r01-receive-car.c: 313: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_CH, temp,1);
      0083BA 1E 0C            [ 2]  827 	ldw	x, (0x0c, sp)
      0083BC 4B 01            [ 1]  828 	push	#0x01
      0083BE 89               [ 2]  829 	pushw	x
      0083BF 4B 25            [ 1]  830 	push	#0x25
      0083C1 CD 81 48         [ 4]  831 	call	_write_spi_buf
      0083C4 5B 04            [ 2]  832 	addw	sp, #4
                                    833 ;	se8r01-receive-car.c: 317: if (SE8R01_DR_2M==1)
      0083C6 CE 00 10         [ 2]  834 	ldw	x, _SE8R01_DR_2M+0
      0083C9 A3 00 01         [ 2]  835 	cpw	x, #0x0001
      0083CC 26 07            [ 1]  836 	jrne	00105$
                                    837 ;	se8r01-receive-car.c: 318: {temp[0]=0x48;}
      0083CE 1E 0C            [ 2]  838 	ldw	x, (0x0c, sp)
      0083D0 A6 48            [ 1]  839 	ld	a, #0x48
      0083D2 F7               [ 1]  840 	ld	(x), a
      0083D3 20 14            [ 2]  841 	jra	00106$
      0083D5                        842 00105$:
                                    843 ;	se8r01-receive-car.c: 319: else if (SE8R01_DR_1M==1)
      0083D5 CE 00 12         [ 2]  844 	ldw	x, _SE8R01_DR_1M+0
      0083D8 A3 00 01         [ 2]  845 	cpw	x, #0x0001
      0083DB 26 07            [ 1]  846 	jrne	00102$
                                    847 ;	se8r01-receive-car.c: 320: {temp[0]=0x40;}
      0083DD 1E 0C            [ 2]  848 	ldw	x, (0x0c, sp)
      0083DF A6 40            [ 1]  849 	ld	a, #0x40
      0083E1 F7               [ 1]  850 	ld	(x), a
      0083E2 20 05            [ 2]  851 	jra	00106$
      0083E4                        852 00102$:
                                    853 ;	se8r01-receive-car.c: 322: {temp[0]=0x68;}   
      0083E4 1E 0C            [ 2]  854 	ldw	x, (0x0c, sp)
      0083E6 A6 68            [ 1]  855 	ld	a, #0x68
      0083E8 F7               [ 1]  856 	ld	(x), a
      0083E9                        857 00106$:
                                    858 ;	se8r01-receive-car.c: 324: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
      0083E9 1E 0C            [ 2]  859 	ldw	x, (0x0c, sp)
      0083EB 4B 01            [ 1]  860 	push	#0x01
      0083ED 89               [ 2]  861 	pushw	x
      0083EE 4B 26            [ 1]  862 	push	#0x26
      0083F0 CD 81 48         [ 4]  863 	call	_write_spi_buf
      0083F3 5B 04            [ 2]  864 	addw	sp, #4
                                    865 ;	se8r01-receive-car.c: 325: temp[0]=0x77;
      0083F5 1E 0C            [ 2]  866 	ldw	x, (0x0c, sp)
      0083F7 A6 77            [ 1]  867 	ld	a, #0x77
      0083F9 F7               [ 1]  868 	ld	(x), a
                                    869 ;	se8r01-receive-car.c: 326: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_PRE_GURD, temp,1);
      0083FA 1E 0C            [ 2]  870 	ldw	x, (0x0c, sp)
      0083FC 4B 01            [ 1]  871 	push	#0x01
      0083FE 89               [ 2]  872 	pushw	x
      0083FF 4B 3F            [ 1]  873 	push	#0x3f
      008401 CD 81 48         [ 4]  874 	call	_write_spi_buf
      008404 5B 04            [ 2]  875 	addw	sp, #4
                                    876 ;	se8r01-receive-car.c: 328: rf_switch_bank(iBANK1);
      008406 4B 80            [ 1]  877 	push	#0x80
      008408 CD 83 7B         [ 4]  878 	call	_rf_switch_bank
      00840B 84               [ 1]  879 	pop	a
                                    880 ;	se8r01-receive-car.c: 329: temp[0]=0x40;
      00840C 1E 0C            [ 2]  881 	ldw	x, (0x0c, sp)
      00840E A6 40            [ 1]  882 	ld	a, #0x40
      008410 F7               [ 1]  883 	ld	(x), a
                                    884 ;	se8r01-receive-car.c: 330: temp[1]=0x00;
      008411 1E 0C            [ 2]  885 	ldw	x, (0x0c, sp)
      008413 5C               [ 2]  886 	incw	x
      008414 1F 0A            [ 2]  887 	ldw	(0x0a, sp), x
      008416 1E 0A            [ 2]  888 	ldw	x, (0x0a, sp)
      008418 7F               [ 1]  889 	clr	(x)
                                    890 ;	se8r01-receive-car.c: 331: temp[2]=0x10;
      008419 1E 0C            [ 2]  891 	ldw	x, (0x0c, sp)
      00841B 5C               [ 2]  892 	incw	x
      00841C 5C               [ 2]  893 	incw	x
      00841D 1F 06            [ 2]  894 	ldw	(0x06, sp), x
      00841F 1E 06            [ 2]  895 	ldw	x, (0x06, sp)
      008421 A6 10            [ 1]  896 	ld	a, #0x10
      008423 F7               [ 1]  897 	ld	(x), a
                                    898 ;	se8r01-receive-car.c: 333: {temp[3]=0xE6;}
      008424 1E 0C            [ 2]  899 	ldw	x, (0x0c, sp)
      008426 1C 00 03         [ 2]  900 	addw	x, #0x0003
      008429 1F 08            [ 2]  901 	ldw	(0x08, sp), x
                                    902 ;	se8r01-receive-car.c: 332: if (SE8R01_DR_2M==1)
      00842B CE 00 10         [ 2]  903 	ldw	x, _SE8R01_DR_2M+0
      00842E A3 00 01         [ 2]  904 	cpw	x, #0x0001
      008431 26 07            [ 1]  905 	jrne	00108$
                                    906 ;	se8r01-receive-car.c: 333: {temp[3]=0xE6;}
      008433 1E 08            [ 2]  907 	ldw	x, (0x08, sp)
      008435 A6 E6            [ 1]  908 	ld	a, #0xe6
      008437 F7               [ 1]  909 	ld	(x), a
      008438 20 05            [ 2]  910 	jra	00109$
      00843A                        911 00108$:
                                    912 ;	se8r01-receive-car.c: 335: {temp[3]=0xE4;}
      00843A 1E 08            [ 2]  913 	ldw	x, (0x08, sp)
      00843C A6 E4            [ 1]  914 	ld	a, #0xe4
      00843E F7               [ 1]  915 	ld	(x), a
      00843F                        916 00109$:
                                    917 ;	se8r01-receive-car.c: 337: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp, 4);
      00843F 1E 0C            [ 2]  918 	ldw	x, (0x0c, sp)
      008441 4B 04            [ 1]  919 	push	#0x04
      008443 89               [ 2]  920 	pushw	x
      008444 4B 21            [ 1]  921 	push	#0x21
      008446 CD 81 48         [ 4]  922 	call	_write_spi_buf
      008449 5B 04            [ 2]  923 	addw	sp, #4
                                    924 ;	se8r01-receive-car.c: 339: temp[0]=0x20;
      00844B 1E 0C            [ 2]  925 	ldw	x, (0x0c, sp)
      00844D A6 20            [ 1]  926 	ld	a, #0x20
      00844F F7               [ 1]  927 	ld	(x), a
                                    928 ;	se8r01-receive-car.c: 340: temp[1]=0x08;
      008450 1E 0A            [ 2]  929 	ldw	x, (0x0a, sp)
      008452 A6 08            [ 1]  930 	ld	a, #0x08
      008454 F7               [ 1]  931 	ld	(x), a
                                    932 ;	se8r01-receive-car.c: 341: temp[2]=0x50;
      008455 1E 06            [ 2]  933 	ldw	x, (0x06, sp)
      008457 A6 50            [ 1]  934 	ld	a, #0x50
      008459 F7               [ 1]  935 	ld	(x), a
                                    936 ;	se8r01-receive-car.c: 342: temp[3]=0x40;
      00845A 1E 08            [ 2]  937 	ldw	x, (0x08, sp)
      00845C A6 40            [ 1]  938 	ld	a, #0x40
      00845E F7               [ 1]  939 	ld	(x), a
                                    940 ;	se8r01-receive-car.c: 343: temp[4]=0x50;
      00845F 1E 0C            [ 2]  941 	ldw	x, (0x0c, sp)
      008461 A6 50            [ 1]  942 	ld	a, #0x50
      008463 E7 04            [ 1]  943 	ld	(0x0004, x), a
                                    944 ;	se8r01-receive-car.c: 344: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp, 5);
      008465 1E 0C            [ 2]  945 	ldw	x, (0x0c, sp)
      008467 4B 05            [ 1]  946 	push	#0x05
      008469 89               [ 2]  947 	pushw	x
      00846A 4B 23            [ 1]  948 	push	#0x23
      00846C CD 81 48         [ 4]  949 	call	_write_spi_buf
      00846F 5B 04            [ 2]  950 	addw	sp, #4
                                    951 ;	se8r01-receive-car.c: 346: temp[0]=0x00;
      008471 1E 0C            [ 2]  952 	ldw	x, (0x0c, sp)
      008473 7F               [ 1]  953 	clr	(x)
                                    954 ;	se8r01-receive-car.c: 347: temp[1]=0x00;
      008474 1E 0A            [ 2]  955 	ldw	x, (0x0a, sp)
      008476 7F               [ 1]  956 	clr	(x)
                                    957 ;	se8r01-receive-car.c: 348: if (SE8R01_DR_2M==1)
      008477 CE 00 10         [ 2]  958 	ldw	x, _SE8R01_DR_2M+0
      00847A A3 00 01         [ 2]  959 	cpw	x, #0x0001
      00847D 26 07            [ 1]  960 	jrne	00111$
                                    961 ;	se8r01-receive-car.c: 349: { temp[2]=0x1E;}
      00847F 1E 06            [ 2]  962 	ldw	x, (0x06, sp)
      008481 A6 1E            [ 1]  963 	ld	a, #0x1e
      008483 F7               [ 1]  964 	ld	(x), a
      008484 20 05            [ 2]  965 	jra	00112$
      008486                        966 00111$:
                                    967 ;	se8r01-receive-car.c: 351: { temp[2]=0x1F;}
      008486 1E 06            [ 2]  968 	ldw	x, (0x06, sp)
      008488 A6 1F            [ 1]  969 	ld	a, #0x1f
      00848A F7               [ 1]  970 	ld	(x), a
      00848B                        971 00112$:
                                    972 ;	se8r01-receive-car.c: 353: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_IF_FREQ, temp, 3);
      00848B 1E 0C            [ 2]  973 	ldw	x, (0x0c, sp)
      00848D 4B 03            [ 1]  974 	push	#0x03
      00848F 89               [ 2]  975 	pushw	x
      008490 4B 2A            [ 1]  976 	push	#0x2a
      008492 CD 81 48         [ 4]  977 	call	_write_spi_buf
      008495 5B 04            [ 2]  978 	addw	sp, #4
                                    979 ;	se8r01-receive-car.c: 355: if (SE8R01_DR_2M==1)
      008497 CE 00 10         [ 2]  980 	ldw	x, _SE8R01_DR_2M+0
      00849A A3 00 01         [ 2]  981 	cpw	x, #0x0001
      00849D 26 07            [ 1]  982 	jrne	00114$
                                    983 ;	se8r01-receive-car.c: 356: { temp[0]=0x29;}
      00849F 1E 0C            [ 2]  984 	ldw	x, (0x0c, sp)
      0084A1 A6 29            [ 1]  985 	ld	a, #0x29
      0084A3 F7               [ 1]  986 	ld	(x), a
      0084A4 20 05            [ 2]  987 	jra	00115$
      0084A6                        988 00114$:
                                    989 ;	se8r01-receive-car.c: 358: { temp[0]=0x14;}
      0084A6 1E 0C            [ 2]  990 	ldw	x, (0x0c, sp)
      0084A8 A6 14            [ 1]  991 	ld	a, #0x14
      0084AA F7               [ 1]  992 	ld	(x), a
      0084AB                        993 00115$:
                                    994 ;	se8r01-receive-car.c: 360: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp, 1);
      0084AB 1E 0C            [ 2]  995 	ldw	x, (0x0c, sp)
      0084AD 4B 01            [ 1]  996 	push	#0x01
      0084AF 89               [ 2]  997 	pushw	x
      0084B0 4B 2C            [ 1]  998 	push	#0x2c
      0084B2 CD 81 48         [ 4]  999 	call	_write_spi_buf
      0084B5 5B 04            [ 2] 1000 	addw	sp, #4
                                   1001 ;	se8r01-receive-car.c: 362: temp[0]=0x00;
      0084B7 1E 0C            [ 2] 1002 	ldw	x, (0x0c, sp)
      0084B9 7F               [ 1] 1003 	clr	(x)
                                   1004 ;	se8r01-receive-car.c: 363: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_LOW,temp,1);
      0084BA 1E 0C            [ 2] 1005 	ldw	x, (0x0c, sp)
      0084BC 4B 01            [ 1] 1006 	push	#0x01
      0084BE 89               [ 2] 1007 	pushw	x
      0084BF 4B 37            [ 1] 1008 	push	#0x37
      0084C1 CD 81 48         [ 4] 1009 	call	_write_spi_buf
      0084C4 5B 04            [ 2] 1010 	addw	sp, #4
                                   1011 ;	se8r01-receive-car.c: 365: temp[0]=0x7F;
      0084C6 1E 0C            [ 2] 1012 	ldw	x, (0x0c, sp)
      0084C8 A6 7F            [ 1] 1013 	ld	a, #0x7f
      0084CA F7               [ 1] 1014 	ld	(x), a
                                   1015 ;	se8r01-receive-car.c: 366: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_DAC_CAL_HI,temp,1);
      0084CB 1E 0C            [ 2] 1016 	ldw	x, (0x0c, sp)
      0084CD 4B 01            [ 1] 1017 	push	#0x01
      0084CF 89               [ 2] 1018 	pushw	x
      0084D0 4B 38            [ 1] 1019 	push	#0x38
      0084D2 CD 81 48         [ 4] 1020 	call	_write_spi_buf
      0084D5 5B 04            [ 2] 1021 	addw	sp, #4
                                   1022 ;	se8r01-receive-car.c: 368: temp[0]=0x02;
      0084D7 1E 0C            [ 2] 1023 	ldw	x, (0x0c, sp)
      0084D9 A6 02            [ 1] 1024 	ld	a, #0x02
      0084DB F7               [ 1] 1025 	ld	(x), a
                                   1026 ;	se8r01-receive-car.c: 369: temp[1]=0xC1;
      0084DC 1E 0A            [ 2] 1027 	ldw	x, (0x0a, sp)
      0084DE A6 C1            [ 1] 1028 	ld	a, #0xc1
      0084E0 F7               [ 1] 1029 	ld	(x), a
                                   1030 ;	se8r01-receive-car.c: 370: temp[2]=0xEB;            
      0084E1 1E 06            [ 2] 1031 	ldw	x, (0x06, sp)
      0084E3 A6 EB            [ 1] 1032 	ld	a, #0xeb
      0084E5 F7               [ 1] 1033 	ld	(x), a
                                   1034 ;	se8r01-receive-car.c: 371: temp[3]=0x1C;
      0084E6 1E 08            [ 2] 1035 	ldw	x, (0x08, sp)
      0084E8 A6 1C            [ 1] 1036 	ld	a, #0x1c
      0084EA F7               [ 1] 1037 	ld	(x), a
                                   1038 ;	se8r01-receive-car.c: 372: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
      0084EB 1E 0C            [ 2] 1039 	ldw	x, (0x0c, sp)
      0084ED 4B 04            [ 1] 1040 	push	#0x04
      0084EF 89               [ 2] 1041 	pushw	x
      0084F0 4B 3D            [ 1] 1042 	push	#0x3d
      0084F2 CD 81 48         [ 4] 1043 	call	_write_spi_buf
      0084F5 5B 04            [ 2] 1044 	addw	sp, #4
                                   1045 ;	se8r01-receive-car.c: 374: temp[0]=0x97;
      0084F7 1E 0C            [ 2] 1046 	ldw	x, (0x0c, sp)
      0084F9 A6 97            [ 1] 1047 	ld	a, #0x97
      0084FB F7               [ 1] 1048 	ld	(x), a
                                   1049 ;	se8r01-receive-car.c: 375: temp[1]=0x64;
      0084FC 1E 0A            [ 2] 1050 	ldw	x, (0x0a, sp)
      0084FE A6 64            [ 1] 1051 	ld	a, #0x64
      008500 F7               [ 1] 1052 	ld	(x), a
                                   1053 ;	se8r01-receive-car.c: 376: temp[2]=0x00;
      008501 1E 06            [ 2] 1054 	ldw	x, (0x06, sp)
      008503 7F               [ 1] 1055 	clr	(x)
                                   1056 ;	se8r01-receive-car.c: 377: temp[3]=0x81;
      008504 1E 08            [ 2] 1057 	ldw	x, (0x08, sp)
      008506 A6 81            [ 1] 1058 	ld	a, #0x81
      008508 F7               [ 1] 1059 	ld	(x), a
                                   1060 ;	se8r01-receive-car.c: 378: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp, 4);
      008509 1E 0C            [ 2] 1061 	ldw	x, (0x0c, sp)
      00850B 4B 04            [ 1] 1062 	push	#0x04
      00850D 89               [ 2] 1063 	pushw	x
      00850E 4B 3E            [ 1] 1064 	push	#0x3e
      008510 CD 81 48         [ 4] 1065 	call	_write_spi_buf
      008513 5B 04            [ 2] 1066 	addw	sp, #4
                                   1067 ;	se8r01-receive-car.c: 379: rf_switch_bank(iBANK0);
      008515 4B 00            [ 1] 1068 	push	#0x00
      008517 CD 83 7B         [ 4] 1069 	call	_rf_switch_bank
      00851A 84               [ 1] 1070 	pop	a
                                   1071 ;	se8r01-receive-car.c: 384: delayTenMicro();
      00851B CD 80 A0         [ 4] 1072 	call	_delayTenMicro
                                   1073 ;	se8r01-receive-car.c: 385: PC_ODR |= (1 << CE);
      00851E AE 50 0A         [ 2] 1074 	ldw	x, #0x500a
      008521 F6               [ 1] 1075 	ld	a, (x)
      008522 AA 10            [ 1] 1076 	or	a, #0x10
      008524 F7               [ 1] 1077 	ld	(x), a
                                   1078 ;	se8r01-receive-car.c: 386: delayTenMicro();
      008525 CD 80 A0         [ 4] 1079 	call	_delayTenMicro
                                   1080 ;	se8r01-receive-car.c: 387: delayTenMicro();
      008528 CD 80 A0         [ 4] 1081 	call	_delayTenMicro
                                   1082 ;	se8r01-receive-car.c: 388: delayTenMicro();
      00852B CD 80 A0         [ 4] 1083 	call	_delayTenMicro
                                   1084 ;	se8r01-receive-car.c: 389: PC_ODR &= ~(1 << CE);
      00852E AE 50 0A         [ 2] 1085 	ldw	x, #0x500a
      008531 F6               [ 1] 1086 	ld	a, (x)
      008532 A4 EF            [ 1] 1087 	and	a, #0xef
      008534 F7               [ 1] 1088 	ld	(x), a
                                   1089 ;	se8r01-receive-car.c: 390: delay(50);                            // delay 50ms waitting for calibaration.
      008535 4B 32            [ 1] 1090 	push	#0x32
      008537 4B 00            [ 1] 1091 	push	#0x00
      008539 CD 82 2E         [ 4] 1092 	call	_delay
      00853C 5B 02            [ 2] 1093 	addw	sp, #2
                                   1094 ;	se8r01-receive-car.c: 395: delayTenMicro();
      00853E CD 80 A0         [ 4] 1095 	call	_delayTenMicro
                                   1096 ;	se8r01-receive-car.c: 396: PC_ODR |= (1 << CE);
      008541 AE 50 0A         [ 2] 1097 	ldw	x, #0x500a
      008544 F6               [ 1] 1098 	ld	a, (x)
      008545 AA 10            [ 1] 1099 	or	a, #0x10
      008547 F7               [ 1] 1100 	ld	(x), a
                                   1101 ;	se8r01-receive-car.c: 397: delayTenMicro();
      008548 CD 80 A0         [ 4] 1102 	call	_delayTenMicro
                                   1103 ;	se8r01-receive-car.c: 398: delayTenMicro();
      00854B CD 80 A0         [ 4] 1104 	call	_delayTenMicro
                                   1105 ;	se8r01-receive-car.c: 399: delayTenMicro();
      00854E CD 80 A0         [ 4] 1106 	call	_delayTenMicro
                                   1107 ;	se8r01-receive-car.c: 400: PC_ODR &= ~(1 << CE);
      008551 AE 50 0A         [ 2] 1108 	ldw	x, #0x500a
      008554 F6               [ 1] 1109 	ld	a, (x)
      008555 A4 EF            [ 1] 1110 	and	a, #0xef
      008557 F7               [ 1] 1111 	ld	(x), a
                                   1112 ;	se8r01-receive-car.c: 401: delay(50);                            // delay 50ms waitting for calibaration.
      008558 4B 32            [ 1] 1113 	push	#0x32
      00855A 4B 00            [ 1] 1114 	push	#0x00
      00855C CD 82 2E         [ 4] 1115 	call	_delay
      00855F 5B 02            [ 2] 1116 	addw	sp, #2
      008561 5B 0D            [ 2] 1117 	addw	sp, #13
      008563 81               [ 4] 1118 	ret
                                   1119 ;	se8r01-receive-car.c: 405: void SE8R01_Analog_Init()           //SE8R01 初始化
                                   1120 ;	-----------------------------------------
                                   1121 ;	 function SE8R01_Analog_Init
                                   1122 ;	-----------------------------------------
      008564                       1123 _SE8R01_Analog_Init:
      008564 52 15            [ 2] 1124 	sub	sp, #21
                                   1125 ;	se8r01-receive-car.c: 410: gtemp[0]=0x28;
      008566 AE 00 01         [ 2] 1126 	ldw	x, #_gtemp+0
      008569 1F 14            [ 2] 1127 	ldw	(0x14, sp), x
      00856B 1E 14            [ 2] 1128 	ldw	x, (0x14, sp)
      00856D A6 28            [ 1] 1129 	ld	a, #0x28
      00856F F7               [ 1] 1130 	ld	(x), a
                                   1131 ;	se8r01-receive-car.c: 411: gtemp[1]=0x32;
      008570 1E 14            [ 2] 1132 	ldw	x, (0x14, sp)
      008572 5C               [ 2] 1133 	incw	x
      008573 1F 12            [ 2] 1134 	ldw	(0x12, sp), x
      008575 1E 12            [ 2] 1135 	ldw	x, (0x12, sp)
      008577 A6 32            [ 1] 1136 	ld	a, #0x32
      008579 F7               [ 1] 1137 	ld	(x), a
                                   1138 ;	se8r01-receive-car.c: 412: gtemp[2]=0x80;
      00857A 1E 14            [ 2] 1139 	ldw	x, (0x14, sp)
      00857C 5C               [ 2] 1140 	incw	x
      00857D 5C               [ 2] 1141 	incw	x
      00857E 1F 10            [ 2] 1142 	ldw	(0x10, sp), x
      008580 1E 10            [ 2] 1143 	ldw	x, (0x10, sp)
      008582 A6 80            [ 1] 1144 	ld	a, #0x80
      008584 F7               [ 1] 1145 	ld	(x), a
                                   1146 ;	se8r01-receive-car.c: 413: gtemp[3]=0x90;
      008585 1E 14            [ 2] 1147 	ldw	x, (0x14, sp)
      008587 1C 00 03         [ 2] 1148 	addw	x, #0x0003
      00858A 1F 0E            [ 2] 1149 	ldw	(0x0e, sp), x
      00858C 1E 0E            [ 2] 1150 	ldw	x, (0x0e, sp)
      00858E A6 90            [ 1] 1151 	ld	a, #0x90
      008590 F7               [ 1] 1152 	ld	(x), a
                                   1153 ;	se8r01-receive-car.c: 414: gtemp[4]=0x00;
      008591 1E 14            [ 2] 1154 	ldw	x, (0x14, sp)
      008593 1C 00 04         [ 2] 1155 	addw	x, #0x0004
      008596 7F               [ 1] 1156 	clr	(x)
                                   1157 ;	se8r01-receive-car.c: 415: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_SETUP_VALUE, gtemp, 5);
      008597 1E 14            [ 2] 1158 	ldw	x, (0x14, sp)
      008599 4B 05            [ 1] 1159 	push	#0x05
      00859B 89               [ 2] 1160 	pushw	x
      00859C 4B 3E            [ 1] 1161 	push	#0x3e
      00859E CD 81 48         [ 4] 1162 	call	_write_spi_buf
      0085A1 5B 04            [ 2] 1163 	addw	sp, #4
                                   1164 ;	se8r01-receive-car.c: 416: delay(2);
      0085A3 4B 02            [ 1] 1165 	push	#0x02
      0085A5 4B 00            [ 1] 1166 	push	#0x00
      0085A7 CD 82 2E         [ 4] 1167 	call	_delay
      0085AA 5B 02            [ 2] 1168 	addw	sp, #2
                                   1169 ;	se8r01-receive-car.c: 419: rf_switch_bank(iBANK1);
      0085AC 4B 80            [ 1] 1170 	push	#0x80
      0085AE CD 83 7B         [ 4] 1171 	call	_rf_switch_bank
      0085B1 84               [ 1] 1172 	pop	a
                                   1173 ;	se8r01-receive-car.c: 421: temp[0]=0x40;
      0085B2 96               [ 1] 1174 	ldw	x, sp
      0085B3 5C               [ 2] 1175 	incw	x
      0085B4 1F 0C            [ 2] 1176 	ldw	(0x0c, sp), x
      0085B6 1E 0C            [ 2] 1177 	ldw	x, (0x0c, sp)
      0085B8 A6 40            [ 1] 1178 	ld	a, #0x40
      0085BA F7               [ 1] 1179 	ld	(x), a
                                   1180 ;	se8r01-receive-car.c: 422: temp[1]=0x01;               
      0085BB 1E 0C            [ 2] 1181 	ldw	x, (0x0c, sp)
      0085BD 5C               [ 2] 1182 	incw	x
      0085BE 1F 0A            [ 2] 1183 	ldw	(0x0a, sp), x
      0085C0 1E 0A            [ 2] 1184 	ldw	x, (0x0a, sp)
      0085C2 A6 01            [ 1] 1185 	ld	a, #0x01
      0085C4 F7               [ 1] 1186 	ld	(x), a
                                   1187 ;	se8r01-receive-car.c: 423: temp[2]=0x30;               
      0085C5 1E 0C            [ 2] 1188 	ldw	x, (0x0c, sp)
      0085C7 5C               [ 2] 1189 	incw	x
      0085C8 5C               [ 2] 1190 	incw	x
      0085C9 1F 08            [ 2] 1191 	ldw	(0x08, sp), x
      0085CB 1E 08            [ 2] 1192 	ldw	x, (0x08, sp)
      0085CD A6 30            [ 1] 1193 	ld	a, #0x30
      0085CF F7               [ 1] 1194 	ld	(x), a
                                   1195 ;	se8r01-receive-car.c: 425: { temp[3]=0xE2; }              
      0085D0 1E 0C            [ 2] 1196 	ldw	x, (0x0c, sp)
      0085D2 1C 00 03         [ 2] 1197 	addw	x, #0x0003
      0085D5 1F 06            [ 2] 1198 	ldw	(0x06, sp), x
                                   1199 ;	se8r01-receive-car.c: 424: if (SE8R01_DR_2M==1)
      0085D7 CE 00 10         [ 2] 1200 	ldw	x, _SE8R01_DR_2M+0
      0085DA A3 00 01         [ 2] 1201 	cpw	x, #0x0001
      0085DD 26 07            [ 1] 1202 	jrne	00102$
                                   1203 ;	se8r01-receive-car.c: 425: { temp[3]=0xE2; }              
      0085DF 1E 06            [ 2] 1204 	ldw	x, (0x06, sp)
      0085E1 A6 E2            [ 1] 1205 	ld	a, #0xe2
      0085E3 F7               [ 1] 1206 	ld	(x), a
      0085E4 20 05            [ 2] 1207 	jra	00103$
      0085E6                       1208 00102$:
                                   1209 ;	se8r01-receive-car.c: 427: { temp[3]=0xE0;}
      0085E6 1E 06            [ 2] 1210 	ldw	x, (0x06, sp)
      0085E8 A6 E0            [ 1] 1211 	ld	a, #0xe0
      0085EA F7               [ 1] 1212 	ld	(x), a
      0085EB                       1213 00103$:
                                   1214 ;	se8r01-receive-car.c: 429: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_PLL_CTL0, temp,4);
      0085EB 1E 0C            [ 2] 1215 	ldw	x, (0x0c, sp)
      0085ED 4B 04            [ 1] 1216 	push	#0x04
      0085EF 89               [ 2] 1217 	pushw	x
      0085F0 4B 21            [ 1] 1218 	push	#0x21
      0085F2 CD 81 48         [ 4] 1219 	call	_write_spi_buf
      0085F5 5B 04            [ 2] 1220 	addw	sp, #4
                                   1221 ;	se8r01-receive-car.c: 431: temp[0]=0x29;
      0085F7 1E 0C            [ 2] 1222 	ldw	x, (0x0c, sp)
      0085F9 A6 29            [ 1] 1223 	ld	a, #0x29
      0085FB F7               [ 1] 1224 	ld	(x), a
                                   1225 ;	se8r01-receive-car.c: 432: temp[1]=0x89;
      0085FC 1E 0A            [ 2] 1226 	ldw	x, (0x0a, sp)
      0085FE A6 89            [ 1] 1227 	ld	a, #0x89
      008600 F7               [ 1] 1228 	ld	(x), a
                                   1229 ;	se8r01-receive-car.c: 433: temp[2]=0x55;                     
      008601 1E 08            [ 2] 1230 	ldw	x, (0x08, sp)
      008603 A6 55            [ 1] 1231 	ld	a, #0x55
      008605 F7               [ 1] 1232 	ld	(x), a
                                   1233 ;	se8r01-receive-car.c: 434: temp[3]=0x40;
      008606 1E 06            [ 2] 1234 	ldw	x, (0x06, sp)
      008608 A6 40            [ 1] 1235 	ld	a, #0x40
      00860A F7               [ 1] 1236 	ld	(x), a
                                   1237 ;	se8r01-receive-car.c: 435: temp[4]=0x50;
      00860B 1E 0C            [ 2] 1238 	ldw	x, (0x0c, sp)
      00860D A6 50            [ 1] 1239 	ld	a, #0x50
      00860F E7 04            [ 1] 1240 	ld	(0x0004, x), a
                                   1241 ;	se8r01-receive-car.c: 436: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_CAL_CTL, temp,5);
      008611 1E 0C            [ 2] 1242 	ldw	x, (0x0c, sp)
      008613 4B 05            [ 1] 1243 	push	#0x05
      008615 89               [ 2] 1244 	pushw	x
      008616 4B 23            [ 1] 1245 	push	#0x23
      008618 CD 81 48         [ 4] 1246 	call	_write_spi_buf
      00861B 5B 04            [ 2] 1247 	addw	sp, #4
                                   1248 ;	se8r01-receive-car.c: 438: if (SE8R01_DR_2M==1)
      00861D CE 00 10         [ 2] 1249 	ldw	x, _SE8R01_DR_2M+0
      008620 A3 00 01         [ 2] 1250 	cpw	x, #0x0001
      008623 26 07            [ 1] 1251 	jrne	00105$
                                   1252 ;	se8r01-receive-car.c: 439: { temp[0]=0x29;}
      008625 1E 0C            [ 2] 1253 	ldw	x, (0x0c, sp)
      008627 A6 29            [ 1] 1254 	ld	a, #0x29
      008629 F7               [ 1] 1255 	ld	(x), a
      00862A 20 05            [ 2] 1256 	jra	00106$
      00862C                       1257 00105$:
                                   1258 ;	se8r01-receive-car.c: 441: { temp[0]=0x14;}
      00862C 1E 0C            [ 2] 1259 	ldw	x, (0x0c, sp)
      00862E A6 14            [ 1] 1260 	ld	a, #0x14
      008630 F7               [ 1] 1261 	ld	(x), a
      008631                       1262 00106$:
                                   1263 ;	se8r01-receive-car.c: 443: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FDEV, temp,1);
      008631 1E 0C            [ 2] 1264 	ldw	x, (0x0c, sp)
      008633 4B 01            [ 1] 1265 	push	#0x01
      008635 89               [ 2] 1266 	pushw	x
      008636 4B 2C            [ 1] 1267 	push	#0x2c
      008638 CD 81 48         [ 4] 1268 	call	_write_spi_buf
      00863B 5B 04            [ 2] 1269 	addw	sp, #4
                                   1270 ;	se8r01-receive-car.c: 445: temp[0]=0x55;
      00863D 1E 0C            [ 2] 1271 	ldw	x, (0x0c, sp)
      00863F A6 55            [ 1] 1272 	ld	a, #0x55
      008641 F7               [ 1] 1273 	ld	(x), a
                                   1274 ;	se8r01-receive-car.c: 446: temp[1]=0xC2;
      008642 1E 0A            [ 2] 1275 	ldw	x, (0x0a, sp)
      008644 A6 C2            [ 1] 1276 	ld	a, #0xc2
      008646 F7               [ 1] 1277 	ld	(x), a
                                   1278 ;	se8r01-receive-car.c: 447: temp[2]=0x09;
      008647 1E 08            [ 2] 1279 	ldw	x, (0x08, sp)
      008649 A6 09            [ 1] 1280 	ld	a, #0x09
      00864B F7               [ 1] 1281 	ld	(x), a
                                   1282 ;	se8r01-receive-car.c: 448: temp[3]=0xAC;  
      00864C 1E 06            [ 2] 1283 	ldw	x, (0x06, sp)
      00864E A6 AC            [ 1] 1284 	ld	a, #0xac
      008650 F7               [ 1] 1285 	ld	(x), a
                                   1286 ;	se8r01-receive-car.c: 449: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RX_CTRL,temp,4);
      008651 1E 0C            [ 2] 1287 	ldw	x, (0x0c, sp)
      008653 4B 04            [ 1] 1288 	push	#0x04
      008655 89               [ 2] 1289 	pushw	x
      008656 4B 31            [ 1] 1290 	push	#0x31
      008658 CD 81 48         [ 4] 1291 	call	_write_spi_buf
      00865B 5B 04            [ 2] 1292 	addw	sp, #4
                                   1293 ;	se8r01-receive-car.c: 451: temp[0]=0x00;
      00865D 1E 0C            [ 2] 1294 	ldw	x, (0x0c, sp)
      00865F 7F               [ 1] 1295 	clr	(x)
                                   1296 ;	se8r01-receive-car.c: 452: temp[1]=0x14;
      008660 1E 0A            [ 2] 1297 	ldw	x, (0x0a, sp)
      008662 A6 14            [ 1] 1298 	ld	a, #0x14
      008664 F7               [ 1] 1299 	ld	(x), a
                                   1300 ;	se8r01-receive-car.c: 453: temp[2]=0x08;   
      008665 1E 08            [ 2] 1301 	ldw	x, (0x08, sp)
      008667 A6 08            [ 1] 1302 	ld	a, #0x08
      008669 F7               [ 1] 1303 	ld	(x), a
                                   1304 ;	se8r01-receive-car.c: 454: temp[3]=0x29;
      00866A 1E 06            [ 2] 1305 	ldw	x, (0x06, sp)
      00866C A6 29            [ 1] 1306 	ld	a, #0x29
      00866E F7               [ 1] 1307 	ld	(x), a
                                   1308 ;	se8r01-receive-car.c: 455: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_FAGC_CTRL_1, temp,4);
      00866F 1E 0C            [ 2] 1309 	ldw	x, (0x0c, sp)
      008671 4B 04            [ 1] 1310 	push	#0x04
      008673 89               [ 2] 1311 	pushw	x
      008674 4B 33            [ 1] 1312 	push	#0x33
      008676 CD 81 48         [ 4] 1313 	call	_write_spi_buf
      008679 5B 04            [ 2] 1314 	addw	sp, #4
                                   1315 ;	se8r01-receive-car.c: 457: temp[0]=0x02;
      00867B 1E 0C            [ 2] 1316 	ldw	x, (0x0c, sp)
      00867D A6 02            [ 1] 1317 	ld	a, #0x02
      00867F F7               [ 1] 1318 	ld	(x), a
                                   1319 ;	se8r01-receive-car.c: 458: temp[1]=0xC1;
      008680 1E 0A            [ 2] 1320 	ldw	x, (0x0a, sp)
      008682 A6 C1            [ 1] 1321 	ld	a, #0xc1
      008684 F7               [ 1] 1322 	ld	(x), a
                                   1323 ;	se8r01-receive-car.c: 459: temp[2]=0xCB;  
      008685 1E 08            [ 2] 1324 	ldw	x, (0x08, sp)
      008687 A6 CB            [ 1] 1325 	ld	a, #0xcb
      008689 F7               [ 1] 1326 	ld	(x), a
                                   1327 ;	se8r01-receive-car.c: 460: temp[3]=0x1C;
      00868A 1E 06            [ 2] 1328 	ldw	x, (0x06, sp)
      00868C A6 1C            [ 1] 1329 	ld	a, #0x1c
      00868E F7               [ 1] 1330 	ld	(x), a
                                   1331 ;	se8r01-receive-car.c: 461: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_AGC_GAIN, temp,4);
      00868F 1E 0C            [ 2] 1332 	ldw	x, (0x0c, sp)
      008691 4B 04            [ 1] 1333 	push	#0x04
      008693 89               [ 2] 1334 	pushw	x
      008694 4B 3D            [ 1] 1335 	push	#0x3d
      008696 CD 81 48         [ 4] 1336 	call	_write_spi_buf
      008699 5B 04            [ 2] 1337 	addw	sp, #4
                                   1338 ;	se8r01-receive-car.c: 463: temp[0]=0x97;
      00869B 1E 0C            [ 2] 1339 	ldw	x, (0x0c, sp)
      00869D A6 97            [ 1] 1340 	ld	a, #0x97
      00869F F7               [ 1] 1341 	ld	(x), a
                                   1342 ;	se8r01-receive-car.c: 464: temp[1]=0x64;
      0086A0 1E 0A            [ 2] 1343 	ldw	x, (0x0a, sp)
      0086A2 A6 64            [ 1] 1344 	ld	a, #0x64
      0086A4 F7               [ 1] 1345 	ld	(x), a
                                   1346 ;	se8r01-receive-car.c: 465: temp[2]=0x00;
      0086A5 1E 08            [ 2] 1347 	ldw	x, (0x08, sp)
      0086A7 7F               [ 1] 1348 	clr	(x)
                                   1349 ;	se8r01-receive-car.c: 466: temp[3]=0x01;
      0086A8 1E 06            [ 2] 1350 	ldw	x, (0x06, sp)
      0086AA A6 01            [ 1] 1351 	ld	a, #0x01
      0086AC F7               [ 1] 1352 	ld	(x), a
                                   1353 ;	se8r01-receive-car.c: 467: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_RF_IVGEN, temp,4);
      0086AD 1E 0C            [ 2] 1354 	ldw	x, (0x0c, sp)
      0086AF 4B 04            [ 1] 1355 	push	#0x04
      0086B1 89               [ 2] 1356 	pushw	x
      0086B2 4B 3E            [ 1] 1357 	push	#0x3e
      0086B4 CD 81 48         [ 4] 1358 	call	_write_spi_buf
      0086B7 5B 04            [ 2] 1359 	addw	sp, #4
                                   1360 ;	se8r01-receive-car.c: 469: gtemp[0]=0x2A;
      0086B9 1E 14            [ 2] 1361 	ldw	x, (0x14, sp)
      0086BB A6 2A            [ 1] 1362 	ld	a, #0x2a
      0086BD F7               [ 1] 1363 	ld	(x), a
                                   1364 ;	se8r01-receive-car.c: 470: gtemp[1]=0x04;
      0086BE 1E 12            [ 2] 1365 	ldw	x, (0x12, sp)
      0086C0 A6 04            [ 1] 1366 	ld	a, #0x04
      0086C2 F7               [ 1] 1367 	ld	(x), a
                                   1368 ;	se8r01-receive-car.c: 471: gtemp[2]=0x00;
      0086C3 1E 10            [ 2] 1369 	ldw	x, (0x10, sp)
      0086C5 7F               [ 1] 1370 	clr	(x)
                                   1371 ;	se8r01-receive-car.c: 472: gtemp[3]=0x7D;
      0086C6 1E 0E            [ 2] 1372 	ldw	x, (0x0e, sp)
      0086C8 A6 7D            [ 1] 1373 	ld	a, #0x7d
      0086CA F7               [ 1] 1374 	ld	(x), a
                                   1375 ;	se8r01-receive-car.c: 473: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK1_TEST_PKDET, gtemp, 4);
      0086CB 1E 14            [ 2] 1376 	ldw	x, (0x14, sp)
      0086CD 4B 04            [ 1] 1377 	push	#0x04
      0086CF 89               [ 2] 1378 	pushw	x
      0086D0 4B 3F            [ 1] 1379 	push	#0x3f
      0086D2 CD 81 48         [ 4] 1380 	call	_write_spi_buf
      0086D5 5B 04            [ 2] 1381 	addw	sp, #4
                                   1382 ;	se8r01-receive-car.c: 475: rf_switch_bank(iBANK0);
      0086D7 4B 00            [ 1] 1383 	push	#0x00
      0086D9 CD 83 7B         [ 4] 1384 	call	_rf_switch_bank
      0086DC 84               [ 1] 1385 	pop	a
      0086DD 5B 15            [ 2] 1386 	addw	sp, #21
      0086DF 81               [ 4] 1387 	ret
                                   1388 ;	se8r01-receive-car.c: 478: void SE8R01_Init()  
                                   1389 ;	-----------------------------------------
                                   1390 ;	 function SE8R01_Init
                                   1391 ;	-----------------------------------------
      0086E0                       1392 _SE8R01_Init:
      0086E0 52 05            [ 2] 1393 	sub	sp, #5
                                   1394 ;	se8r01-receive-car.c: 481: SE8R01_Calibration();   
      0086E2 CD 83 98         [ 4] 1395 	call	_SE8R01_Calibration
                                   1396 ;	se8r01-receive-car.c: 482: SE8R01_Analog_Init();   
      0086E5 CD 85 64         [ 4] 1397 	call	_SE8R01_Analog_Init
                                   1398 ;	se8r01-receive-car.c: 486: if (SE8R01_DR_2M==1)
      0086E8 CE 00 10         [ 2] 1399 	ldw	x, _SE8R01_DR_2M+0
      0086EB A3 00 01         [ 2] 1400 	cpw	x, #0x0001
      0086EE 26 07            [ 1] 1401 	jrne	00105$
                                   1402 ;	se8r01-receive-car.c: 487: {  temp[0]=0b01001111; }     //2MHz,+5dbm
      0086F0 96               [ 1] 1403 	ldw	x, sp
      0086F1 5C               [ 2] 1404 	incw	x
      0086F2 A6 4F            [ 1] 1405 	ld	a, #0x4f
      0086F4 F7               [ 1] 1406 	ld	(x), a
      0086F5 20 14            [ 2] 1407 	jra	00106$
      0086F7                       1408 00105$:
                                   1409 ;	se8r01-receive-car.c: 488: else if  (SE8R01_DR_1M==1)
      0086F7 CE 00 12         [ 2] 1410 	ldw	x, _SE8R01_DR_1M+0
      0086FA A3 00 01         [ 2] 1411 	cpw	x, #0x0001
      0086FD 26 07            [ 1] 1412 	jrne	00102$
                                   1413 ;	se8r01-receive-car.c: 489: {  temp[0]=0b01000111;  }     //1MHz,+5dbm
      0086FF 96               [ 1] 1414 	ldw	x, sp
      008700 5C               [ 2] 1415 	incw	x
      008701 A6 47            [ 1] 1416 	ld	a, #0x47
      008703 F7               [ 1] 1417 	ld	(x), a
      008704 20 05            [ 2] 1418 	jra	00106$
      008706                       1419 00102$:
                                   1420 ;	se8r01-receive-car.c: 491: {temp[0]=0b01101111;  }     //500K,+5dbm
      008706 96               [ 1] 1421 	ldw	x, sp
      008707 5C               [ 2] 1422 	incw	x
      008708 A6 6F            [ 1] 1423 	ld	a, #0x6f
      00870A F7               [ 1] 1424 	ld	(x), a
      00870B                       1425 00106$:
                                   1426 ;	se8r01-receive-car.c: 493: write_spi_buf(iRF_CMD_WRITE_REG|iRF_BANK0_RF_SETUP,temp,1);
      00870B 96               [ 1] 1427 	ldw	x, sp
      00870C 5C               [ 2] 1428 	incw	x
      00870D 4B 01            [ 1] 1429 	push	#0x01
      00870F 89               [ 2] 1430 	pushw	x
      008710 4B 26            [ 1] 1431 	push	#0x26
      008712 CD 81 48         [ 4] 1432 	call	_write_spi_buf
      008715 5B 04            [ 2] 1433 	addw	sp, #4
                                   1434 ;	se8r01-receive-car.c: 494: write_spi_reg(WRITE_REG|iRF_BANK0_EN_AA, 0b00111111);          //enable auto acc on pip 1
      008717 4B 3F            [ 1] 1435 	push	#0x3f
      008719 4B 21            [ 1] 1436 	push	#0x21
      00871B CD 80 CE         [ 4] 1437 	call	_write_spi_reg
      00871E 5B 02            [ 2] 1438 	addw	sp, #2
                                   1439 ;	se8r01-receive-car.c: 495: write_spi_reg(WRITE_REG|iRF_BANK0_EN_RXADDR, 0b00111111);      //enable pip 1
      008720 4B 3F            [ 1] 1440 	push	#0x3f
      008722 4B 22            [ 1] 1441 	push	#0x22
      008724 CD 80 CE         [ 4] 1442 	call	_write_spi_reg
      008727 5B 02            [ 2] 1443 	addw	sp, #2
                                   1444 ;	se8r01-receive-car.c: 496: write_spi_reg(WRITE_REG|iRF_BANK0_SETUP_AW, 0x02);  
      008729 4B 02            [ 1] 1445 	push	#0x02
      00872B 4B 23            [ 1] 1446 	push	#0x23
      00872D CD 80 CE         [ 4] 1447 	call	_write_spi_reg
      008730 5B 02            [ 2] 1448 	addw	sp, #2
                                   1449 ;	se8r01-receive-car.c: 497: write_spi_reg(WRITE_REG|iRF_BANK0_RF_CH, 40);
      008732 4B 28            [ 1] 1450 	push	#0x28
      008734 4B 25            [ 1] 1451 	push	#0x25
      008736 CD 80 CE         [ 4] 1452 	call	_write_spi_reg
      008739 5B 02            [ 2] 1453 	addw	sp, #2
                                   1454 ;	se8r01-receive-car.c: 499: write_spi_buf(WRITE_REG + TX_ADDR, ADDRESS0, ADR_WIDTH);    	
      00873B AE 00 2A         [ 2] 1455 	ldw	x, #_ADDRESS0+0
      00873E 90 93            [ 1] 1456 	ldw	y, x
      008740 89               [ 2] 1457 	pushw	x
      008741 4B 04            [ 1] 1458 	push	#0x04
      008743 90 89            [ 2] 1459 	pushw	y
      008745 4B 30            [ 1] 1460 	push	#0x30
      008747 CD 81 48         [ 4] 1461 	call	_write_spi_buf
      00874A 5B 04            [ 2] 1462 	addw	sp, #4
      00874C 85               [ 2] 1463 	popw	x
                                   1464 ;	se8r01-receive-car.c: 500: write_spi_buf(WRITE_REG + RX_ADDR_P0, ADDRESS0, ADR_WIDTH); 
      00874D 4B 04            [ 1] 1465 	push	#0x04
      00874F 89               [ 2] 1466 	pushw	x
      008750 4B 2A            [ 1] 1467 	push	#0x2a
      008752 CD 81 48         [ 4] 1468 	call	_write_spi_buf
      008755 5B 04            [ 2] 1469 	addw	sp, #4
                                   1470 ;	se8r01-receive-car.c: 501: write_spi_buf(WRITE_REG + RX_ADDR_P1, ADDRESS1, ADR_WIDTH); 
      008757 AE 00 26         [ 2] 1471 	ldw	x, #_ADDRESS1+0
      00875A 4B 04            [ 1] 1472 	push	#0x04
      00875C 89               [ 2] 1473 	pushw	x
      00875D 4B 2B            [ 1] 1474 	push	#0x2b
      00875F CD 81 48         [ 4] 1475 	call	_write_spi_buf
      008762 5B 04            [ 2] 1476 	addw	sp, #4
                                   1477 ;	se8r01-receive-car.c: 502: write_spi_buf(WRITE_REG + RX_ADDR_P2, ADDRESS2, 1); 
      008764 AE 00 22         [ 2] 1478 	ldw	x, #_ADDRESS2+0
      008767 4B 01            [ 1] 1479 	push	#0x01
      008769 89               [ 2] 1480 	pushw	x
      00876A 4B 2C            [ 1] 1481 	push	#0x2c
      00876C CD 81 48         [ 4] 1482 	call	_write_spi_buf
      00876F 5B 04            [ 2] 1483 	addw	sp, #4
                                   1484 ;	se8r01-receive-car.c: 503: write_spi_buf(WRITE_REG + RX_ADDR_P3, ADDRESS3, 1); 
      008771 AE 00 23         [ 2] 1485 	ldw	x, #_ADDRESS3+0
      008774 4B 01            [ 1] 1486 	push	#0x01
      008776 89               [ 2] 1487 	pushw	x
      008777 4B 2D            [ 1] 1488 	push	#0x2d
      008779 CD 81 48         [ 4] 1489 	call	_write_spi_buf
      00877C 5B 04            [ 2] 1490 	addw	sp, #4
                                   1491 ;	se8r01-receive-car.c: 504: write_spi_buf(WRITE_REG + RX_ADDR_P4, ADDRESS4, 1); 
      00877E AE 00 24         [ 2] 1492 	ldw	x, #_ADDRESS4+0
      008781 4B 01            [ 1] 1493 	push	#0x01
      008783 89               [ 2] 1494 	pushw	x
      008784 4B 2E            [ 1] 1495 	push	#0x2e
      008786 CD 81 48         [ 4] 1496 	call	_write_spi_buf
      008789 5B 04            [ 2] 1497 	addw	sp, #4
                                   1498 ;	se8r01-receive-car.c: 505: write_spi_buf(WRITE_REG + RX_ADDR_P5, ADDRESS5, 1); 
      00878B AE 00 25         [ 2] 1499 	ldw	x, #_ADDRESS5+0
      00878E 4B 01            [ 1] 1500 	push	#0x01
      008790 89               [ 2] 1501 	pushw	x
      008791 4B 2F            [ 1] 1502 	push	#0x2f
      008793 CD 81 48         [ 4] 1503 	call	_write_spi_buf
      008796 5B 04            [ 2] 1504 	addw	sp, #4
                                   1505 ;	se8r01-receive-car.c: 506: write_spi_reg(WRITE_REG + RX_PW_P0, PLOAD_WIDTH); 
      008798 4B 20            [ 1] 1506 	push	#0x20
      00879A 4B 31            [ 1] 1507 	push	#0x31
      00879C CD 80 CE         [ 4] 1508 	call	_write_spi_reg
      00879F 5B 02            [ 2] 1509 	addw	sp, #2
                                   1510 ;	se8r01-receive-car.c: 507: write_spi_reg(WRITE_REG|iRF_BANK0_CONFIG, 0x3f); 
      0087A1 4B 3F            [ 1] 1511 	push	#0x3f
      0087A3 4B 20            [ 1] 1512 	push	#0x20
      0087A5 CD 80 CE         [ 4] 1513 	call	_write_spi_reg
      0087A8 5B 02            [ 2] 1514 	addw	sp, #2
                                   1515 ;	se8r01-receive-car.c: 508: write_spi_reg(WRITE_REG|iRF_BANK0_DYNPD, 0b00111111);          // enable dynamic payload length data
      0087AA 4B 3F            [ 1] 1516 	push	#0x3f
      0087AC 4B 3C            [ 1] 1517 	push	#0x3c
      0087AE CD 80 CE         [ 4] 1518 	call	_write_spi_reg
      0087B1 5B 02            [ 2] 1519 	addw	sp, #2
                                   1520 ;	se8r01-receive-car.c: 509: write_spi_reg(WRITE_REG|iRF_BANK0_FEATURE, 0x07);        // enable dynamic paload lenght; enbale payload with ack enable w_tx_payload_noack
      0087B3 4B 07            [ 1] 1521 	push	#0x07
      0087B5 4B 3D            [ 1] 1522 	push	#0x3d
      0087B7 CD 80 CE         [ 4] 1523 	call	_write_spi_reg
      0087BA 5B 02            [ 2] 1524 	addw	sp, #2
                                   1525 ;	se8r01-receive-car.c: 510: PC_ODR |= (1 << CE);
      0087BC AE 50 0A         [ 2] 1526 	ldw	x, #0x500a
      0087BF F6               [ 1] 1527 	ld	a, (x)
      0087C0 AA 10            [ 1] 1528 	or	a, #0x10
      0087C2 F7               [ 1] 1529 	ld	(x), a
      0087C3 5B 05            [ 2] 1530 	addw	sp, #5
      0087C5 81               [ 4] 1531 	ret
                                   1532 ;	se8r01-receive-car.c: 515: void Init_Tim2 ()
                                   1533 ;	-----------------------------------------
                                   1534 ;	 function Init_Tim2
                                   1535 ;	-----------------------------------------
      0087C6                       1536 _Init_Tim2:
                                   1537 ;	se8r01-receive-car.c: 551: TIM2_CCMR3 |=0X70;//Set the timer 2 / three channel three (PD2) output mode
      0087C6 AE 53 09         [ 2] 1538 	ldw	x, #0x5309
      0087C9 F6               [ 1] 1539 	ld	a, (x)
      0087CA AA 70            [ 1] 1540 	or	a, #0x70
      0087CC F7               [ 1] 1541 	ld	(x), a
                                   1542 ;	se8r01-receive-car.c: 552: TIM2_CCMR3 |=0X04;//Comparison of 3 pre load / / output enable
      0087CD AE 53 09         [ 2] 1543 	ldw	x, #0x5309
      0087D0 F6               [ 1] 1544 	ld	a, (x)
      0087D1 AA 04            [ 1] 1545 	or	a, #0x04
      0087D3 F7               [ 1] 1546 	ld	(x), a
                                   1547 ;	se8r01-receive-car.c: 554: TIM2_CCER2 |=0x03;//  Channel 3 enable, active low output configuration
      0087D4 AE 53 0B         [ 2] 1548 	ldw	x, #0x530b
      0087D7 F6               [ 1] 1549 	ld	a, (x)
      0087D8 AA 03            [ 1] 1550 	or	a, #0x03
      0087DA F7               [ 1] 1551 	ld	(x), a
                                   1552 ;	se8r01-receive-car.c: 556: TIM2_PSCR =0X04;// 16 Mhz/2^4 =  1Mhz  -- the prescaler is a 4 bit number!
      0087DB AE 53 0E         [ 2] 1553 	ldw	x, #0x530e
      0087DE A6 04            [ 1] 1554 	ld	a, #0x04
      0087E0 F7               [ 1] 1555 	ld	(x), a
                                   1556 ;	se8r01-receive-car.c: 560: TIM2_ARRH =20000/256; // auto reload register
      0087E1 AE 53 0F         [ 2] 1557 	ldw	x, #0x530f
      0087E4 A6 4E            [ 1] 1558 	ld	a, #0x4e
      0087E6 F7               [ 1] 1559 	ld	(x), a
                                   1560 ;	se8r01-receive-car.c: 561: TIM2_ARRL =20000%256; // 1000 Khz/20000 is 50 events per second 
      0087E7 AE 53 10         [ 2] 1561 	ldw	x, #0x5310
      0087EA A6 20            [ 1] 1562 	ld	a, #0x20
      0087EC F7               [ 1] 1563 	ld	(x), a
                                   1564 ;	se8r01-receive-car.c: 565: TIM2_CCR3H =1000/256; //compare capture register value
      0087ED AE 53 15         [ 2] 1565 	ldw	x, #0x5315
      0087F0 A6 03            [ 1] 1566 	ld	a, #0x03
      0087F2 F7               [ 1] 1567 	ld	(x), a
                                   1568 ;	se8r01-receive-car.c: 566: TIM2_CCR3L =1000%256;
      0087F3 AE 53 16         [ 2] 1569 	ldw	x, #0x5316
      0087F6 A6 E8            [ 1] 1570 	ld	a, #0xe8
      0087F8 F7               [ 1] 1571 	ld	(x), a
                                   1572 ;	se8r01-receive-car.c: 567: UARTPrintF("timer init 1 = \n\r");
      0087F9 AE 8A 22         [ 2] 1573 	ldw	x, #___str_0+0
      0087FC 89               [ 2] 1574 	pushw	x
      0087FD CD 82 79         [ 4] 1575 	call	_UARTPrintF
      008800 5B 02            [ 2] 1576 	addw	sp, #2
                                   1577 ;	se8r01-receive-car.c: 576: TIM2_CCMR1 |=0X70;//Set the timer 2 / channel 1 output
      008802 AE 53 07         [ 2] 1578 	ldw	x, #0x5307
      008805 F6               [ 1] 1579 	ld	a, (x)
      008806 AA 70            [ 1] 1580 	or	a, #0x70
      008808 F7               [ 1] 1581 	ld	(x), a
                                   1582 ;	se8r01-receive-car.c: 577: TIM2_CCMR1 |=0X04;//Comparison of 3 pre load / / output enable
      008809 AE 53 07         [ 2] 1583 	ldw	x, #0x5307
      00880C F6               [ 1] 1584 	ld	a, (x)
      00880D AA 04            [ 1] 1585 	or	a, #0x04
      00880F F7               [ 1] 1586 	ld	(x), a
                                   1587 ;	se8r01-receive-car.c: 578: TIM2_CCER1 |=0x03;//  Channel 3 enable, active low output configuration
      008810 AE 53 0A         [ 2] 1588 	ldw	x, #0x530a
      008813 F6               [ 1] 1589 	ld	a, (x)
      008814 AA 03            [ 1] 1590 	or	a, #0x03
      008816 F7               [ 1] 1591 	ld	(x), a
                                   1592 ;	se8r01-receive-car.c: 582: TIM2_CCR3H =10000/256; //compare capture register value
      008817 AE 53 15         [ 2] 1593 	ldw	x, #0x5315
      00881A A6 27            [ 1] 1594 	ld	a, #0x27
      00881C F7               [ 1] 1595 	ld	(x), a
                                   1596 ;	se8r01-receive-car.c: 583: TIM2_CCR3L =10000%256;
      00881D AE 53 16         [ 2] 1597 	ldw	x, #0x5316
      008820 A6 10            [ 1] 1598 	ld	a, #0x10
      008822 F7               [ 1] 1599 	ld	(x), a
                                   1600 ;	se8r01-receive-car.c: 587: UARTPrintF("timer init 2 = \n\r");
      008823 AE 8A 34         [ 2] 1601 	ldw	x, #___str_1+0
      008826 89               [ 2] 1602 	pushw	x
      008827 CD 82 79         [ 4] 1603 	call	_UARTPrintF
      00882A 5B 02            [ 2] 1604 	addw	sp, #2
                                   1605 ;	se8r01-receive-car.c: 590: TIM2_CR1 |=0x81;
      00882C AE 53 00         [ 2] 1606 	ldw	x, #0x5300
      00882F F6               [ 1] 1607 	ld	a, (x)
      008830 AA 81            [ 1] 1608 	or	a, #0x81
      008832 F7               [ 1] 1609 	ld	(x), a
      008833 81               [ 4] 1610 	ret
                                   1611 ;	se8r01-receive-car.c: 596: int main () {
                                   1612 ;	-----------------------------------------
                                   1613 ;	 function main
                                   1614 ;	-----------------------------------------
      008834                       1615 _main:
      008834 52 33            [ 2] 1616 	sub	sp, #51
                                   1617 ;	se8r01-receive-car.c: 598: UCHAR rx_addr_p1[]  = { 0xd2, 0xf0, 0xf0, 0xf0, 0xf0 };
      008836 90 96            [ 1] 1618 	ldw	y, sp
      008838 72 A9 00 07      [ 2] 1619 	addw	y, #7
      00883C A6 D2            [ 1] 1620 	ld	a, #0xd2
      00883E 90 F7            [ 1] 1621 	ld	(y), a
      008840 93               [ 1] 1622 	ldw	x, y
      008841 5C               [ 2] 1623 	incw	x
      008842 A6 F0            [ 1] 1624 	ld	a, #0xf0
      008844 F7               [ 1] 1625 	ld	(x), a
      008845 93               [ 1] 1626 	ldw	x, y
      008846 5C               [ 2] 1627 	incw	x
      008847 5C               [ 2] 1628 	incw	x
      008848 A6 F0            [ 1] 1629 	ld	a, #0xf0
      00884A F7               [ 1] 1630 	ld	(x), a
      00884B 93               [ 1] 1631 	ldw	x, y
      00884C A6 F0            [ 1] 1632 	ld	a, #0xf0
      00884E E7 03            [ 1] 1633 	ld	(0x0003, x), a
      008850 93               [ 1] 1634 	ldw	x, y
      008851 A6 F0            [ 1] 1635 	ld	a, #0xf0
      008853 E7 04            [ 1] 1636 	ld	(0x0004, x), a
                                   1637 ;	se8r01-receive-car.c: 599: UCHAR tx_addr[]     = { 0xe1, 0xf0, 0xf0, 0xf0, 0xf0 };
      008855 90 96            [ 1] 1638 	ldw	y, sp
      008857 72 A9 00 2D      [ 2] 1639 	addw	y, #45
      00885B A6 E1            [ 1] 1640 	ld	a, #0xe1
      00885D 90 F7            [ 1] 1641 	ld	(y), a
      00885F 93               [ 1] 1642 	ldw	x, y
      008860 5C               [ 2] 1643 	incw	x
      008861 A6 F0            [ 1] 1644 	ld	a, #0xf0
      008863 F7               [ 1] 1645 	ld	(x), a
      008864 93               [ 1] 1646 	ldw	x, y
      008865 5C               [ 2] 1647 	incw	x
      008866 5C               [ 2] 1648 	incw	x
      008867 A6 F0            [ 1] 1649 	ld	a, #0xf0
      008869 F7               [ 1] 1650 	ld	(x), a
      00886A 93               [ 1] 1651 	ldw	x, y
      00886B A6 F0            [ 1] 1652 	ld	a, #0xf0
      00886D E7 03            [ 1] 1653 	ld	(0x0003, x), a
      00886F 93               [ 1] 1654 	ldw	x, y
      008870 1C 00 04         [ 2] 1655 	addw	x, #0x0004
      008873 A6 F0            [ 1] 1656 	ld	a, #0xf0
      008875 F7               [ 1] 1657 	ld	(x), a
                                   1658 ;	se8r01-receive-car.c: 604: InitializeSystemClock();
      008876 CD 81 E4         [ 4] 1659 	call	_InitializeSystemClock
                                   1660 ;	se8r01-receive-car.c: 605: InitializeUART();
      008879 CD 82 DE         [ 4] 1661 	call	_InitializeUART
                                   1662 ;	se8r01-receive-car.c: 607: InitializeSPI ();
      00887C CD 81 BC         [ 4] 1663 	call	_InitializeSPI
                                   1664 ;	se8r01-receive-car.c: 609: UARTPrintF("start debug \n\r");
      00887F AE 8A 46         [ 2] 1665 	ldw	x, #___str_2+0
      008882 89               [ 2] 1666 	pushw	x
      008883 CD 82 79         [ 4] 1667 	call	_UARTPrintF
      008886 5B 02            [ 2] 1668 	addw	sp, #2
                                   1669 ;	se8r01-receive-car.c: 611: memset (tx_payload, 0, sizeof(tx_payload));
      008888 96               [ 1] 1670 	ldw	x, sp
      008889 1C 00 0C         [ 2] 1671 	addw	x, #12
      00888C 4B 21            [ 1] 1672 	push	#0x21
      00888E 4B 00            [ 1] 1673 	push	#0x00
      008890 4B 00            [ 1] 1674 	push	#0x00
      008892 4B 00            [ 1] 1675 	push	#0x00
      008894 89               [ 2] 1676 	pushw	x
      008895 CD 8A DD         [ 4] 1677 	call	_memset
      008898 5B 06            [ 2] 1678 	addw	sp, #6
                                   1679 ;	se8r01-receive-car.c: 614: init_io();                        // Initialize IO port
      00889A CD 83 57         [ 4] 1680 	call	_init_io
                                   1681 ;	se8r01-receive-car.c: 615: write_spi_reg(FLUSH_RX,0); // receive data 
      00889D 4B 00            [ 1] 1682 	push	#0x00
      00889F 4B E2            [ 1] 1683 	push	#0xe2
      0088A1 CD 80 CE         [ 4] 1684 	call	_write_spi_reg
      0088A4 5B 02            [ 2] 1685 	addw	sp, #2
                                   1686 ;	se8r01-receive-car.c: 616: readstatus = read_spi_reg(CONFIG);
      0088A6 4B 00            [ 1] 1687 	push	#0x00
      0088A8 CD 81 0A         [ 4] 1688 	call	_read_spi_reg
      0088AB 5B 01            [ 2] 1689 	addw	sp, #1
                                   1690 ;	se8r01-receive-car.c: 617: UARTPrintF("config = \n\r");
      0088AD AE 8A 55         [ 2] 1691 	ldw	x, #___str_3+0
      0088B0 88               [ 1] 1692 	push	a
      0088B1 89               [ 2] 1693 	pushw	x
      0088B2 CD 82 79         [ 4] 1694 	call	_UARTPrintF
      0088B5 5B 02            [ 2] 1695 	addw	sp, #2
      0088B7 84               [ 1] 1696 	pop	a
                                   1697 ;	se8r01-receive-car.c: 618: print_UCHAR_hex(readstatus);
      0088B8 88               [ 1] 1698 	push	a
      0088B9 CD 82 90         [ 4] 1699 	call	_print_UCHAR_hex
      0088BC 84               [ 1] 1700 	pop	a
                                   1701 ;	se8r01-receive-car.c: 619: readstatus = read_spi_reg(STATUS);
      0088BD 4B 07            [ 1] 1702 	push	#0x07
      0088BF CD 81 0A         [ 4] 1703 	call	_read_spi_reg
      0088C2 5B 01            [ 2] 1704 	addw	sp, #1
                                   1705 ;	se8r01-receive-car.c: 620: UARTPrintF("status = \n\r");
      0088C4 AE 8A 61         [ 2] 1706 	ldw	x, #___str_4+0
      0088C7 88               [ 1] 1707 	push	a
      0088C8 89               [ 2] 1708 	pushw	x
      0088C9 CD 82 79         [ 4] 1709 	call	_UARTPrintF
      0088CC 5B 02            [ 2] 1710 	addw	sp, #2
      0088CE 84               [ 1] 1711 	pop	a
                                   1712 ;	se8r01-receive-car.c: 621: print_UCHAR_hex(readstatus);
      0088CF 88               [ 1] 1713 	push	a
      0088D0 CD 82 90         [ 4] 1714 	call	_print_UCHAR_hex
      0088D3 84               [ 1] 1715 	pop	a
                                   1716 ;	se8r01-receive-car.c: 625: Init_Tim2 (); //pwm for led on pd2
      0088D4 CD 87 C6         [ 4] 1717 	call	_Init_Tim2
                                   1718 ;	se8r01-receive-car.c: 626: PA_DDR |= (1<<3);
      0088D7 AE 50 02         [ 2] 1719 	ldw	x, #0x5002
      0088DA F6               [ 1] 1720 	ld	a, (x)
      0088DB AA 08            [ 1] 1721 	or	a, #0x08
      0088DD F7               [ 1] 1722 	ld	(x), a
                                   1723 ;	se8r01-receive-car.c: 627: PA_CR1 |= (1<<3);
      0088DE AE 50 03         [ 2] 1724 	ldw	x, #0x5003
      0088E1 F6               [ 1] 1725 	ld	a, (x)
      0088E2 AA 08            [ 1] 1726 	or	a, #0x08
      0088E4 F7               [ 1] 1727 	ld	(x), a
                                   1728 ;	se8r01-receive-car.c: 628: PA_CR2 &= 0xFD;
      0088E5 AE 50 04         [ 2] 1729 	ldw	x, #0x5004
      0088E8 F6               [ 1] 1730 	ld	a, (x)
      0088E9 A4 FD            [ 1] 1731 	and	a, #0xfd
      0088EB F7               [ 1] 1732 	ld	(x), a
                                   1733 ;	se8r01-receive-car.c: 630: UARTPrintF("timer initialised = \n\r");
      0088EC AE 8A 6D         [ 2] 1734 	ldw	x, #___str_5+0
      0088EF 89               [ 2] 1735 	pushw	x
      0088F0 CD 82 79         [ 4] 1736 	call	_UARTPrintF
      0088F3 5B 02            [ 2] 1737 	addw	sp, #2
                                   1738 ;	se8r01-receive-car.c: 638: PB_DDR = (1 << 4) | (1 << 5);  // output mode
      0088F5 AE 50 07         [ 2] 1739 	ldw	x, #0x5007
      0088F8 A6 30            [ 1] 1740 	ld	a, #0x30
      0088FA F7               [ 1] 1741 	ld	(x), a
                                   1742 ;	se8r01-receive-car.c: 639: PB_CR1 = (1 << 4) | (1 << 5);  // push-pull
      0088FB AE 50 08         [ 2] 1743 	ldw	x, #0x5008
      0088FE A6 30            [ 1] 1744 	ld	a, #0x30
      008900 F7               [ 1] 1745 	ld	(x), a
                                   1746 ;	se8r01-receive-car.c: 640: PB_CR2 = (1 << 4) | (1 << 5);  // up to 10MHz speed
      008901 AE 50 09         [ 2] 1747 	ldw	x, #0x5009
      008904 A6 30            [ 1] 1748 	ld	a, #0x30
      008906 F7               [ 1] 1749 	ld	(x), a
                                   1750 ;	se8r01-receive-car.c: 646: PA_DDR = (1 << 1) | (1 << 2);  // output mode
      008907 AE 50 02         [ 2] 1751 	ldw	x, #0x5002
      00890A A6 06            [ 1] 1752 	ld	a, #0x06
      00890C F7               [ 1] 1753 	ld	(x), a
                                   1754 ;	se8r01-receive-car.c: 647: PA_CR1 = (1 << 1) | (1 << 2);  // push-pull
      00890D AE 50 03         [ 2] 1755 	ldw	x, #0x5003
      008910 A6 06            [ 1] 1756 	ld	a, #0x06
      008912 F7               [ 1] 1757 	ld	(x), a
                                   1758 ;	se8r01-receive-car.c: 648: PA_CR2 = (1 << 1) | (1 << 2);  // up to 10MHz speed
      008913 AE 50 04         [ 2] 1759 	ldw	x, #0x5004
      008916 A6 06            [ 1] 1760 	ld	a, #0x06
      008918 F7               [ 1] 1761 	ld	(x), a
                                   1762 ;	se8r01-receive-car.c: 653: PB_ODR |= 1 << 4;
      008919 AE 50 05         [ 2] 1763 	ldw	x, #0x5005
      00891C F6               [ 1] 1764 	ld	a, (x)
      00891D AA 10            [ 1] 1765 	or	a, #0x10
      00891F F7               [ 1] 1766 	ld	(x), a
                                   1767 ;	se8r01-receive-car.c: 657: PB_ODR |= 1 << 5;
      008920 AE 50 05         [ 2] 1768 	ldw	x, #0x5005
      008923 F6               [ 1] 1769 	ld	a, (x)
      008924 AA 20            [ 1] 1770 	or	a, #0x20
      008926 F7               [ 1] 1771 	ld	(x), a
                                   1772 ;	se8r01-receive-car.c: 662: PA_ODR |= 1 << 1;
      008927 AE 50 00         [ 2] 1773 	ldw	x, #0x5000
      00892A F6               [ 1] 1774 	ld	a, (x)
      00892B AA 02            [ 1] 1775 	or	a, #0x02
      00892D F7               [ 1] 1776 	ld	(x), a
                                   1777 ;	se8r01-receive-car.c: 668: while (1) {
      00892E                       1778 00110$:
                                   1779 ;	se8r01-receive-car.c: 670: TIM2_CCR3H =1000/256; //compare capture register value
      00892E AE 53 15         [ 2] 1780 	ldw	x, #0x5315
      008931 A6 03            [ 1] 1781 	ld	a, #0x03
      008933 F7               [ 1] 1782 	ld	(x), a
                                   1783 ;	se8r01-receive-car.c: 671: TIM2_CCR3L =1000%256;
      008934 AE 53 16         [ 2] 1784 	ldw	x, #0x5316
      008937 A6 E8            [ 1] 1785 	ld	a, #0xe8
      008939 F7               [ 1] 1786 	ld	(x), a
                                   1787 ;	se8r01-receive-car.c: 672: delay(1000);
      00893A 4B E8            [ 1] 1788 	push	#0xe8
      00893C 4B 03            [ 1] 1789 	push	#0x03
      00893E CD 82 2E         [ 4] 1790 	call	_delay
      008941 5B 02            [ 2] 1791 	addw	sp, #2
                                   1792 ;	se8r01-receive-car.c: 674: TIM2_CCR3H =2000/256; //compare capture register value
      008943 AE 53 15         [ 2] 1793 	ldw	x, #0x5315
      008946 A6 07            [ 1] 1794 	ld	a, #0x07
      008948 F7               [ 1] 1795 	ld	(x), a
                                   1796 ;	se8r01-receive-car.c: 675: TIM2_CCR3L =2000%256;
      008949 AE 53 16         [ 2] 1797 	ldw	x, #0x5316
      00894C A6 D0            [ 1] 1798 	ld	a, #0xd0
      00894E F7               [ 1] 1799 	ld	(x), a
                                   1800 ;	se8r01-receive-car.c: 676: delay(1000);
      00894F 4B E8            [ 1] 1801 	push	#0xe8
      008951 4B 03            [ 1] 1802 	push	#0x03
      008953 CD 82 2E         [ 4] 1803 	call	_delay
      008956 5B 02            [ 2] 1804 	addw	sp, #2
                                   1805 ;	se8r01-receive-car.c: 679: if ((PD_IDR & (1 << 3))==0) //input low
      008958 AE 50 10         [ 2] 1806 	ldw	x, #0x5010
      00895B F6               [ 1] 1807 	ld	a, (x)
      00895C A5 08            [ 1] 1808 	bcp	a, #0x08
      00895E 27 03            [ 1] 1809 	jreq	00170$
      008960 CC 89 E8         [ 2] 1810 	jp	00105$
      008963                       1811 00170$:
                                   1812 ;	se8r01-receive-car.c: 683: delay(240);
      008963 4B F0            [ 1] 1813 	push	#0xf0
      008965 4B 00            [ 1] 1814 	push	#0x00
      008967 CD 82 2E         [ 4] 1815 	call	_delay
      00896A 5B 02            [ 2] 1816 	addw	sp, #2
                                   1817 ;	se8r01-receive-car.c: 684: signal_lv=read_spi_reg(iRF_BANK0_RPD);
      00896C 4B 09            [ 1] 1818 	push	#0x09
      00896E CD 81 0A         [ 4] 1819 	call	_read_spi_reg
      008971 5B 01            [ 2] 1820 	addw	sp, #1
      008973 C7 00 1A         [ 1] 1821 	ld	_signal_lv+0, a
                                   1822 ;	se8r01-receive-car.c: 685: status = read_spi_reg(STATUS);
      008976 4B 07            [ 1] 1823 	push	#0x07
      008978 CD 81 0A         [ 4] 1824 	call	_read_spi_reg
      00897B 5B 01            [ 2] 1825 	addw	sp, #1
      00897D C7 00 1D         [ 1] 1826 	ld	_status+0, a
                                   1827 ;	se8r01-receive-car.c: 687: if(status&STA_MARK_RX)                                                 // if receive data ready (TX_DS) interrupt
      008980 72 06 00 1D 02   [ 2] 1828 	btjt	_status+0, #6, 00171$
      008985 20 57            [ 2] 1829 	jra	00103$
      008987                       1830 00171$:
                                   1831 ;	se8r01-receive-car.c: 690: pip= (status & 0b00001110)>>1;
      008987 C6 00 1D         [ 1] 1832 	ld	a, _status+0
      00898A A4 0E            [ 1] 1833 	and	a, #0x0e
      00898C 44               [ 1] 1834 	srl	a
      00898D 5F               [ 1] 1835 	clrw	x
      00898E 97               [ 1] 1836 	ld	xl, a
      00898F CF 00 1B         [ 2] 1837 	ldw	_pip+0, x
                                   1838 ;	se8r01-receive-car.c: 691: pload_width_now=read_spi_reg(iRF_CMD_R_RX_PL_WID);
      008992 4B 60            [ 1] 1839 	push	#0x60
      008994 CD 81 0A         [ 4] 1840 	call	_read_spi_reg
      008997 5B 01            [ 2] 1841 	addw	sp, #1
      008999 5F               [ 1] 1842 	clrw	x
      00899A 97               [ 1] 1843 	ld	xl, a
      00899B CF 00 16         [ 2] 1844 	ldw	_pload_width_now+0, x
                                   1845 ;	se8r01-receive-car.c: 692: read_spi_buf(RD_RX_PLOAD, rx_buf,32);             // read playload to rx_buf
      00899E AE 00 2E         [ 2] 1846 	ldw	x, #_rx_buf+0
      0089A1 1F 32            [ 2] 1847 	ldw	(0x32, sp), x
      0089A3 1E 32            [ 2] 1848 	ldw	x, (0x32, sp)
      0089A5 4B 20            [ 1] 1849 	push	#0x20
      0089A7 89               [ 2] 1850 	pushw	x
      0089A8 4B 61            [ 1] 1851 	push	#0x61
      0089AA CD 81 80         [ 4] 1852 	call	_read_spi_buf
      0089AD 5B 04            [ 2] 1853 	addw	sp, #4
                                   1854 ;	se8r01-receive-car.c: 693: write_spi_reg(FLUSH_RX,0);
      0089AF 4B 00            [ 1] 1855 	push	#0x00
      0089B1 4B E2            [ 1] 1856 	push	#0xe2
      0089B3 CD 80 CE         [ 4] 1857 	call	_write_spi_reg
      0089B6 5B 02            [ 2] 1858 	addw	sp, #2
                                   1859 ;	se8r01-receive-car.c: 695: newdata=1;
      0089B8 35 01 00 19      [ 1] 1860 	mov	_newdata+1, #0x01
      0089BC 72 5F 00 18      [ 1] 1861 	clr	_newdata+0
                                   1862 ;	se8r01-receive-car.c: 696: for (teller=0;teller<32;++teller)
      0089C0 5F               [ 1] 1863 	clrw	x
      0089C1                       1864 00112$:
                                   1865 ;	se8r01-receive-car.c: 697: print_UCHAR_hex (rx_buf[teller]);
      0089C1 90 93            [ 1] 1866 	ldw	y, x
      0089C3 72 F9 32         [ 2] 1867 	addw	y, (0x32, sp)
      0089C6 90 F6            [ 1] 1868 	ld	a, (y)
      0089C8 89               [ 2] 1869 	pushw	x
      0089C9 88               [ 1] 1870 	push	a
      0089CA CD 82 90         [ 4] 1871 	call	_print_UCHAR_hex
      0089CD 84               [ 1] 1872 	pop	a
      0089CE 85               [ 2] 1873 	popw	x
                                   1874 ;	se8r01-receive-car.c: 696: for (teller=0;teller<32;++teller)
      0089CF 5C               [ 2] 1875 	incw	x
      0089D0 A3 00 20         [ 2] 1876 	cpw	x, #0x0020
      0089D3 2F EC            [ 1] 1877 	jrslt	00112$
                                   1878 ;	se8r01-receive-car.c: 698: UARTPrintF("\n\r");
      0089D5 AE 8A 84         [ 2] 1879 	ldw	x, #___str_6+0
      0089D8 89               [ 2] 1880 	pushw	x
      0089D9 CD 82 79         [ 4] 1881 	call	_UARTPrintF
      0089DC 5B 02            [ 2] 1882 	addw	sp, #2
      0089DE                       1883 00103$:
                                   1884 ;	se8r01-receive-car.c: 701: write_spi_reg(WRITE_REG+STATUS,status);       // clear RX_DR or TX_DS or MAX_RT interrupt flag
      0089DE 3B 00 1D         [ 1] 1885 	push	_status+0
      0089E1 4B 27            [ 1] 1886 	push	#0x27
      0089E3 CD 80 CE         [ 4] 1887 	call	_write_spi_reg
      0089E6 5B 02            [ 2] 1888 	addw	sp, #2
      0089E8                       1889 00105$:
                                   1890 ;	se8r01-receive-car.c: 706: for (x1 = 0; x1 < 50; ++x1)
      0089E8 5F               [ 1] 1891 	clrw	x
      0089E9 1F 05            [ 2] 1892 	ldw	(0x05, sp), x
      0089EB                       1893 00121$:
      0089EB 1E 05            [ 2] 1894 	ldw	x, (0x05, sp)
      0089ED A3 00 32         [ 2] 1895 	cpw	x, #0x0032
      0089F0 2F 03            [ 1] 1896 	jrslt	00173$
      0089F2 CC 89 2E         [ 2] 1897 	jp	00110$
      0089F5                       1898 00173$:
                                   1899 ;	se8r01-receive-car.c: 707: for (y1 = 0; y1 < 50; ++y1)
      0089F5 5F               [ 1] 1900 	clrw	x
      0089F6 1F 03            [ 2] 1901 	ldw	(0x03, sp), x
      0089F8                       1902 00118$:
      0089F8 1E 03            [ 2] 1903 	ldw	x, (0x03, sp)
      0089FA A3 00 32         [ 2] 1904 	cpw	x, #0x0032
      0089FD 2E 19            [ 1] 1905 	jrsge	00122$
                                   1906 ;	se8r01-receive-car.c: 708: for (z1 = 0; z1 < 50; ++z1)
      0089FF 5F               [ 1] 1907 	clrw	x
      008A00 1F 01            [ 2] 1908 	ldw	(0x01, sp), x
      008A02                       1909 00115$:
      008A02 1E 01            [ 2] 1910 	ldw	x, (0x01, sp)
      008A04 A3 00 32         [ 2] 1911 	cpw	x, #0x0032
      008A07 2E 08            [ 1] 1912 	jrsge	00119$
                                   1913 ;	se8r01-receive-car.c: 709: __asm__("nop");
      008A09 9D               [ 1] 1914 	nop
                                   1915 ;	se8r01-receive-car.c: 708: for (z1 = 0; z1 < 50; ++z1)
      008A0A 1E 01            [ 2] 1916 	ldw	x, (0x01, sp)
      008A0C 5C               [ 2] 1917 	incw	x
      008A0D 1F 01            [ 2] 1918 	ldw	(0x01, sp), x
      008A0F 20 F1            [ 2] 1919 	jra	00115$
      008A11                       1920 00119$:
                                   1921 ;	se8r01-receive-car.c: 707: for (y1 = 0; y1 < 50; ++y1)
      008A11 1E 03            [ 2] 1922 	ldw	x, (0x03, sp)
      008A13 5C               [ 2] 1923 	incw	x
      008A14 1F 03            [ 2] 1924 	ldw	(0x03, sp), x
      008A16 20 E0            [ 2] 1925 	jra	00118$
      008A18                       1926 00122$:
                                   1927 ;	se8r01-receive-car.c: 706: for (x1 = 0; x1 < 50; ++x1)
      008A18 1E 05            [ 2] 1928 	ldw	x, (0x05, sp)
      008A1A 5C               [ 2] 1929 	incw	x
      008A1B 1F 05            [ 2] 1930 	ldw	(0x05, sp), x
      008A1D 20 CC            [ 2] 1931 	jra	00121$
      008A1F 5B 33            [ 2] 1932 	addw	sp, #51
      008A21 81               [ 4] 1933 	ret
                                   1934 	.area CODE
      008A22                       1935 ___str_0:
      008A22 74 69 6D 65 72 20 69  1936 	.ascii "timer init 1 = "
             6E 69 74 20 31 20 3D
             20
      008A31 0A                    1937 	.db 0x0A
      008A32 0D                    1938 	.db 0x0D
      008A33 00                    1939 	.db 0x00
      008A34                       1940 ___str_1:
      008A34 74 69 6D 65 72 20 69  1941 	.ascii "timer init 2 = "
             6E 69 74 20 32 20 3D
             20
      008A43 0A                    1942 	.db 0x0A
      008A44 0D                    1943 	.db 0x0D
      008A45 00                    1944 	.db 0x00
      008A46                       1945 ___str_2:
      008A46 73 74 61 72 74 20 64  1946 	.ascii "start debug "
             65 62 75 67 20
      008A52 0A                    1947 	.db 0x0A
      008A53 0D                    1948 	.db 0x0D
      008A54 00                    1949 	.db 0x00
      008A55                       1950 ___str_3:
      008A55 63 6F 6E 66 69 67 20  1951 	.ascii "config = "
             3D 20
      008A5E 0A                    1952 	.db 0x0A
      008A5F 0D                    1953 	.db 0x0D
      008A60 00                    1954 	.db 0x00
      008A61                       1955 ___str_4:
      008A61 73 74 61 74 75 73 20  1956 	.ascii "status = "
             3D 20
      008A6A 0A                    1957 	.db 0x0A
      008A6B 0D                    1958 	.db 0x0D
      008A6C 00                    1959 	.db 0x00
      008A6D                       1960 ___str_5:
      008A6D 74 69 6D 65 72 20 69  1961 	.ascii "timer initialised = "
             6E 69 74 69 61 6C 69
             73 65 64 20 3D 20
      008A81 0A                    1962 	.db 0x0A
      008A82 0D                    1963 	.db 0x0D
      008A83 00                    1964 	.db 0x00
      008A84                       1965 ___str_6:
      008A84 0A                    1966 	.db 0x0A
      008A85 0D                    1967 	.db 0x0D
      008A86 00                    1968 	.db 0x00
                                   1969 	.area INITIALIZER
      008AFC                       1970 __xinit__SE8R01_DR_2M:
      008AFC 00 00                 1971 	.dw #0x0000
      008AFE                       1972 __xinit__SE8R01_DR_1M:
      008AFE 00 00                 1973 	.dw #0x0000
      008B00                       1974 __xinit__SE8R01_DR_500K:
      008B00 00 01                 1975 	.dw #0x0001
      008B02                       1976 __xinit__pload_width_now:
      008B02 00 00                 1977 	.dw #0x0000
      008B04                       1978 __xinit__newdata:
      008B04 00 00                 1979 	.dw #0x0000
      008B06                       1980 __xinit__signal_lv:
      008B06 00                    1981 	.db #0x00	;  0
      008B07                       1982 __xinit__pip:
      008B07 00 00                 1983 	.dw #0x0000
      008B09                       1984 __xinit__status:
      008B09 00                    1985 	.db #0x00	; 0
      008B0A                       1986 __xinit__TX_ADDRESS:
      008B0A B3                    1987 	.db #0xB3	; 179
      008B0B 43                    1988 	.db #0x43	; 67	'C'
      008B0C 10                    1989 	.db #0x10	; 16
      008B0D 10                    1990 	.db #0x10	; 16
      008B0E                       1991 __xinit__ADDRESS2:
      008B0E B1                    1992 	.db #0xB1	; 177
      008B0F                       1993 __xinit__ADDRESS3:
      008B0F B2                    1994 	.db #0xB2	; 178
      008B10                       1995 __xinit__ADDRESS4:
      008B10 B3                    1996 	.db #0xB3	; 179
      008B11                       1997 __xinit__ADDRESS5:
      008B11 B4                    1998 	.db #0xB4	; 180
      008B12                       1999 __xinit__ADDRESS1:
      008B12 B0                    2000 	.db #0xB0	; 176
      008B13 43                    2001 	.db #0x43	; 67	'C'
      008B14 10                    2002 	.db #0x10	; 16
      008B15 10                    2003 	.db #0x10	; 16
      008B16                       2004 __xinit__ADDRESS0:
      008B16 34                    2005 	.db #0x34	; 52	'4'
      008B17 43                    2006 	.db #0x43	; 67	'C'
      008B18 10                    2007 	.db #0x10	; 16
      008B19 10                    2008 	.db #0x10	; 16
      008B1A                       2009 __xinit__rx_buf:
      008B1A 00                    2010 	.db #0x00	; 0
      008B1B 00                    2011 	.db 0x00
      008B1C 00                    2012 	.db 0x00
      008B1D 00                    2013 	.db 0x00
      008B1E 00                    2014 	.db 0x00
      008B1F 00                    2015 	.db 0x00
      008B20 00                    2016 	.db 0x00
      008B21 00                    2017 	.db 0x00
      008B22 00                    2018 	.db 0x00
      008B23 00                    2019 	.db 0x00
      008B24 00                    2020 	.db 0x00
      008B25 00                    2021 	.db 0x00
      008B26 00                    2022 	.db 0x00
      008B27 00                    2023 	.db 0x00
      008B28 00                    2024 	.db 0x00
      008B29 00                    2025 	.db 0x00
      008B2A 00                    2026 	.db 0x00
      008B2B 00                    2027 	.db 0x00
      008B2C 00                    2028 	.db 0x00
      008B2D 00                    2029 	.db 0x00
      008B2E 00                    2030 	.db 0x00
      008B2F 00                    2031 	.db 0x00
      008B30 00                    2032 	.db 0x00
      008B31 00                    2033 	.db 0x00
      008B32 00                    2034 	.db 0x00
      008B33 00                    2035 	.db 0x00
      008B34 00                    2036 	.db 0x00
      008B35 00                    2037 	.db 0x00
      008B36 00                    2038 	.db 0x00
      008B37 00                    2039 	.db 0x00
      008B38 00                    2040 	.db 0x00
      008B39 00                    2041 	.db 0x00
      008B3A                       2042 __xinit__tx_buf:
      008B3A 00                    2043 	.db #0x00	; 0
      008B3B 00                    2044 	.db 0x00
      008B3C 00                    2045 	.db 0x00
      008B3D 00                    2046 	.db 0x00
      008B3E 00                    2047 	.db 0x00
      008B3F 00                    2048 	.db 0x00
      008B40 00                    2049 	.db 0x00
      008B41 00                    2050 	.db 0x00
      008B42 00                    2051 	.db 0x00
      008B43 00                    2052 	.db 0x00
      008B44 00                    2053 	.db 0x00
      008B45 00                    2054 	.db 0x00
      008B46 00                    2055 	.db 0x00
      008B47 00                    2056 	.db 0x00
      008B48 00                    2057 	.db 0x00
      008B49 00                    2058 	.db 0x00
      008B4A 00                    2059 	.db 0x00
      008B4B 00                    2060 	.db 0x00
      008B4C 00                    2061 	.db 0x00
      008B4D 00                    2062 	.db 0x00
      008B4E 00                    2063 	.db 0x00
      008B4F 00                    2064 	.db 0x00
      008B50 00                    2065 	.db 0x00
      008B51 00                    2066 	.db 0x00
      008B52 00                    2067 	.db 0x00
      008B53 00                    2068 	.db 0x00
      008B54 00                    2069 	.db 0x00
      008B55 00                    2070 	.db 0x00
      008B56 00                    2071 	.db 0x00
      008B57 00                    2072 	.db 0x00
      008B58 00                    2073 	.db 0x00
      008B59 00                    2074 	.db 0x00
                                   2075 	.area CABS (ABS)
