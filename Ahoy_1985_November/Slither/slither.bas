1 REM ALL TIME HIGH 43,840
10 POKE53281,0:POKE53280,0:POKE52,56:POKE56,56:I=RND(-TI):PRINTCHR$(142)
20 J0=127:J2=56320:S=1024:SI=54272:C=SI:S1=SI+1:S4=SI+4:S5=SI+5:S6=SI+6:SV=SI+24
22 BH=33:BS=34:BC=32:NS=40:C$=CHR$(96)
30 FORI=SITOSV:POKEI,0:NEXT:POKES6,242:POKESV,15
32 POKE56334,0:POKE1,51
34 A=14336:B=53248:FORI=0TO1487:POKEI+A,PEEK(I+B):NEXT
36 POKE1,55:POKE56334,1:POKE53272,30
38 FORI=0TO30:READP:POKE49152+I,P:NEXT
40 FORI=14600TO14631:READP:POKEI,P:NEXT
42 FORI=15064TO15159:READP:POKEI,P:NEXT
44 FORI=14720TO14799:READP:POKEI,P:NEXT
60 DIMJD(32),L$(NS),FC(12),FS(13),BC(5)
64 JD(1)=-40:JD(2)=40:JD(4)=-1:JD(8)=1
66 FORJ=1TONS:READL$(J):NEXT
68 FORI=1TO12:READFC(I):NEXT
70 FORI=1TO13:READFS(I):NEXT
72 FORI=1TO5:READCB(I):NEXT
99 :
100 PRINT"[CLEAR][6"[DOWN]"]"
120 PRINT"[PURPLE]  [5"[s C]"] [s C][5" "][s C] [5"[s C]"] [s C][3" "][s C] [5"[s C]"] [4"[s C]"] "
122 PRINT"[BLUE]  [s C][5" "][s C][5" "][s C][3" "][s C][3" "][s C][3" "][s C] [s C][5" "][s C][3" "][s C]" 
124 PRINT"[c 7][3" "][3"[s C]"]  [s C][5" "][s C][3" "][s C][3" "][5"[s C]"] [4"[s C]"]  [4"[s C]"]"
126 PRINT"[CYAN][6" "][s C] [s C][5" "][s C][3" "][s C][3" "][s C][3" "][s C] [s C][5" "][s C]  [s C]"
127 PRINT"[GREEN]  [4"[s C]"]  [5"[s C]"] [s C][3" "][s C][3" "][s C][3" "][s C] [5"[s C]"] [s C][3" "][s C]"
130 FORI=1TO200:NEXT
132 PRINT"[HOME][4"[DOWN]"][WHITE]"TAB(12)"DIFFICULTY 12345":P=S+183
134 J=PEEK(J2):IFJ=119THENP=P+1:IFP>S+187THENP=P-1
136 IFJ=123THENP=P-1:IFP<S+183THENP=P+1
138 IFJ=111THEN160
140 POKEP,PEEK(P)OR128:FORI=1TO30:NEXT:POKEP,PEEK(P)AND127:GOTO134
160 DI=P-(S+182):DU=DI:W=7:SC=0:L=1
162 POKE53270,216:POKE53282,6:POKE53283,5
190 GOSUB700
192 P=S+165:PD=1
199 :
200 J=PEEK(J2):IFJ=J0THEN250
202 J=J0-J:IFJD(J)THENPD=JD(J)
250 Q=PEEK(P+PD):IFQ<>BCTHEN300
252 POKEP,BS:P=P+PD:POKEP+C,CB:POKEP,BH
260 FORD=1TO50:NEXT:GOTO200
298 :
299 : * COLLISION *
300 IFQ<91THEN400
302 Q=Q-90:SC=SC+FS(Q):POKEP,BS:FORI=Q*12+10TO0STEP-Q/2:POKES1,I:POKES4,17:NEXT
304 P=P+PD:POKEP,BH:FORI=0TOQ*12+10STEPQ/2:POKES1,I:POKES4,17:NEXT:POKES4,16
310 POKEP+C,CB:GOSUB350:DU=DU-1:IFDU=0THEN800
312 GOTO200
348 :
349 : * STATUS LINE *
350 PRINT"[HOME][WHITE]SCORE  ";:N=SC:GOTO940
360 PRINT"[HOME]"TAB(19)"[BLUE]("CHR$(48+W)")"TAB(28)"[GREEN]HIGH  ";:N=SH:GOSUB940
362 PRINT"[WHITE]":RETURN
398 :
399 : * CRASHED *
400 POKES1,5:POKES4,129:FORI=15TO0STEP-1:POKESV,I:POKEP+C,I:POKE53281,I
402 POKE53280,I:POKE53282,15-I:POKE53283,I:FORJ=1TO20:NEXT:NEXT
406 POKE53282,6:POKE53283,5:POKESV,15:POKES4,0:W=W-1:GOSUB360:IFW=0THEN410
408 POKEP,BC:SYS49152:FORI=1TO800:NEXT:GOTO192
410 PRINT"[HOME][11"[DOWN]"]":PRINTTAB(15)"GAME  OVER"
412 IFSC>SHTHENSH=SC:GOSUB450
420 PRINTTAB(7)"[WHITE]PRESS [RED]BUTTON[WHITE] TO PLAY AGAIN":GOSUB360
430 IFPEEK(J2)<>111THEN430
440 GOSUB3100:GOTO130
450 FORJ=1TO15:PRINTTAB(15)"[UP][RVSON][RED]HIGH SCORE":FORI=1TO20:NEXT:POKES1,38:POKES4,33
452 PRINTTAB(15)"[UP][YELLOW]HIGH SCORE":FORI=1TO20:NEXT:POKES1,40:POKES4,33:NEXT
454 POKES4,32:RETURN
598 :
599 : * PLACE PRIZES *
600 R=INT(RND(1)*19)*40+INT(RND(1)*36)+122+S:IFPEEK(R)<>BCORR=S+165THEN600
610 L1=L:IFL>12THENL1=12
620 POKER,L1+90:POKER+C,FC(L1):RETURN
698 :
699 : * SET UP SCREEN *
700 IFL=1THENGOSUB900
701 PRINT"[CLEAR][DOWN][DOWN][c 8][40"$"]";
702 FORI=1TO21:PRINT"$[38" "]$";:NEXT
704 PRINT"[39"$"]";:POKE2023,36:POKE56295,15
705 L1=L:IFL>12THENL1=12
706 PRINT"[HOME][DOWN][WHITE]"TAB(17-LEN(L$(L))/2)"#"MID$(STR$(L),2)"-"L$(L)" ";
707 POKE646,FC(L1):PRINTCHR$(L1+218)
710 READA,B:IFA=0THEN720
711 N=1:IFB-A>39THENN=40
712 FORI=A+STOB+SSTEPN:POKEI,36:POKEI+C,15:NEXT:GOTO710
720 FORJ=1TODU:GOSUB600:NEXT:GOSUB350:GOSUB360:CB=CB(DI):FORI=1TO400:NEXT
732 RETURN
798 :
799 : * COMPLETED A SCREEN *
