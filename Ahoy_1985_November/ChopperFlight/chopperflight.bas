2 REM CHOPPER FLIGHT BY MIKE BUHIDAR JR.AND KEVIN WORAM
4 CN=0:POKE832,0:BC=53280:GOTO12
6 PRINTTAB(10);
8 D=D-8:POKECP,D:POKEPL,192:FORW=1TO12:NEXT:POKEPL,193
10 GOSUB122:FORW=1TO12:NEXT:RETURN
12 M1=0:GOSUB258:GOSUB132:FA=3:D=215
14 POKEV,164:POKEV+31,0:GOSUB302
16 PRINT"[CLEAR][WHITE]ENTER SKILL LEVEL (1-6)"
18 RM=14:WS=11:GOSUB258
20 GETSL$:IFVAL(SL$)<1ORVAL(SL$)>6THEN20
22 GOSUB132
24 POKEV+31,0:LS=192:Q=4:M=88:U=83
26 BR$="[RIGHT][RIGHT][c 2][RVSON][c R][c E][c R][c E][c R][c E][c R][c E][c R][c E]":B2$="[RIGHT][RIGHT][c 2][RVSON][c R][c E][c R][c E][c R][c E][c R][c E][c R][c E]":HD=4-SL/3:GH=HD-1:MD=INT(GH*30)
28 WN$="[RIGHT][RIGHT][c 2][RVSON][c E][c R][c E][RVSOFF] [RVSON][c R][c E][c R][RVSOFF] [RVSON][c E][c R][RVSOFF][c 5][s O][c Y][c V]":W2$="[c 5][c C][c Y][s P][c 2][RVSON][c E][c R][c E][RVSOFF] [RVSON][c R][c E][c R][RVSOFF] [RVSON][c E][c R][RVSOFF]":IFHD>3THENHD=3
30 TR$="[RIGHT][RIGHT][c 2][RVSON][c E][c R][c E][c 5][4"[c Y]"][c 2][c R][c E][c R][RVSOFF]":OS$="[RIGHT][RIGHT][c 2][RVSON][c R][c E][c R][RVSOFF][4" "][RVSON][c E][c R][c E][RVSOFF]"
32 F$="[RIGHT][c 5][s @][RVSON][10" "][RVSOFF][s L][RVSOFF]":SB=13+(2*SL):POKEZ,PEEK(Z)AND239:TD=(7-SL)*10
34 PRINT"[CLEAR][5"[DOWN]"]":RF$="[RIGHT][c 5][s P][RVSON][10"[c P]"][RVSOFF][s O]":PRINTRF$SPC(RM)RF$:POKEV+1,Y:POKEV,X
36 GOSUB374
38 PRINT"[UP]"BR$SPC(N)BR$
40 FORP=1TO5:PRINTWN$SPC(WS)W2$:PRINTBR$SPC(N)BR$:PRINTB2$SPC(N)B2$:NEXT
42 POKEZ,PEEK(Z)OR16
44 TI$="[6"0"]":FORL4=1TOSB:FORK=1TOQ
46 PRINTWN$SPC(WS)W2$:GOSUB80
48 PRINTBR$SPC(N)BR$:GOSUB80
50 PRINTB2$SPC(N)B2$:GOSUB80:NEXT
52 MP=INT(RND(1)*2)*RM:PRINTTAB(13+MP)"[c 1][UP][s X]":NEXT
54 PRINTWN$SPC(WS)W2$:GOSUB80
56 PRINTTR$SPC(15)TR$:GOSUB80:FORK=1TO3:PRINTOS$SPC(15)OS$:GOSUB80:NEXT
58 PRINTOS$SPC(5)"[c 5][6"[c P]"]"SPC(4)OS$
60 PRINTF$SPC(4)"[c 5][6"[s W]"]"SPC(4)F$;
62 PRINT"[c 5] [39"[c Y]"]":GOSUB80
64 CP=833:FORP=PEEK(V+1)TO211STEP2:D=D+8:POKEV+1,P:GOSUB8:NEXT:POKEPL,193
66 PRINT"[HOME][YELLOW][18"[DOWN]"][15"[RIGHT]"]YOU DID IT!":FORM=1TO2000:NEXT
68 ZZ=VAL(TI$):FORHH=0TO1000:NEXT:POKEV,0:GOSUB358
70 PRINT"[WHITE][6" "]PRESS TRIGGER TO PLAY AGAIN."
72 B=PEEK(JL)AND16:IFB=0THEN76
74 GOTO72
76 CLR:GOTO16
78 REM JOYSTICK ROUTINE
80 FR=(PEEK(JL)AND16)/16+1:ONFRGOTO110,116
82 SP=192:XD=HD:YD=0:RETURN
84 SP=194:XD=-HD:YD=0:RETURN
86 SP=LS:XD=0:YD=0:RETURN
88 SP=LS:YD=-HD:XD=0:RETURN
90 SP=LS:YD=HD:XD=0:RETURN
92 SP=194:XD=-HD:YD=-HD:RETURN
94 SP=194:XD=-HD:YD=HD:RETURN
96 SP=192:XD=HD:YD=-HD:RETURN
98 SP=192:XD=HD:YD=HD:RETURN
100 RETURN
102 POKEBC,8:RETURN
104 POKEBC,2:RETURN
106 POKEHF,20:X1=X:POKEV+40,2:GOSUB284
108 REM SLOWER FALL
110 GOSUB122:FA=FA+2:IFFA>50THEN252
112 GOSUB240:RETURN
114 REM FASTER FALL
116 GOSUB122:IFFA<1THENFA=2
118 FA=FA-2:GOSUB240:RETURN
120 REM SOUND
122 POKEHF,7:POKELF,53:POKEHF,0:POKELF,0:POKEHF,7:POKELF,163:POKELF,0:POKEHF,0
124 FORG1=0TO(50-FA):NEXT
126 POKEHF,7:POKELF,53:POKEHF,0:POKELF,0:POKEHF,7:POKELF,163:POKELF,0:POKEHF,0
128 RETURN
130 SPRITE INITIALIZATION
132 PRINT"[CLEAR]":POKEBC,0:POKEBC+1,0
134 V=53248:PL=2040:POKEV+21,7:X=170:Y=100:SP=192:POKEV+39,15:POKEPL,SP
136 POKEPL+1,196:POKEV+40,12
138 POKEPL+2,197:POKEV+28,4:POKEV+41,8:POKEV+37,7:POKEV+38,2
140 POKEV+29,4:POKEV+23,4:PRINT"[CLEAR][WHITE]READING DATA[3"."]"
142 IFPEEK(12660)=150THEN148
144 R=12288:FORG=1TO6:FORI=1TO63:READA:DC=DC+A:POKER,A:R=R+1:NEXT:R=R+1:NEXT
146 IFDC<>27628THENPRINT"[CLEAR]ERROR IN DATA. . .":STOP
148 JL=56320:N=15:Z=53265:CD=53269
150 POKEZ,PEEK(Z)AND247:POKEZ,(PEEK(Z)AND248)+7:RETURN
152 REM SPRITE DATA
154 DATA0,0,0,0,0,0,0,0,0,1,255,255,0,1,0,0,7,192,0,31,240
156 DATA192,63,136,224,63,4,255,255,2,255,255,130,0,63,130,0,47,252,0,15,248
158 DATA0,6,248,1,4,17,1,140,27,0,255,254,0,0,0,0,0,0,0,0,0
160 DATA0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,7,192,0,31,240
162 DATA192,63,136,224,63,4,255,255,2,255,255,130,0,63,130,0,47,252,0,15,248
164 DATA0,6,248,1,4,17,1,140,27,0,255,254,0,0,0,0,0,0,0,0,0
166 DATA0,0,0,0,0,0,0,0,0,255,255,128,0,128,0,3,224,0,15,248,0
168 DATA17,252,3,32,252,7,64,255,255,65,255,255,65,252,0,63,248,0,31,240,0
170 DATA12,96,0,136,32,128,216,49,128,127,255,0,0,0,0,0,0,0,0,0,0
172 DATA0,0,0,0,0,0,0,0,0,0,128,0,0,128,0,3,224,0,15,248,0
174 DATA17,252,3,32,252,7,64,255,255,65,255,255,65,252,0,63,248,0,31,240,0
176 DATA12,96,0,136,32,128,216,49,128,127,255,0,0,0,0,0,0,0,0,0,0
178 DATA0,0,0,0,62,0,0,119,0,0,239,128,0,207,128,0,255,128,0,0,0
180 DATA0,127,0,0,127,0,0,127,0,0,62,0,0,62,0,0,62,0,0,28,0
182 DATA0,127,0,0,235,128,0,193,128,1,128,192,1,128,192,1,0,64,1,0,64
184 DATA0,20,0,0,85,0,1,150,64,5,105,80,5,170,80,38,170,152,42,170,168
186 DATA46,170,184,91,190,229,122,255,173,119,255,221,90,255,165,27,190,232
188 DATA46,170,184
190 DATA42,170,168,5,170,80,5,105,80,1,150,64,0,85,0,0,20,0,0,0,0
192 REM SPRITE-DATA COLLISION
194 XP=X-24:YP=Y-54:CX=INT(XP/8):CY=INT(YP/8):BB=1104+CX+(40*CY)
196 P1=PEEK(BB):P2=PEEK(BB+1):P3=PEEK(BB +2):P4=PEEK(BB+3)
198 IFP1=UORP2=UORP3=UORP4=UTHENRETURN
200 IFP1=MORP2=MORP3=MORP4=MTHEN204
202 GOTO206
204 POKEH1,50:FORL=0TO49:NEXT:POKEH1,0 
206 IFP1=(M)THEN226
208 IFP2=(M)THEN228
210 IFP3=(M)THEN230
212 IFP4=(M)THEN232
214 REM PUT EXPLOSION HERE
216 E$="CRASHED INTO A BUILDING,"
218 POKEHF,7:X=X-12:Y=Y-10:POKEV+4,X:POKEV+5,Y:FORWA=1TO255:POKELF,WA:NEXT
220 POKEV+21,0
222 POKEHF,0:POKELF,0:GOSUB268
224 REM PICK UP MAN HERE
226 MS=MS+1:POKEBB,U:RETURN
228 MS=MS+1:POKEBB+1,U:RETURN
230 MS=MS+1:POKEBB+2,U:RETURN
232 MS=MS+1:POKEBB+3,U: RETURN
234 POKEHF,7:X=X-12:Y=Y-10:POKEV+4,X:POKEV+5,Y:FORWA=1TO255:POKELF,WA:NEXT
236 POKEHF,0:POKELF,0:RETURN
238 REM MOVEMENT ROUTINE
240 JV=N-(PEEK(JL)ANDN)+1:TL=INT((VAL(TI$))/TD)+1:GOSUB292
242 IFPEEK(V+31)ANDX=XTHENGOSUB192
244 ONTLGOSUB100,100,100,102,104,106
246 ONJVGOSUB86,88,90,100,84,92,94,100,82,96,98:LS=SP
248 POKEPL,SP:X=X+XD:POKEV,X:Y=PEEK(V+1)+YD:POKEV+1,Y:POKEPL,SP+1:RETURN
250 REM HOVERING ROUTINE
252 FR=(PEEK(JL)AND16)/16+1:IFFR=2THENFA=48:GOTO110
254 GOSUB240
256 GOSUB122:GOTO252
258 REM SOUND INITIALIZATION 
260 S=54272:FORQ=STOS+24:POKEQ,0:NEXT
262 POKES+24,15:POKES+5,18:POKES+6,33
264 POKES+4,129:HF=54273:LF=54272
266 POKES+12,255:POKES+13,255:POKES+11,17:H1=54280:L1=54279:RETURN
268 REM END ROUTINE
270 POKEBC,0:CN=PEEK(832):CN=CN+1
272 PRINT"[DOWN][CLEAR][WHITE]CHOPPER V -"CN;E$
274 PRINT"[DOWN]SEND FOR REPLACEMENT PILOT IMMEDIATELY![DOWN]":POKEV+5,0:POKE832,CN
276 FORK=0TO999:NEXT:ZZ=VAL(TI$):GOSUB358
278 GOTO70
280 REM MISSILE MOVING ROUTINE
282 POKEHF,20:X1=INT(RND(0)*68)+144
284 FORY1=255TO0STEP-10:POKELF,(255-Y1)
286 POKEV+2,X1:POKEV+3,Y1:IFPEEK(V+30)AND1=1THENIFPEEK(V+30)AND2=2THEN300 
288 NEXT:POKEV+31,0:M1=0:RETURN
290 REM MISSILE SELECT
292 M1=M1+1:IFM1<MDTHENRETURN
294 POKEHF,5:POKELF,5
296 IFM1>MD+10THEN282
298 RETURN
300 POKEV+2,0:E$="DESTROYED BY ENEMY FIRE,":GOTO218
302 REM TITLE SCREEN
304 FORL=1TO22:PRINT:NEXT
306 FORK=1TO3:PRINTTAB(19)"[c 5][s B]":NEXT
308 T$(1)="[CYAN][s U][3"[s C]"][s I][s U][s I][s U][s I][s U][s C][s C][s I][s U][s C][s C][s I][s U][s C][s C][s I][s U][s C][s C][s I][s U][3"[s C]"][s I]"
310 T$(2)="[s B] [s U][s I][6"[s B]"][s U][s I][s B][s B][s U][s I][s B][s B][s U][s I][s B][s B][s U][s C][s K][s B][s U][s I] [s B]"
312 T$(3)="[s B] [s B][s J][s K][s B][s J][s K][6"[s B]"][s J][s K][s B][s B][s J][s K][s B][s B][s J][s C][s I][s B][s J][s K] [s B]"
314 T$(4)="[s B] [s B][s U][s I][s B][s U][s I][6"[s B]"][s U][s C][s K][s B][s U][s C][s K][s B][s U][s C][s K][s B][s U][s I][s U][s K]"
316 T$(5)="[s B] [s J][s K][6"[s B]"][s J][s K][3"[s B]"]  [s B][s B]  [s B][s J][s C][s I][4"[s B]"]"
318 T$(6)="[s J][3"[s C]"][s K][s J][s K][s J][s K][s J][s C][s C][s K][s J][s K]  [s J][s K]  [s J][s C][s C][s K][s J][s K][s J][s K]"
320 T$(7)="":T$(8)="":J$(1)="[s U][3"[s C]"][s I][s U][s I]  [s U][s C][s C][s I][s U][s C][s C][s I][s U][s I][s U][s I][s U][4"[s C]"][s I]"
322 J$(2)="[s B][SS][s U][s C][s K][s B][s B][SS][SS][s J][s I][s U][s K][s B][s U][s C][s K][4"[s B]"][s J][s C][s I][s U][s C][s K]" 
324 J$(3)="[s B][SS][s J][s C][s I][s B][s B][3"[SS]"][s B][s B][SS][s B][s B][s U][s I][s B][s J][s K][s B][SS] [s B][s B][SS]" 
326 J$(4)="[s B][SS][s U][s C][s K][s B][s B][3"[SS]"][s B][s B][SS][5"[s B]"][s U][s I][s B][SS] [s B][s B][SS]"
328 J$(5)="[s B][SS][s B][SS][SS][s B][s J][s C][s I][s U][s K][s J][s I][s B][s J][s K][5"[s B]"][SS] [s B][s B][SS]" 
330 J$(6)="[s J][s C][s K][SS][SS][s J][s C][s C][s K][s J][s C][s C][s K][s J][s C][s C][s K][s J][s K][s J][s K][SS] [s J][s K][SS]"
332 BL$="[s B][19" "][s B]":N1$="[s B][WHITE]MICHAEL BUHIDAR JR.[PURPLE][s B]"
334 TP$="[PURPLE][4" "][s U][11"[s C]"][s I]":DB$="[s U][3"[s C]"][s K][WHITE]DESIGNED BY[PURPLE][s J][3"[s C]"][s I]"
336 AN$="[PURPLE][s B][8" "][WHITE]AND[PURPLE][8" "][s B]":N2$="[s B][WHITE][4" "]KEVIN WORAM[4" "][PURPLE][s B]"
338 CR$="[PURPLE][s B][WHITE]FOR AHOY! MAGAZINE [PURPLE][s B]":ED$="[s J][19"[s C]"][s K]"
339 SP$="[PURPLE][s B][19" "][PURPLE][s B]"
340 CP=V+1:FORL=1TO7:GOSUB8:PRINTTAB(5)T$(L):NEXT
342 FORL=1TO6:GOSUB8:PRINTTAB(7)J$(L):NEXT
344 PRINT:GOSUB8
