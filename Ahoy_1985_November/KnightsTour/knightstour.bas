100 REM * KNIGHT'S TOUR / COMMODORE 64 / RAMELLA
101 POKE 53280,0: POKE 53281,0
102 PRINT "[CLEAR][c 3]": V=53248: POKE V+34,4: POKE 53269,4: POKE 2042,13
103 FOR N=0 TO 62: READ A: POKE 832+N,A: NEXT: L=53: H=28
105 PRINT"[WHITE]";SPC(33); "KNIGHT": PRINT: PRINT SPC(33);"TOUR": PRINT "[RED]"
106 PRINT: PRINT: PRINT: PRINT: PRINT "[BLUE]":PRINT SPC(33);"SCORE:": PRINT "[HOME]";
107 PRINT "[RED]"
110 T$="[s O][3"[c Y]"][s O][3"[c Y]"][s O][3"[c Y]"][s O][3"[c Y]"][s O][3"[c Y]"][s O][3"[c Y]"][s O][3"[c Y]"][s O][3"[c Y]"][c H]"
112 N$="[c H][3" "][c H][3" "][c H][3" "][c H][3" "][c H][3" "][c H][3" "][c H][3" "][c H][3" "][c H]"
115 FOR X=1 TO 8: PRINT T$: PRINT N$: PRINT N$: NEXT
116 PRINT"[UP][s L][3"[c P]"][s L][3"[c P]"][s L][3"[c P]"][s L][3"[c P]"][s L][3"[c P]"][s L][3"[c P]"][s L][3"[c P]"][s L][3"[c P]"]"
120 GOSUB 5000
150 GETA$: IF A$<>"A" AND A$<>"Z" AND A$ <>"," AND A$<>"." AND A$<>"K" THEN 150
152 IF A$="K" THEN 245
155 IF H=252 AND A$="." THEN 150
160 IF A$="." THEN FOR H=H TO H+32 STEP 4 
165 IF H=28 AND A$="," THEN 150
170 IF A$="," THEN FOR H=H TO H-32 STEP -4
175 IF L=221 AND A$="Z" THEN 150
180 IF A$="Z" THEN FOR L=L TO L+24 STEP 2 
185 IF L=53 AND A$="A" THEN 150
190 IF A$="A" THEN FOR L=L TO L-24 STEP -2
200 GOSUB 5000: NEXT
210 IF A$="." THEN H=H-4: P=P+4
220 IF A$="," THEN H=H+4: P=P-4 
230 IF A$="Z" THEN L=L-2: P=P+120
235 IF A$="A" THEN L=L+2: P=P-120
240 GOTO 150
245 S$="": H1=H: L1=L: P1=P
250 GET A$: IF A$<>"A" AND A$<>"Z" AND A $<>"," AND A$<>"." THEN 250
252 S$=S$+A$
255 IF H=252 AND A$="." THEN 385
260 IF A$="." THEN FOR H=H TO H+32 STEP 4
265 IF H=28 AND A$="," THEN 385
270 IF A$="," THEN FOR H=H TO H-32 STEP -4
275 IF L=221 AND A$="Z" THEN 385
280 IF A$="Z" THEN FOR L=L TO L+24 STEP 2
285 IF L=53 AND A$="A" THEN 385
290 IF A$="A" THEN FOR L=L TO L-24 STEP -2
300 GOSUB 5000: NEXT
310 IF A$="." THEN H=H-4: P=P+4
320 IF A$="," THEN H=H+4: P=P-4 
330 IF A$="Z" THEN L=L-2: P=P+120
335 IF A$="A" THEN L=L+2: P=P-120
337 IF LEN(S$)=3 THEN 350
340 GOTO 250
350 IF S$="AA." OR S$=".AA" OR S$="A.." OR S$="..A" OR S$="..Z" THEN W=1
360 IF S$="Z.." OR S$="ZZ." OR S$=".ZZ" OR S$="ZZ," OR S$=",ZZ" THEN W=1
370 IF S$=",,Z"OR S$="Z,,"OR S$=",,A"OR S$="A,,"OR S$="AA,"OR S$=",AA"THEN W=1
375 IF PEEK(1024+P)=81 THEN 385
380 IF W=1 THEN W=0: GOTO 400
385 P=P1: H=H1: L=L1: GOSUB 5000: W=0: GOTO 245
390 GOTO 245
400 FOR G=P TO P+80 STEP 40: FOR R=G TO G+3
410 POKE 1024+R,81: POKE 55296+R,14: NEXT R,G 
411 TL=TL+1: TL$=STR$(TL): FOR JF=2 TO LEN(TL$)
412 POKE 1537+JF,ASC(MID$(TL$,JF,1)): NEXT JF
420 GOTO 245
5000 POKE V+4,H: POKE V+5,L: RETURN 
10000 DATA 0,31,128,0,255,224,1,255,240
10010 DATA 3,255,248,7,231,254,15,255,252
10020 DATA 31,255,252,63,255,255,127,255,252
10030 DATA 255,255,254,255,255,255,127,159,252
10040 DATA 60,15,254,0,31,255,0,31,252 
10050 DATA 0,63,254,0,255,255,1,255,252 
10060 DATA 7,255,254,31,255,255,63,255,255
10070 END