5 REM ALICE
10 POKE53280,0:POKE53281,0:PRINT"[CLEAR][c 1]":FORI=1TO7:PRINT:NEXT
15 PRINTTAB(15)"[s U][s I][c A] [c R][s U][s I][c A][c S]":PRINTTAB(15)"[c Q][c W][s -] [s -][s -] [c Q]":PRINTTAB(15)"[c X][c Z][c Z][c X][c E][s J][s K][c Z][c X]"
17 PRINT:PRINTTAB(15)"BY SPIRKO":SE=54272:POKESE+24,15
20 DIMR$(5,5,5),PX(12),PY(12),SP(12),K$(12),A(15),B(15),C(15)
30 DEFFNR(R)=S(0)+S(1)+S(2)+S(3)+S(4)+S(5)+S(6)+S(7):OO=INT(14*RND(0))+1
35 FORI=1TO6:SP(I+6)=2+2*I:NEXT
40 GOSUB1700:GOSUB2000:DEFFNX(R)=R(3)+R(4)+R(6)+R(7)
47 FORI=0TO5:READL$(I):NEXT:FORI=1TO4:READDR$(I):NEXT
48 FORI=1TO4:READQ$(I):NEXT
50 G1=1472:G2=1730
55 FORI=1TO12:READPX(I),PY(I):NEXT:FORI=7TO12:READK$(I):NEXT
60 FORI=1TO15:READA(I),B(I),C(I):NEXT:FORI=1TO3:READJ,ST$(J):NEXT
61 FORZ=0TO5:FORY=0TO5:FORX=0TO5:READR$(X,Y,Z):L=ASC(LEFT$(R$(X,Y,Z),1))
62 IFL>77ANDL<84THENGOSUB1500
64 NEXTX,Y,Z:X=4:Y=5:Z=0
65 PRINT"[CLEAR][c 8]":PRINT:PRINT:PRINT"IS THIS A[c M][RVSON]N[RVSOFF]EW GAME OR A[c M][RVSON]C[RVSOFF]ONTINUATION?"
66 GETA$:IFA$=""THEN66
67 IFA$="C"THEN700
69 PRINT"[CLEAR]":PRINT:PRINT:PRINTTAB(12)"[CYAN]RIGHT  [c N][RVSON]>[RVSOFF][c H]"
70 PRINTTAB(12)"LEFT[3" "][c M][RVSON]<[RVSOFF][c G]":PRINTTAB(12)"UP[5" "][c M][RVSON]X[RVSOFF][c G]"
71 PRINTTAB(12)"DOWN[3" "][c N][RVSON]Z[RVSOFF][c G]":PRINTTAB(12)"QUIT[3" "][c M][RVSON]F1[RVSOFF][c G]"
72 PRINTTAB(12)"YES[4" "][c N][RVSON]SPACE[RVSOFF][c H]":PRINTTAB(12)"NO[6" "]ANY KEY"
80 PRINT:PRINT:PRINT:PRINT:PRINTTAB(11)"[c 8][c N][RVSON]F1[RVSOFF][c H] SLOW"
81 PRINTTAB(11)"[c N][RVSON]F3[RVSOFF][c G] MEDIUM":PRINTTAB(11)"[c N][RVSON]F5[RVSOFF][c G] FAST"
85 PRINT:PRINTTAB(12)"[c 8]WHAT SPEED? [c 3]";
86 PRINT"[s V][LEFT]";:GETA$:PRINT"[s +][LEFT]";:IFA$=""THEN86
87 IFA$="[F1]"THENSP=4:GOTO90
88 IFA$="[F3]"THENSP=5:GOTO90
89 SP=7
90 FORH=1TO4:READL:FORI=LTOL+62:READJ:POKEI,J:NEXTI,H
100 PRINT"[CLEAR][c 1][DOWN][DOWN][RIGHT][RIGHT][RVSON][c E][s +][s +][c R][c E][c W][RVSOFF][4" "][RVSON][c Q][c E][s +][c R][c E][s +]"
101 PRINT"[RVSON][RIGHT][RIGHT][s +][DOWN][LEFT][c R][DOWN][LEFT][c Q][DOWN][LEFT][s +][DOWN][LEFT][c E][DOWN][LEFT][c W][DOWN][LEFT][s +][DOWN][LEFT][c Q][DOWN][LEFT][s -][DOWN][LEFT][c R][DOWN][LEFT][s +][DOWN][LEFT][c E][DOWN][LEFT][c Q][DOWN][LEFT][s +][DOWN][LEFT][c Z]";
102 PRINT"[RVSON][LEFT][c W][s +][c E][s +][c W][c W][c E][s *][c E][c R][c Q][c R][c E][s +][c X]";
103 PRINT"[s +][UP][LEFT][c R][UP][LEFT][s +][UP][LEFT][c Q][UP][LEFT][c E][UP][LEFT][c R][UP][LEFT][c W][UP][LEFT][s +][UP][LEFT][s -][UP][LEFT][c Q][UP][LEFT][c E][UP][LEFT][c Q][UP][LEFT][s +][UP][LEFT][c E][UP][LEFT][s +][UP][LEFT]"
105 V=53248:V2=V+2:V3=V+3:VC=V+31:POKEV+37,1:POKEV+38,10
115 S(1)=2:POKE2041,13:POKEV+28,3:POKEV+40,14
116 POKEV+2,PX(5):POKEV+3,PY(5):FORI=1TO1500:NEXT
120 POKEV+41,10:POKE2042,14:POKEV+42,5:POKE2043,14
130 POKEV+43,4:POKE2044,14:POKEV+44,14:POKE2045,14
135 POKEV+45,7:POKE2046,14:POKE2047,14:POKEV+46,1
217 LP$="[c 8][HOME][DOWN][34"[RIGHT]"]"
220 PRINT"[HOME][5"[DOWN]"][YELLOW]"TAB(26)"MAP[4" "]LEVEL"
222 QP$="[HOME][DOWN][26"[RIGHT]"][WHITE]"
224 PRINTQP$"[GREEN][UP][3"[c @]"][DOWN][4"[LEFT]"][c N][3"[RIGHT]"][c H][DOWN][5"[LEFT]"][c N][3"[RIGHT]"][c H][DOWN][5"[LEFT]"][c M][3"[RIGHT]"][c G][DOWN][4"[LEFT]"][4"[c T]"]"
225 SP$="[HOME][22"[DOWN]"][CYAN]"
226 PRINT"[HOME][8"[DOWN]"]"TAB(26);:GOSUB230
228 PRINT"[HOME][12"[DOWN]"]"TAB(26);:GOSUB230:GOTO250
230 PRINT"[c 5][c A][s *][s *][c S][c A][s *][s *][c S][c A][s *][s *][c S][DOWN][12"[LEFT]"][s -]  [s -][s -]  [s -][s -]  [s -][DOWN][12"[LEFT]"][s -]  [s -][s -]  [s -][s -]  [s -]";
232 PRINT"[DOWN][12"[LEFT]"][c Z][s *][s *][c X][c Z][s *][s *][c X][c Z][s *][s *][c X]":RETURN
250 PRINT"[DOWN][YELLOW]"TAB(22)"GOLD":LC=54272
260 IFGS>0THENFORI=1TOGS:POKEG2+I,81:POKEG2+I+LC,7:NEXT
300 ER$="[38" "]":ER$=SP$+ER$+ER$
440 AX=PX(5):AY=PY(5):POKEV+21,FNR(R):POKEV+16,FNX(R)
450 FORE=7TO12:IFS(E-5)>0THENPOKEV+SP(E),PX(E):POKEV+SP(E)+1,PY(E)
460 NEXT
500 PRINTER$:GOSUB1100:GOSUB1200:IFSK=0THENGOSUB600
502 IFSK=1THEN510
505 GOSUB1000
510 SK=0:PRINTER$:S(1)=0:S(0)=0:POKEV+21,FNR(R):GOSUB1400
515 GOSUB1300:IFND=0THEN500
520 K=ND-(ND<3)*2+(ND>2)*2:AX=PX(K):AY=PY(K)
530 AX=PX(K):AY=PY(K):Y=Y+(ND=1)-(ND=3):X=X-(ND=2)+(ND=4):GOTO500
600 S(1)=2:POKEV2,AX:POKEV3,AY:POKEV+21,FNR(R)
610 FORI=1TO24STEP2:NX=I*(ND=4)-I*(ND=2):NY=I*(ND=1)-I*(ND=3)
620 POKEV2,AX+NX:POKEV3,AY+NY:NEXT
625 AX=NX+AX:AY=AY+NY:RETURN
700 PRINT:PRINT:PRINT"ARE YOU USING [RVSON]T[RVSOFF]APE OR [RVSON]D[RVSOFF]ISK?"
702 GETB1$:ON -(B1$="")GOTO702:IFB1$="D"THENB1=2:GOTO760
704 B1=1:PRINT"[CLEAR]"
708 PRINT:PRINT:PRINT"LOAD CONTINUATION":PRINT
710 OPEN1,1,0,"CONTINUATION"
720 INPUT#B1,SP,OO,GS,X,Y,Z,R(3),R(4),R(6),R(7)
730 FORI=2TO7:INPUT#B1,S(I):NEXT
735 FORI=2TO7:INPUT#B1,D$(I):NEXT
740 FORC=0TO5:FORB=0TO5:FORA=0TO5:INPUT#B1,R$(A,B,C):NEXTA,B,C
750 CLOSEB1:IFB1=1THEN:GOTO90
752 OPEN15,8,15:INPUT#15,E1$,E2$,E3$,E4$:CLOSE15:E1=VAL(E1$):IFE1<20THENGOTO90
754 PRINT"[CLEAR][DOWN][DOWN]DISK ERROR":PRINTE1$,E2$,E3$,E4$:END
760 PRINT:PRINT"LOADING PLEASE WAIT[4"."]"
762 OPEN2,8,2,"0:CONTINUATION,S,R":GOTO720
800 POKEV+21,0:PRINT"[CLEAR][c 8]":PRINT:PRINT" DO YOU WISH TO
801 PRINT:PRINT"[c M][RVSON]C[RVSOFF]ONTINUE THIS GAME OR[c M][RVSON]N[RVSOFF]OT?":PRINT:PRINT
805 GETA$:IFA$=""THEN805
806 IFA$<>"C"THENEND
810 PRINT"SAVE TO [RVSON]T[RVSOFF]APE OR [RVSON]D[RVSOFF]ISK?":PRINT:PRINT
812 GETB1$:ON -(B1$="")GOTO812:IFB1$="D"THENB1=2:GOTO870
814 B1=1:PRINT"[CLEAR]"
820 PRINT"SAVE CONTINUATION":PRINT:PRINT
825 OPEN1,1,1,"CONTINUATION":C$=CHR$(13)
830 PRINT#B1,SP;C$;OO;C$;GS;C$;X;C$;Y;C$;Z
835 PRINT#B1,R(3);C$;R(4);C$;R(6);C$;R(7)
840 FORI=2TO7:PRINT#B1,S(I):NEXT
845 FORI=2TO7:PRINT#B1,D$(I):NEXT
850 FORC=0TO5:FORB=0TO5:FORA=0TO5:PRINT#B1,R$(A,B,C):NEXTA,B,C
860 PRINT#B1:CLOSEB1:IFB1=1THEN END
862 PRINT#15,"V":CLOSE15:END
870 PRINT:PRINT"SAVING TO DISK[4"."]"
872 OPEN15,8,15,"S0:CONTINUATION":OPEN2,8,2,"0:CONTINUATION,S,W":C$=CHR$(13)
874 GOTO830
1000 NY=0:NX=0:IFS(3)>0ORS(7)>0THENGOSUB1600
1005 P=PEEK(VC):IFP=2THEN1030
1008 GETM$:IFM$<>""THEN1040
1010 AY=AY+NY*ABS(P<>2):AX=AX+NX*ABS(P<>2):POKEV2,AX:POKEV3,AY
1015 ND=-(AY<65)-2*(AX>150)-3*(AY>175)-4*(AX<35):IFND>0THENRETURN
1020 GOTO1005
1030 AX=AX-NX:AY=AY-NY:POKEV2,AX:POKEV3,AY
1040 NY=SP*(M$="X")-SP*(M$="Z"):NX=SP*(M$=",")-SP*(M$=".")
1045 IFM$="[F1]"THEN800
1050 GOTO1010
1100 R$=R$(X,Y,Z):FORI=1TO4:PD(I)=VAL(MID$(R$,I+1,1))
1115 IF(S(3)>0ORS(7)>0)ANDI=KTHENPD(I)=1
1116 PRINTPD$(I);:ONPD(I)+1GOTO1120,1130,1140,1145
1120 PRINTWD$(I):GOTO1147
1130 PRINTOD$(I):GOTO1147
1140 PRINTGD$(I):GOTO1147
1145 PRINTSD$(I)
1147 NEXT:PRINTLP$;L$(Z)
1150 PRINTQP$SPC(X1);:Q$="":ONY1+1GOSUB1170,1180,1190
1151 X1=INT(X/2):Y1=INT(Y/2):X2=X-X1*2:Y2=Y-Y1*2
1152 QS=(X2=0ANDY2=0)+2*(X2=1ANDY2=0)+3*(X2=0ANDY2=1)+4*(X2=1ANDY2=1)
1160 Q$=Q$(ABS(QS))
1165 PRINTQP$SPC(X1);:ONY1+1GOSUB1170,1180,1190:RETURN
1170 PRINTQ$:RETURN
1180 PRINT"[DOWN]"Q$:RETURN
1190 PRINT"[DOWN][DOWN]"Q$:RETURN
1200 E$=LEFT$(R$(X,Y,Z),1):IFE$="0"THENRETURN
1210 E=ASC(E$)-48:FORU=1TO10:POKESE+U,0:NEXT
1220 ONEGOTO2100,2200,2300,2400,2500,2600,2800
1225 ONE-16GOTO3100,3200,2900,3300,3200,3200
1230 E=E-23:GOTO2700
1300 PRINT"[HOME][3"[DOWN]"][4"[RIGHT]"][GREEN]";:FORM=1TO14:PRINT"[14" "]"SPC(26);:NEXT:RETURN
1400 FORU=0TO10:POKESE+U,0:NEXT
1410 POKESE,80:POKESE+1,33:POKESE+5,72:POKESE+22,104:POKESE+4,33
1420 FORO=1TO200:NEXT:POKESE+4,32:RETURN
1500 D$(L-76)=RIGHT$(STR$(X),1)+RIGHT$(STR$(Y),1)+RIGHT$(STR$(Z),1):RETURN
1600 IFS(7)>0THENDN=3:GOSUB1680
1610 IFS(3)>0THENDN=2:GOSUB1680
1620 RETURN
1650 FORU=0TO10:POKESE+U,0:NEXT
1660 POKESE+1,60:POKESE+5,128:POKESE+4,129
1670 FORO=0TO50:NEXT:POKESE+4,128:RETURN
1680 FORI=1TO4:IFPD(I)=DNTHENPRINTPD$(I)OD$(I):GOSUB1650
1690 NEXT:RETURN
1700 PD$(1)="[HOME][8"[RIGHT]"][3"[DOWN]"]":PD$(2)="[HOME][17"[RIGHT]"][9"[DOWN]"]"
1710 PD$(3)="[HOME][17"[DOWN]"][9"[RIGHT]"]":PD$(4)="[HOME][8"[DOWN]"][3"[RIGHT]"]"
1715 OD$(1)="[4" "]":OD$(3)=OD$(1):OD$(2)=" [LEFT][DOWN] [LEFT][DOWN] [LEFT][DOWN] ":OD$(4)=OD$(2)
1720 WD$(1)="[c 1][RVSON][c E][c R][s +][c E][RVSOFF]":WD$(3)=WD$(1):WD$(2)="[c 1][RVSON][c Q][DOWN][LEFT][s +][DOWN][LEFT][c W][DOWN][LEFT][c Q][RVSOFF]":WD$(4)=WD$(2)
1725 GD$(1)="[c 6][RVSON][4"[c P]"][RVSOFF]":GD$(2)="[RVSON][c 6][c G][DOWN][LEFT][c G][DOWN][LEFT][c G][DOWN][LEFT][c G][RVSOFF]":GD$(3)="[RVSON][c 6][4"[c Y]"][RVSOFF]"
1730 GD$(4)="[RVSON][c 6][c N][DOWN][LEFT][c N][DOWN][LEFT][c N][DOWN][LEFT][c N][RVSOFF]"
1735 SD$(1)="[WHITE][RVSON][4"[c P]"][RVSOFF]":SD$(2)="[RVSON][WHITE][c G][DOWN][LEFT][c G][DOWN][LEFT][c G][DOWN][LEFT][c G][RVSOFF]":SD$(3)="[RVSON][WHITE][4"[c Y]"][RVSOFF]"
1740 SD$(4)="[RVSON][WHITE][c N][DOWN][LEFT][c N][DOWN][LEFT][c N][DOWN][LEFT][c N][RVSOFF]":RETURN
1900 FORU=1TO23:POKESE+U,0:NEXT:POKESE+1,130:POKESE+5,9:POKESE+15,30
1910 POKESE+4,21:FORT=1TO500:NEXT:POKESE+4,20:POKESE+24,15:RETURN
2000 E$(1)="[HOME][WHITE][13"[DOWN]"][6"[ RIGHT]"][3"[c @]"][DOWN][3"[LEFT]"][c M][s M][c M][s M][DOWN][LEFT][LEFT][s O][s P]"
2004 EL$="[DOWN][12"[LEFT]"]"
2020 E$(2)="[HOME][3"[DOWN]"][5"["RIGHT"][YELLOW][s U][s I][s U][s I][DOWN][4"LEFT]"[4"[s -]"]MACDUCHESS"+EL$
2021 E$(2)=E$(2)+"[LEFT][s G][s H][s G][s H][c 3][c L][RVSON] OVER 6[RVSOFF][c K]"+EL$+"[YELLOW][LEFT][s T][s Y][s T][s Y][c 3][c L][RVSON]BILLION[RVSOFF][c K]"+EL$
2022 E$(2)=E$(2)+"[LEFT][YELLOW][c G][c M][c G][c M][c 3][c L][RVSON] SERVED[RVSOPF][c K]"
2030 E$(5)="[HOME][3"[DOWN]"][7"[RIGHT]"][c 5][8"[c P]"][DOWN][9"[LEFT]"][c M][RVSON]  MAD[3" "][RVSOFF][c G][DOWN][10"[LEFT]"]"
2031 E$(5)=E$(5)+"[c M][RVSON]HATTER'S[RVSOFF][c G][DOWN][10"[LEFT]"][c M][RVSON]TEAHOUSE[RVSOFF][c G][DOWN][10"[LEFT]"]"
2032 E$(5)=E$(5)+"[LEFT][RVSON][12"[c I]"][RVSOFF]"
2050 E$(6)="[HOME][BLUE][3"[DOWN]"][5"[RIGHT]"][c D][11"[c I]"][c F][DOWN][13"[LEFT]"][RVSON][c K]CARPENTER'S[RVSOFF][c K][DOWN][13"[LEFT]"]"
2051 E$(6)=E$(6)+"[RVSON][c K][s I] SEAFOOD [s U][RVSOFF][c K][DOWN][13"[LEFT]"][RVSON][c K][s J]  DINER  [s K][RVSOFF][c K]"
2099 RETURN
2100 PRINT"[HOME][c 3][4"[DOWN]"][5"[RIGHT]"][RVSON][c A][6"[s *]"][c S][DOWN][LEFT][s -][DOWN][LEFT][s -][DOWN][LEFT][s -][DOWN][LEFT][s -][DOWN][LEFT][s -][DOWN][LEFT][s -][DOWN][LEFT][c X][LEFT][LEFT][s *][6"[LEFT]"][s *][LEFT][LEFT][c Z]";
2105 PRINT"[UP][LEFT][s -][UP][LEFT][s -][UP][LEFT][s -][UP][LEFT][s -][UP][LEFT][s -][UP][LEFT][s -]":GOSUB600:SK=-1
2110 IFS(2)=0THENPRINTSP$"SORRY ALICE, BUT YOU NEED A KEY"
2111 IFS(2)=0THENFORA=1TO1200:NEXT:GOSUB1300:RETURN
2115 PRINTSP$"DO YOU WANT TO USE THE ELEVATOR?"
2120 GETA$:IFA$=""THEN2120
2121 IFA$<>CHR$(32)THENE=0:PRINTER$:GOSUB1300:RETURN
2125 PRINTER$SP$"WHAT LEVEL?"
2140 POKEV+2,PX(5)-16:POKEV+3,PY(5)-16
2142 GETA$:IFA$=""THEN2142
2145 IFASC(A$)>48ANDASC(A$)<55THENNL=VAL(A$)-1:PRINTER$:GOTO2160
2150 GOTO2142
2160 FORL=ZTONLSTEP.1*(1+2*(Z>NL)):POKESE+4,17
2180 POKESE+5,8:POKESE+6,8:POKESE+1,L*20:POKESE,250-L*5:PRINTLP$;L$(INT(L)+1)
2190 FORO=1TO25:NEXT::POKESE+4,0:NEXT:ND=0:Z=NL:SK=-1
2195 AX=PX(5)-16:AY=PY(5)-16:GOSUB1300:S3=S(3):S(3)=0:GOSUB1100:S(3)=S3:RETURN
2200 PRINT"[HOME]"TAB(3)"[c 8][3"[DOWN]"][c I][DOWN][LEFT]";:FORO=1TO4:PRINT"[c *][RVSON][c C][DOWN][LEFT][RVSOFF]";:NEXT:Q=1:GOTO2315
2250 FORL=25TO45+40*(Q=-1)STEP2+4*(Q=-1):POKESE+4,33
2280 POKESE+5,8:POKESE+6,32:POKESE+1,L:POKESE,100-L
2290 FORD=1TO80:NEXT:POKESE+4,0:NEXT:ND=0:K=5:RETURN
2300 PRINT"[HOME]"TAB(12)"[c 8][12"[DOWN]"][c I][DOWN][LEFT][RVSOFF]";:FORO=1TO4:PRINT"[c *][RVSON][c C][DOWN][LEFT][RVSOFF]";:NEXT:Q=-1
2315 GOSUB600:PRINTSP$"DO YOU WISH TO USE THE STAIRS?"
2320 GETA$:IFA$=""THEN2320
2330 IFA$<>CHR$(32)THENPRINTER$:SK=-1:RETURN
2345 Z=Z+Q:PRINTER$:S(1)=0:POKEV+21,FNR(R):GOSUB2250:POKEV2,PX(5):POKEV3,PY(5)
2347 K=5:AX=PX(K):AY=PY(K):ND=0:GOSUB1300:E=0:GOSUB1100:S(1)=2:SK=-1
2350 POKEV+21,FNR(R):RETURN
2360 GOTO2320
2400 READL:FORI=LTOL+62:READJ:POKEI,J:NEXT:POKE2040,15:S(0)=1:POKEV,PX(1)+1
2410 POKEV+1,PY(1)+15:POKEV+39,12:POKEV+28,3:POKEV+21,FNR(R):GOSUB600
2420 PRINTSP$"ALICE!! YOU FOUND THE WHITE RABBIT!":GOSUB2460
2450 GOSUB1900:PRINT"[4"[UP]"]":END
2460 FORL=1TO15:POKESE+4,33
2480 POKESE+5,8:POKESE+6,32:POKESE+1,30:POKESE,100
2490 FORD=1TO40:NEXT:POKESE+4,32
2495 POKESE+5,64:POKESE+6,8:POKESE+1,20:FORC=1TO40:POKESE,C:NEXT:NEXT:RETURN
2500 PRINT"[HOME][4"[DOWN]"][5"[RIGHT]"][c 7][RVSON][c D]"SPC(10)"[c F][LEFT][11"[DOWN]"][c V][12"[LEFT]"][c C]":IFS(5)>0THENRETURN
2503 GOSUB600:PRINT"[HOME][5"[DOWN]"][6"[RIGHT]"][s M][DOWN][s M][DOWN][s M][DOWN][s M][DOWN][s M][DOWN][s M][DOWN][s M][ DOWN][s M][DOWN][s M][DOWN][s M][10"[LEFT]"]";
2505 PRINT"[s N][UP][s N][UP][s N][UP][s N][UP][s N][UP][s N][UP][s N][UP][s N][UP][s N][UP][s N]":POKEV+2,PX(5):POKEV+3,PY(5)
2510 ND=0:GOSUB2550:GOSUB2580:Z=Z-1:ND=0:SK=-1:IFGS=0THEN2535
2530 P=RND(0):IFP<.7THENPOKEG2+GS,32:GS=GS-ABS(GS<>0):GOSUB2640 2532 IFP<.7THENPRINTSP$"YOU LOST A GOLD COIN!":FORI=1TO700:NEXT 2535 AX=PX(5):AY=PY(5):PRINTER$ 2540 GOSUB1300:S3=S(3):S(3)=0:S(3)=0:S7=S(7):S(7)=0 2545 GOSUB1100:S(3)=S3:S(7)=S7:GOSUB1200:RETURN 2550 FORU=ZTOZ-1STEP-.2:POKESE+4,33
2560 POKESE+5,8:POKESE+6,8:POKESE+1,U*20:POKESE,250-U*5
2565 PRINTLP$;L$(INT(U+1))
2570 FORD=1TO25:NEXT:POKESE+4,0:NEXT:RETURN
2580 FORU=0TO23:POKESE+U,0:NEXT
2585 POKESE,80:POKESE+1,33:POKESE+5,72:POKESE+22,104:POKESE+4,129
2590 POKESE+24,79:FORO=1TO350:NEXT:POKESE+4,128:POKESE+24,15:GOSUB1300:RETURN
2600 PRINT"[HOME][6"[DOWN]"][7"[RIGHT]"][PURPLE][RVSON][s +][6"[RIGHT]"][s +][LEFT][7"[DOWN]"][s +][8"[LEFT]"][s +][RVSOFF]"
2603 IFS(4)>0THENRETURN
2604 GOSUB600:PRINTSP$"LOOKING GLASS ROOM!":GOSUB2680:FORU=1TO200:NEXT
2605 POKEV+2,PX(5):POKEV+3,PY(5):PRINT"[HOME][PURPLE][7"[DOWN]"]"TAB(8);
2607 X=INT(5*RND(0)):Y=INT(5*RND(0)):Z=INT(5*RND(0))
2608 IFX=1ANDY=5AND(Y=3ORY=4)THEN2607
2610 FORI=1TO4:PRINT"[s W]";:GOSUB2640:NEXT:PRINT"[DOWN]";:FORI=1TO4:PRINT"[s W][DOWN][LEFT]";
2615 GOSUB2640:NEXT:PRINT"[LEFT]";:FORI=1TO4:PRINT"[s W][LEFT][LEFT]";:GOSUB2640:NEXT:PRINT"[UP]";
2620 FORI=1TO4:PRINT"[s W][UP][LEFT]";:GOSUB2640:NEXT:S(1)=0:POKEV+21,FNR(R):ND=0:K=5
2625 AX=PX(5):AY=PY(5)
2630 GOSUB2680:FORT=1TO200:NEXT:S(1)=2:POKEV+21,FNR(R)
2632 FORT=1TO200:NEXT:GOSUB1300:PRINTER$
2635 S3=S(3):S(3)=0:S7=S(7):S(7)=0:GOSUB1100:S(3)=S3:S(7)=S7
2637 GOSUB1200:SK=-1:RETURN
2640 POKESE+5,128:POKESE+4,33
2650 POKESE+1,100:POKESE,45:FORT=1TO99:NEXT:POKESE+4,32:FORT=1TO90:NEXT:RETURN
2680 POKESE,210:POKESE+1,140:POKESE+5,15:POKESE+4,129
2690 FORO=0TO150:NEXT:POKESE+4,32:RETURN
2700 F=E-5:POKEV+SP(E),PX(5):POKEV+SP(E)+1,PY(5):S(F)=2[UPARROW](F):R(F)=0
2705 POKEV+21,FNR(R):POKEV+16,FNX(R):R$(X,Y,Z)="0"+RIGHT$(R$(X,Y,Z),4):GOSUB600
2710 PRINTSP$"YOU FOUND THE "K$(E)"!":FORI=1TO600:NEXT:R(F)=S(F)
2715 POKEV+16,FNX(R):POKEV+SP(E),PX(E)
2720 POKEV+SP(E)+1,PY(E):GOSUB1900:SK=-1:RETURN
2800 S(0)=1:POKEV+1,PY(4)-10:POKEV+30,0:POKEV,0
2805 POKEV+28,3:POKEV+39,7:POKE2040,11:POKEV+21,FNR(R):GOSUB600
2808 IF(X=0ANDY=0)OR(X=1ANDY=5AND(Z=3ORY=4))THEN2607
2810 O=OO:SL=INT(6*RND(0))+7:IFSL=11THENSL=12
2811 FORI=5TO155STEP5:POKEV,I
2812 POKESE+1,160:POKESE+5,64:POKESE+4,129
2814 FORJ=0TO10:NEXT:POKESE+4,128
2815 IF(PEEK(V+30)AND3=3)THENGOSUB2870
2820 NEXT:POKEV+21,FNR(R)
2825 IFSV<>0THENR$(A(O),B(O),C(O))=CHR$(SV+76)+RIGHT$(R$(A(O),B(O),C(O)),4)
2830 IFSV<>0THENPRINTSP$"THE GRYPHON STOLE YOUR [c 8]"K$(SV+5)"[CYAN]!"
2832 A$=RIGHT$(STR$(A(O)),1):B$=RIGHT$(STR$(B(O)),1):C$=RIGHT$(STR$(C(O)),1)
2835 S(0)=0:POKEV+21,FNR(R):D$(SV)=A$+B$+C$:SV=0:SK=-1:RETURN
2870 IFS(SL-5)=0ORS(6)>0THENRETURN
2875 GOSUB2640:SV=SL-5:S(SL-5)=0:R(SL-5)=0:POKEV+21,FNR(R):OO=OO+1+15*(OO=15)
