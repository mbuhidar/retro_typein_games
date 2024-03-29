1 REM      ***  STARSHIP  ***
2 REM MACHINE LANGUAGE SPRITE MOVEMENT
4 REM ** MOVE TOP OF MEMORY TO MAKE ROOM FOR VIDEO BLOCK AT 32768
5 POKE 55,255:POKE 56,127:POKE 643,255:POKE 644,127:PRINT "[CLEAR]"
6 REM ** DECLARE PRIMARY VARIABLES
7 F$=" ":C0%=0:C1%=0:C2%=0:C3%=0:C4%=0:C5%=0:C6%=0:SP%=0
8 DEF FN PG(X)=INT(X/256):DEF FN LO(X)=X-256*(INT(X/256))
9 REM      *** SET-UP SUBROUTINES ***
10 GOSUB 90:GOSUB 600:REM (VIDEO MEMORY)
12 PRINT "[CLEAR]";:GOSUB 95:GOSUB 700:GOSUB 2000:REM (MACHINE LANGUAGE AND SPRITES)
13 GOSUB 900:REM (SPRITE POSITIONS AND GAME SCREEN)
14 SYS 38067:REM (START INTERRUPT!)
15 REM ** ENABLE SPRITES
16 FOR I=0 TO 29:NEXT:POKE ES,31:REM (SPRITES 0-4)
17 GOTO 100
19 REM ** LOAD SUBROUTINE
20 FOR I=XB TO XE:READ A:POKE I,A:NEXT:PRINT "[RVSON].[RVSOFF]";:RETURN
89 REM TURN OFF SCREEN
90 POKE 53265,0:RETURN
94 REM TURN ON SCREEN (AND EXTENDED BACKGROUND COLOR TEXT MODE)
95 POKE 53265,91:RETURN
98 REM      *** ACTION LOOP ***
100 K=PEEK(653):IF K=7 THEN 300
110 FOR I=1 TO 4:SP%=I:SYS 38336:NEXT
115 PRINT "[HOME][5" "][HOME][DOWN][6" "][HOME][DOWN][DOWN][6" "][HOME][3"[DOWN]"][5" "]"
120 ON C0% GOSUB 200:C0%=0:C4%=0:C5%=0:C6%=0
125 FOR I=1 TO 4:SP%=I:SYS 38336:NEXT
130 IF C1%>0 THEN GOSUB 220:C1%=0
135 IF C2%>0 THEN GOSUB 240:C2%=0
140 IF C3%>0 THEN GOSUB 260:C3%=0
196 GOTO 100
199 REM ** FIREBUTTON ROUTINE GOES HERE
200 PRINT "[HOME]F"
201 IF C4%=1 THEN PRINT "[HOME][RIGHT][RIGHT]!"
202 IF C5%>1 THEN PRINT "[HOME][4"[RIGHT]"]S"
203 IF C6%=1 THEN PRINT "[HOME][6"[RIGHT]"]F"
205 RETURN
220 PRINT "[HOME][3"[DOWN]"]EW"STR$(C1%):RETURN
239 REM ** SPR/SPR COLLISION ROUTINE
240 PRINT "[HOME][DOWN]CS"STR$(C2%):RETURN
259 REM ** SPR/FORE COLLISION ROUTINE
260 PRINT "[HOME][DOWN][DOWN]CF"STR$(C3%):RETURN
296 RETURN
298 REM    *** END HANDLING ***
299 REM ** PUT VIDEO MEMORY BACK TO FIRST BLOCK, AND SCREEN MEMORY TO 1024
300 GOSUB 90:POKE ES,0:REM DISABLE SPRITES
304 REM RESTORE VIDEO/SCREEN MEMORY
305 POKE 56578,PEEK(56578)OR3:POKE 56576,(PEEK(56576)AND 252)OR 3
306 I=PEEK(53272):POKE 53272, 20:K=PEEK(648):POKE 648,4
310 GOSUB 95:PRINT "[CLEAR]QUIT? ([RVSON][s Y][RVSOFF] OR [RVSON][s N][RVSOFF])":PRINT:PRINT
315 GET A$:IF A$="" THEN 315
320 IF A$="Y" THEN PRINT "[HOME]SO LONG, STAR PILOT!":GOTO 370
325 GOSUB 90:POKE 56578,PEEK(56578)OR3:POKE 56576,(PEEK(56576)AND 252)OR 1
330 POKE 53272,I:POKE 648,K:POKE ES,31:GOSUB 95:GOTO 100
370 FOR I= 0 TO 599:NEXT
379 REM ** REENABLE SHIFT/COMMODORE AND RUN-STOP/RESTORE
380 POKE 657,0:POKE 792,71:POKE 808,237
390 SYS 65126
598 REM    *** ARRANGE MEMORY ***
599 REM USE THIRD VIDEO BLOCK (32768 TO 49151), SO ROM CHARACTER SET IS USABLE.
600 VB=32768:POKE 56578,PEEK(56578)OR3:POKE 56576,(PEEK(56576)AND 252)OR 1
601 REM ** TELL VIC-2 WHERE SCREEN IS WITHOUT CHANGING CHARACTER SET LOCATION
602 SB=0:POKE 53272,(SB*16)+4:SB=VB+1024*SB
603 REM ** TELL BASIC WHERE SCREEN IS
604 BB=SB/256:POKE 648,BB
608 REM    *** REGISTER ADDRESSES ***
611 REM ** SPRITE COLOR TABLE
612 CT(0)=53287:FOR I=1 TO 7:CT(I)=CT(I-1)+1:NEXT
613 REM ** SPRITE HORIZONTAL POSITION TABLE (LOW BYTES)
614 HT(0)=53248:FOR I=1 TO 7:HT(I)=HT(I-1)+2:NEXT
615 REM ** SPRITE VERTICAL POSITION TABLE
616 VT(0)=53249:FOR I=1 TO 7:VT(I)=VT(I-1)+2:NEXT
617 REM ** SPRITE HORIZONTAL HIGH-BIT REGISTER
618 HR=53264
619 REM ** SPRITE ENABLE REGISTER
620 ES=53269
621 REM ** VERTICAL EXPANSION REGISTER (1=DOUBLE HEIGHT)
622 VE=53271
623 REM ** HORIZONTAL EXPANSION REGISTER (1=DOUBLE WIDTH)
624 HE=53277
625 REM ** SPRITE PRIORITY REGISTER (1=SPRITE IS IN FRONT OF FOREGROUND)
626 PR=53275
627 REM ** MULTICOLOR ENABLE REGISTER (1=MULTI-COLOR ENABLED)
628 EM=53276
629 REM ** SPRITE MULTICOLOR COLOR REGISTERS
630 MR=53285:REM ('01' REGISTER: ADD 1 TO MR FOR '11' REGISTER)
633 REM ** SET-BIT AND CLEAR-BIT VALUES
634 BS(0)=1:FOR I=1 TO 7:BS(I)=2*BS(I-1):NEXT
635 FOR I=0 TO 7:BC(I)=255-BS(I):NEXT
638 REM     *** INITIALIZE VALUES ***
639 REM ** FOREGROUND COLOR
640 POKE 53281,0:PRINT "[CLEAR][c 7]";:REM (LIGHT BLUE)
641 REM ** BACKGROUND COLOR
642 POKE 53281,0 :REM (BLACK)
643 REM ** BORDER COLOR
644 POKE 53280,0:REM (BLACK)
645 REM ** SPRITE COLORS (DEFAULTS: WHI,RED,L-GRN,PUR,GRN,BLU,YEL,M-GRAY)
646 POKE CT(0),7:POKE CT(1),5:POKE CT(2),2:POKE CT(3),6:POKE CT(4),12
647 REM ** SET PRIORITY
648 POKE PR,0:REM (ALL IN FRONT)
649 REM ** SET HORIZONTAL SIZES
650 POKE HE,0:REM (ALL SMALL)
651 REM ** SET VERTICAL SIZES
652 POKE VE,0:REM (ALL SMALL)
653 REM ** ENABLE SPRITES
654 POKE ES,0:REM (LEAVE THEM OFF FOR NOW)
655 REM ** ENABL MULTICOLOR FOR SPR 1-4
656 POKE EM,30
657 REM ** SET MULTI-COLORS 1 AND 3 (1=LIGHT GREY, 3=YELLOW)
658 POKE MR,15:POKE MR+1,7
659 REM       *** ML TABLE SETUP ***
660 REM ** ANIMATION TIMER (1=FASTEST)
661 POKE 37920,4:POKE 37921,4
662 REM ** ANIMATION COUNTER (ALWAYS 1)
663 POKE 37922,1
664 REM ** ANIMATE SPRITE 0? (1=YES)
665 POKE 37923,0
666 REM ** MOVEMENT TIMER (NUMBER OF INTERRUPTS BETWEEN MOVES [1=FASTEST])
667 POKE 37924,1:POKE 37925,1
668 REM ** ALL SPRITES WRAP AT SCREEN EDGE? (1=YES)
669 POKE 37936,1
670 REM ** SPRITE 0 BOUNCE OFF SPRITES? (1=YES)
671 POKE 37940,1
672 REM ** SPRITE 0 BOUNCE OFF FOREGROUND? (1=YES)
673 POKE 37941,0
674 REM ** GO-SPEED TIMER (NUMBER OF SPRITE 0 MOVES PER INTERRUPT [1=SLOWEST])
675 POKE 37926,3:POKE 37928,3
676 REM CLEAR FLAGS
677 POKE 37927,0:POKE 37935,0:POKE 37943,0
678 REM ** EXTENDED BACKGROUND COLORS
679 POKE 53282,1:POKE 53283,7:POKE 53284,9
683 REM ** SPRITE 0-7 BIT TABLE
684 X=1:FOR I=37962 TO 37969:POKE I,X:X=X*2:NEXT
693 REM     *** SAFETY PROCEDURES ***
694 POKE 657,128:REM DISABLE SHIFT/COMMODORE CHARACTER SET SWITCH
695 REM POKE 808,234:POKE 792,193:REM DISABLE STOP AND STOP/RESTORE
696 RETURN
699 REM *** INTRO SCREEN ***
700 PRINT "[CLEAR][5"[DOWN]"]"TAB(12)"[s S][s T][s A][s R][s S][s H][s I][s P][SS][s C][s A][s P][s T][s A][s I][s N]"
710 PRINT:PRINT TAB(6)"[RVSON][s Y][s O][s U][s R][SS][s C][s R][s A][s F][s T][SS][s I][s S][SS][s B][s E][s I][s N][s G][SS][s P][s R][s E][s P][s A][s R][s E][s D][RVSOFF]":PRINT:PRINT
796 RETURN
898 REM     *** SPRITE POSITIONS ***
899 REM ** POSSIBLE POSITIONS DIM'ED
900 FOR I=1 TO 4:POKE HT(I),20+INT(RND(9)*220)
901 POKE VT(I),50+INT(RND(9)*190):NEXT
902 POKE HR,0
909 REM ** PUT STARS ON THE SCREEN
910 PRINT "[CLEAR]";:FOR I= 0 TO 49:POKE VB+INT(RND(9)*1024),46:NEXT
915 FOR I= 0 TO 8:POKE VB+INT(RND(9)*1024),42:NEXT
919 REM ** STARSHIP POSITION
920 POKE 53248,175:POKE 53249,150
921 REM ** STARSHIP DIRECTION
922 POKE VB+1016,16
946 RETURN
1998 REM    *** MACHINE LANGUAGE ***
1999 REM ** STARTUP SYS ROUTINE
2000 POKE 37888,PEEK(788):POKE 37889,PEEK(789)
2002 XB=38067:XE=38079:GOSUB 20
2003 REM BLOCK INTERR, SET VECTOR TO ANIMATION SHELL,ENABLE INTERR
2004 REM SEI LDA #0 STA 788 LDA #149 STA 789 CLI RTS
2005 DATA 120,169,0,141,20,3,169,149,141,21,3,88,96
2019 REM   *** ANIMATION SHELL ***
2020 XB=38144:XE=38176:GOSUB 20
2021 REM SEE IF TIMER CALLS FOR ANIMATION OR MOVEMENT
2022 REM DEC 37920 BEQ+3 JMP(37898)
2023 DATA 206,32,148,240,3,108,10,148
2024 REM RESET ANIMATION TIMER
2025 REM LDA 37921 STA 37920
2026 DATA 173,33,148,141,32,148
2027 REM  GET NEXT STEP IN ANIMATION SEQUENCE
2028 REM DEC 37922 BNE+5 LDA#8 STA 37922 LDX 37922 DEX
2029 DATA 206,34,148,208,5,169,8,141,34,148,174,34,148,202
2030 REM IF CALLED FOR, ANIMATE #0
2031 REM LDA 37923 BEQ+6
2032 DATA 173,35,148,240,6
2033 REM ANIMATE ALL SPRITES
2034 REM LDA ANIM.SEQ.TAB,X STA SPRITE.SHAPE.TAB
2035 A=192:B=248:FOR I=38177 TO 38219 STEP 6:POKE I,189:POKE I+1,A:POKE I+2,148
2036 POKE I+3,141:POKE I+4,B:POKE I+5,131:A=A+8:B=B+1:NEXT
2037 REM EXIT THROUGH MOVEMENT HANDLER
2038 REM JMP (37898)
2039 POKE 38225,108:POKE 38226,10:POKE 38227,148
2049 REM *** MOVEMENT COUNTER ***
2050 XB=38272:XE=38288:GOSUB 20
2051 X=38272:POKE 37896,FN LO(X):POKE 37897,FN PG(X):REM SET COUNTER ADDRESS
2052 POKE 37898,FN LO(X):POKE 37899,FN PG(X):REM MOVE.VECT.=JOYDIR
2053 REM DECREMENT TIMER; IF NOT 0, GO FINISH UP
2054 REM DEC 37924 BEQ+3 JMP(37900)
2055 DATA 206,36,148,240,3,108,12,148
2056 REM RESET TIMER AND JUMP TO READ ROUTINE THROUGH VECTOR SET FROM BASIC
2057 REM LDA 37925 STA 37924 JMP(37890)
2058 DATA 173,37,148,141,36,148,108,2,148
2059 REM ** BITSET SUBROUTINE **
2060 XB=38314:XE=38323:GOSUB 20
2061 REM GET BITMASK AND PUT IT IN HORIZONTAL HI-BIT REGISTER
2062 REM LDA 37962,Y ORA 53264 STA 53264 RTS
2063 DATA 185,74,148,13,16,208,141,16,208,96
2069 REM ** BITCLEAR SUBROUTINE **
2070 XB=38324:XE=38335:GOSUB 20
2071 REM GET BITMASK, REVERSE IT, AND PUT IT IN HORIZONTAL HI-BIT REGISTER
2072 REM LDA 37962,Y EOR#255 AND 53264 STA 53264 RTS
2073 DATA 185,74,148,73,255,45,16,208,141,16,208,96
2099 REM      *** XMOVE ***
2100 XB=38400:XE=38467:GOSUB 20
2101 REM TEST FOR UPMOVE
2102 REM LDA#1 AND 37963,Y BEQ+3 JSR 38528
2103 DATA 169,1,57,75,148,240,3,32,128,150
2107 REM TEST FOR DOWNMOVE
2108 REM LDA#2 AND 37963,Y BEQ+3 JSR 38592
2109 DATA 169,2,57,75,148,240,3,32,192,150
2117 REM TEST FOR LEFTMOVE AND HI-BIT
2118 REM LDA#4 AND 37963,Y BEQ+17 LDA 37962,Y AND 53264 BEQ+6
2119 DATA 169,4,57,75,148,240,17,185,74,148,45,16,208,240,6
2120 REM DO EITHER LEFTSET OR LEFTCLEAR
2121 REM JSR 38656 JMP 38444 JSR 38720
2122 DATA 32,0,151,76,44,150,32,64,151
2126 REM TEST FOR RIGHTMOVE AND HI-BIT
2127 REM LDA#8 AND 37963,Y BNE+1 RTS LDA 37962,Y AND 53264 BEQ+4
2128 DATA 169,8,57,75,148,208,1,96,185,74,148,45,16,208,240,4
2129 REM DO EITHER RIGHTSET OR RIGHTCLEAR
2130 REM JSR 38784 JMP 38515 JSR 38848 RTS
2131 DATA 32,128,151,96,32,192,151,96
2139 REM   *** UPMOVE SUBROUTINE ***
2140 XB=38528:XE=38561:GOSUB 20
2141 REM GET VERT.LOC.,DECREMENT,CHECK EDGE,STORE NEW VERT.LOC.
2142 REM LDX 53249,Y DEX TXA CMP 37978,Y BNE+3 JSR 38546 TXA STA 53249,Y RTS
2143 DATA 190,1,208,202,138,217,90,148,208,3,32,146,150,138,153,1,208,96
2144 REM * TOPCHECK
2145 REM LDA 37936 BNE+4 INX JMP 38391 LDX 37979,Y DEX JMP 38391
2146 DATA 173,48,148,208,4,232,76,247,149,190,91,148,202,76,247,149
2159 REM   *** DOWNMOVE SUBROUTINE ***
2160 XB=38592:XE=38625:GOSUB 20
2161 REM GET VERT.LOC.,INCREMENT,CHECK EDGE,STORE NEW VERT.LOC.
2162 REM LDX 53249,Y INX TXA CMP 37979,Y BNE+3 JSR 38610 TXA STA 53249,Y RTS
2163 DATA 190,1,208,232,138,217,91,148,208,3,32,210,150,138,153,1,208,96
2164 REM * BOTTOMCHECK
2165 REM LDA 37936 BNE+4 DEX JMP 38391 LDX 37978,Y INX JMP 38391
2166 DATA 173,48,148,208,4,202,76,247,149,190,90,148,232,76,247,149
2179 REM *** LEFTMOVE (HI BIT SET) ***
2180 XB=38656:XE=38669:GOSUB 20
2181 REM GET HORIZ LOC, DECREMENT, CHECK CROSSOVER, STORE AND RETURN
2182 REM LDX 53248,Y DEX BPL+3 JSR 38324 TXA STA 53248,7 RTS
2183 DATA 190,0,208,202,16,3,32,180,149,138,153,0,208,96
2199 REM *** LEFTMOVE (HI BIT CLR) ***
2200 XB=38720:XE=38756:GOSUB 20
2201 REM GET HORIZONTAL POSITION, DECREMENT; IF EDGE, MOVE AND LEAVE
2202 REM LDX 53248,Y DEX TXA CMP 37994,Y BNE+3 JSR 38738 TXA STA 53248,Y RTS
2203 DATA 190,0,208,202,138,217,106,148,208,3,32,82,151,138,153,0,208,96
2204 REM *** LEFT CHECK
2205 REM LDA 37936 BNE+4 INX JMP 38391 LDX 37995,Y DEX JSR 38314 JMP 38391
2206 DATA 173,48,148,208,4,232,76,247,149,190,107,148,202,32,170,149,76,247,149
2219 REM *** RIGHTMVE (HI BIT SET) ***
2220 XB=38784:XE=38820:GOSUB 20
2221 REM GET HORIZONTAL POSITION, INCREMENT; IF EDGE, MOVE AND LEAVE
2222 REM LDX 53248,Y INX TXA CMP 37932,Y BNE+3 JSR 38802 TXA STA 53248,Y RTS
2223 DATA 190,0,208,232,138,217,107,148,208,3,32,146,151,138,153,0,208,96
2224 REM *** RIGHT CHECK
2225 REM LDA 37936 BNE+4 DEX JMP 38391 LDX 37994, Y INX JSR 38324 JMP 38391
2226 DATA 173,48,148,208,4,202,76,247,149,190,106,148,232,32,180,149,76,247,149 
2239 REM *** RIGHTMVE (HI BIT CLR) ***
2240 XB=38848:XE=38861:GOSUB 20
2241 REM GET HORIZ LOC, INCREMENT, CHECK CROSSOVER, STORE AND RETURN
2242 REM LDX 53248, Y INX BNE+3 JSR 38314 TXA STA 53248, Y RTS
2243 DATA 190,0,208,232,208,3,32,170,149,138,153,0,208,96
2399 REM *** BASIC MOVEMENT HANDLER ***
2400 XB=38336:XE=38346:GOSUB 20
2401 REM SET Y TO OFFSET OF SELECTED SPRITE
2402 REM LDY#59 LDA(45)Y TAX LDY 37944, X JMP 38400
2403 DATA 160,59,177,45,170,188,56,148,76,0,150
2469 REM ** REPORT NON-SPRITE-0 WRAPS AND EDGES TO BASIC
2470 XB=38391:XE=38399:GOSUB 20
2471 REM WAS IT SPRITE 0? IF NOT, REPORT WRAP
2472 REM CPY#0 BNE+1 RTS STY 37943 RTS
2473 DATA 192,0,208,1,96,140,55,148,96
2499 REM *** READ JOYSTICK ***
2500 XB=38912:XE=38972:GOSUB 20
2501 REM SET READ VECTOR TO POINT TO JOYSTICK ROUTINE
2502 X=38912:POKE 37890, FN LO(X):POKE 37891, FN PG(X):REM (REM THIS TO USE KEYB.)
2506 REM GET JOYSTICK 2; STORE IT, CHECK FOR FIREBUTTON, REPORT IF PRESSED
2507 REM LDA 56320 STA 37933 AND#16 BNE+8 LDA#1 STA 37927 JSR 39168
2508 DATA 173,0,220,141,45,148,41,16,208,8,169,1,141,39,148,32,0,153
2509 REM IS MOVEMENT CALLED FOR? IF SO,SET JOYDIR, SET SHAPE 0
2510 REM LDA 37933 AND#15 CMP#15 BNE+3 JMP(37900) EOR#15 STA 37963 JSR 39040
2511 DATA 173,45,148,41,15,201,15,208,3,108,12,148,73,15,141,75,148,32,128,152
2512 REM MOVE ONCE, THEN POINT MOVE.VECT.TO MOVEMENT HANDLER
2513 REM LDY#0 JSR 38400 JSR 39072 LDA 37892 STA 37898
2514 DATA 160,0,32,0,150,32,160,152,173, 4,148,141,10,148
2515 REM LDA 37893 STA 37899 JMP(37900)
2516 DATA 173,5,148,141,11,148,108,12,148
2529 REM *** INTERR. MOVE. HANDLER ***
2530 XB=38976:XE=39009:GOSUB 20
2531 POKE 37892, FN LO(XB):POKE 37893, FN PG(XB)
2532 REM SET UP FOR SPRITE 0, GO MOVE, CHECK COLLISIONS, REDO IF NECESSARY
2533 REM LDY#0 JSR 38400 JSR 39072
2534 DATA 160,0,32,0,150,32,160,152
2535 REM DO IT AGAIN? IF NOT, RESET TIMER
2536 REM DEC 37928 BNE-13 LDA 37926 STA 37928
2537 DATA 206,40,148,208,243,173,38,148,141,40,148
2538 REM RESET MOVEMENT VECTOR, QUIT
2539 REM LDA 37896 STA 37898 LDA 37897 S TA 37899 JMP( 37900)
2540 DATA 173,8,148,141,10,148,173,9,148,141,11,148,108,12,148
2549 REM *** SET SHAPE 0 ***
2550 XB=39040:XE=39057:GOSUB 20
2551 REM USING JOYDIR AS INDEX, GET SPRITE SHAPE CODE FROM SPRITE 0 DIREC.TABLE
2552 REM LDA 37923 BNE+9 LDY 37963 LDA 3 7951, Y STA 33784 JSR 39232 RTS
2553 DATA 173,35,148,208,9,172,75,148,18 5,63,148,141,248,131,32,64,153,96
2569 REM ** SPRITE 0 COLLISION ROUTINE
2570 XB=39072:XE=39111:GOSUB 20
2571 REM DO WE BOUNCE OFF SPRITES? IF SO, DO IT
2572 REM LDA 37940 BEQ+16 LDA 53278 STA 37929 AND#1 BEQ+6
2573 DATA 173,52,148,240,16,173,30,208,1 41,41,148,41,1,240,6
2574 REM JSR 39248 JMP UNMOVE
2575 DATA 32,80,153,76,208,152
2576 REM DO WE BOUNCE OFF FOREGROUND? IF SO, DO IT AND RETURN
2577 REM LDA 37941 BEQ+13 LDA 53279 AND#1 BEQ+6 JSR 39280 JMP UNMOVE RTS
2578 DATA 173,53,148,240,13,173,31,208,4 1,1,240,3,32,112,153,76,208,152,96
2579 REM ** UNMOVE **
2580 XB=39120:XE=39148:GOSUB 20
2581 REM STOP GOSPEED, REVERSE JOYDIR AND STORE IT
2582 REM LDA#1 STA 37928 LDY 37963 LDA 3 8009, Y STA 37963
2583 DATA 169,1,141,40,148,172,75,148,18 5,121,148,141,75,148
2584 REM GO MOVE, REVERSE JOYDIR AND RESTORE IT, QUIT
2585 REM LDY#0 JSR 38400 LDY 37963 LDA 38009,Y STA 37963 RTS
2586 DATA 160,0,32,0,150,172,75,148,185,121,148,141,75,148,96
2599 REM *** READ KEYBOARD ***
2600 REM XB=00000:XE=00000:GOSUB 20
2601 REM SET READ VECTOR TO POINT TO KEY BOARD ROUTINE (REMOVE REM TO USE)
2602 REM X=38912:POKE 37890, FN LO(X):POKE 37891, FN PG(X):REM (NOT IN FORCE)
2699 REM ** BASIC VARIABLE SUBROUTINES
2700 XB=39168:XE=39174:GOSUB 20
2701 REM ** REPORT FIREBUTTON - C0%
2702 REM LDY#10 LDA#1 STA(45),Y RTS
2703 DATA 160,10,169,1,145,45,96
2709 REM ** REPORT SPRITES TO BASIC
2710 XB=39184:XE=39222:GOSUB 20
2711 REM C1%=EDGEWRAP, C2%=S/S COLLIS.
2712 REM LDY#17 LDA 37943 BEQ+2 STA(45)Y LDY#24 LDA 37937 BEQ+2 STA(45)Y
2713 DATA 160,17,173,55,148,240,2,145,45 ,160,24,173,49,148,240,2,145,45
2714 REM C3%=S/FOREG. COLLIS., ERASE, RET.
2715 REM LDY#31 LDA 37938 BEQ+2 STA(45)Y
2716 DATA 160,31,173,50,148,240,2,145,45
2717 REM LDA#0 STA 37937 STA 37938 STA 3 7943 RTS
2718 DATA 169,0,141,49,148,141,50,148,14 1,55,148,96
2719 REM ** REPORT MOVEMENT
2720 XB=39232:XE=39241:GOSUB 20
2721 REM C4%=PLAYER HAS TRIED TO MOVE
2722 REM LDY#38 LDA#1 STA(45)Y STA 37935 RTS
2723 DATA 160,38,169,1,145,45,141,47,148 ,96
2729 REM ** REPORT SPRITE 0 BOUNCE/S
2730 XB=39248:XE=39257:GOSUB 20
2731 REM C5%=SPRITE 0 BOUNCED/SPRITE:
2732 REM LDY#45 LDA 37929 AND#254 STA(45)Y RTS
2733 DATA 160,45,173,41,148,41,254,145,45,96
2739 REM ** REPORT SPRITE 0 BOUNCE/F
2740 XB=39280:XE=39289:GOSUB 20
2741 REM C6%=SPRITE 0 BOUNCED FOREGROU.
2742 REM LDY#52 LDA#1 STA(45)Y STA 37930 RTS
2743 DATA 160,52,169,1,145,45,141,42,148,96
2898 REM *** WRAPUP ***
2899 REM ALL ROUTINES EXIT THROUGH HERE
2900 XB=40704:XE=40721:GOSUB 20
2901 REM ** SET COLLISION VECTOR
2902 X=40704:POKE 37900, FN LO(X):POKE 37 901, FN PG(X)
2906 REM GET COLLISION DATA AND REPORT I T TO BASIC VARIABLES
2907 REM LDA 53278 STA 37937 LDA 53279 STA 37938 JSR 39184
2908 DATA 173,30,208,141,49,148,173,31,2 08,141,50,148,32,16,153
2915 REM RETURN TO HOUSEKEEPING
2916 REM JMP(37888)
2917 DATA 108,0,148
2989 REM ROUTINES ADDED BEFORE FINAL JMP() WILL EXECUTE EVERY INTERR.
2998 REM *** SET UP SPRITE SHAPES ***
2999 REM ** PLANETS
3000 FOR I=34304 TO 34816 STEP 512:FOR J=0 TO 448 STEP 64: FOR K=0 TO 20
3001 READ A: POKE I+J+K,A:NEXT
3002 FOR K=21 TO 63: POKE I+J+K,0:NEXT:NEXT:GOSUB 3985:NEXT
3009 REM ** PLANET 1 SHAPE DATA
3010 DATA 0,40,0,0,175,0,82,191,192,82,175,128,2,191,128,0,171,0,0,40,0
3011 DATA 0,40,0,0,190,0,2,255,128,5,190,128,5,254,128,0,175,0,0,40,0
3012 DATA 0,40,0,0,250,0,3,254,128,2,90,128,3,90,128,0,190,0,0,40,0
3013 DATA 0,40,0,0,234,0,3,250,128,3,229,128,3,229,128,0,250,0,0,40,0
3014 DATA 0,40,0,0,170,0,3,234,80,3,170, 80,3,170,128,0,234,0,0,40,0
3015 DATA 0,40,0,0,170,20,3,170,212,2,170,128,2,170,192,0,170,0,0,40,0
3016 DATA 0,40,0,0,170,64,2,171,192,2,170,192,2,171,192,0,170,0,0,40,0
3017 DATA 0,40,0,5,171,0,6,175,192,2,171,192,2,175,192,0,170,0,0,40,0
3019 REM ** PLANET 2 SHAPE DATA
3020 DATA 0,40,0,3,170,192,62,170,148,162,170,143,42,255,252,2,255,192,0,40,0
3021 DATA 0,40,0,3,106,192,61,106,188,241,106,143,62,171,252,2,171,192,0,40,0
3022 DATA 0,24,0,3,90,192,61,90,188,81,90,143,63,234,188,3,234,128,0,24,0
3023 DATA 0,20,0,3,86,192,61,86,188,241,86,138,61,255,168,1,255,128,0,20,0
3024 DATA 0,20,0,3,85,128,61,85,104,241,85,74,63,223,252,3,223,192,0,20,0
3025 DATA 0,20,0,3,149,192,62,149,124,242,149,79,63,253,252,3,253,192,0,20,0
3026 DATA 0,40,0,2,169,192,62,169,124,242,169,79,63,255,252,3,255,192,0,40,0
3027 DATA 0,40,0,2,170,0,42,170,188,162,170,143,63,255,212,3,255,192,0,40,0
3058 GOSUB 3985
3059 REM ** SPRITE ANIMATION TABLES
3060 FOR I=38088 TO 38112 STEP 8: FOR J=0 TO 7: READ A: POKE I+J, A: NEXT: NEXT
3061 REM ** ANIMATION TABLE DATA
3062 DATA 24,25,26,27,28,29,30,31
3063 DATA 32,33,34,35,36,37,38,39
3064 DATA 27,26,25,24,31,30,29,28
3065 DATA 37,36,35,34,33,32,39,38
3098 REM *** SPRITE 0 SHAPES ***
3099 REM ** SPRITE 0 DIRECTION TABLE
3100 FOR I=37952 TO 37961:READ A:POKE I, A:NEXT:GOSUB 3985
3101 DATA 16,20,0,22,23,21,0,18,17,19
3102 REM ** SPRITE ANIMATION TABLE
3103 FOR I=0 TO 7:POKE 38080+I,16+I:NEXT
3104 REM ** SPRITE 0 SHAPES
3105 FOR I=33792 TO 34240 STEP 64:FOR J= 0 TO 18 STEP 3
3106 READ A: POKE I+J, A: POKE I+J+1,0:POKEI+J+2,0:NEXT
3107 FOR J=21 TO 63:POKE I+J, 0:NEXT:NEXT:GOSUB 3985
3109 REM ** SPRITE 0 DATA
3110 DATA 8,28,28,28,54,34,0
3111 DATA 6,14,28,120,240,48,32
3112 DATA 0,224,62,31,62,224,0
3113 DATA 32,48,240,120,28,14,6
3114 DATA 0,34,54,28,28,28,8
3115 DATA 4,12,15,30,56,112,96
3116 DATA 0,7,124,248,124,7,0
3117 DATA 96,112,56,30,15,12,4
3298 REM ** SPRITE MOVEMENT DATA
3299 REM ** LOCATION REGISTER OFFSET TABLE
3300 X=0:FOR I=37944 TO 37951:POKE I,X:X=X+2:NEXT
3304 REM ** SPRITE BITMASK TABLE
3305 X=1:FOR I=37962 TO 37976 STEP 2:POKE I,X:X=X*2:NEXT
3307 REM ** SPRITE JOYDIR TABLE
3308 REM SPRITE DIRECTIONS: 1=UP 2=DN 4=LF 8=RT  ADD FOR DIAGONALS
3309 REM 0=NO MOVEMENT (CAN BE CHANGED FROM BASIC)
3310 FOR I=37963 TO 37977 STEP 2:READ A:POKE I, A: NEXT
3311 DATA 0,5,6,10,9,0,0,0
3312 REM ** SPRITE BORDERS TABLE **
3313 REM EACH SPRITE'S SCREEN MARGINS ARE INDIVIDUALLY SET
3314 REM SPRITES ARE CONSIDERED IN NUMERICAL ORDER
3315 REM ** TOP EDGES (0-7)
3316 FOR I=37978 TO 37992 STEP 2:READ A:POKE I,A:NEXT
3317 DATA 50,43,43,43,43,43,43,43
3318 REM ** BOTTOM EDGES (0-7)
3319 FOR I=37979 TO 37993 STEP 2:READ A:POKE I, A:NEXT
3320 DATA 243,250,250,250,250,250,250,250
3321 REM ** LEFT EDGES (0-7)
3322 FOR I=37994 TO 38008 STEP 2:READ A:POKE I, A:NEXT
3323 DATA 23,0,0,0,0,0,0,0
3324 REM ** RIGHT EDGES (0-7) 
3325 FOR I=37995 TO 38009 STEP 2:READ A:POKE I,A:NEXT
3326 DATA 80,87,87,87,87,87,87,87
3327 REM ** JOYSTICK REVERSAL TABLE
3328 FOR I=38010 TO 38019:READ A:POKE I,A:NEXT
3329 DATA 2,1,0,8,10,9,0,4,6,5
3985 PRINT "[RVSON]![RVSOFF]";
3990 RETURN
