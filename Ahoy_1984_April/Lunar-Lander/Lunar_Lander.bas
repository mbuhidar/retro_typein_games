5 rem dec. 19, 1983
6 poke 53280,8:poke53281,0
10 print"{clr}{wht}{down}{down}{down}{down}             lunar lander"
20 print"{down}          (c) copyright 1983"
30 print"            by anthony wood"
50 poke55,248:poke56,157:rem 40440
60 clr:s=54272
100 v=53248:s1=64*13:s2=64*14:s3=64*15:k=2040:sr=40444
110 forz=0to39:reada:poke40456+z,a
120 pokes2+z,a:pokes3+z,a:next
130 for z=40to62:reada:poke40456+z,a:next
132 forz=40to62:reada:pokes2+z,a:next
134 forz=40to62:reada:pokes3+z,a:next
135 forz=1to63*3:reada:poke40518+z,a:next
137 forz=0to13:reada:poke40441+z,a:next
138 sys40441
139 fu=5000:f2=0:l1=0:l2=0:sc=0:gosub700
140 gosub900:pokev+39,1:pokek,13:pokev,0:pokev+1,0:pokev+21,1
150 h=15:e=5:x=30+int(rnd(0)*100):y=30:f(0)=13:f(1)=13:f(2)=14
160 f(3)=15:m=1
200 j=peek(56320):p=peek(197):iffu=0thenb=0:m=1:pokes+1,0:goto220
210 ifp=60or(jand16)=0thenb=b+1:goto213
211 b=0:m=1:pokes+4,0
213 ifm<>1thenpokes+4,129
215 if p=7or(jand4)=0thenh=h-1:print"{home}{down}{rght}<<":fu=fu-1
216 if p=2or(jand8)=0thenh=h+1:print"{home}{down}{rght}>>":fu=fu-1
220 gosub760:ifb=6orb=1thenm=m+1
240 e=e+gr-m*1.65:fu=fu-(m-1)*10:iffu<0thenfu=0
245 x=x+int(h/6):y=y+int(e/5)
250 ifx<5thenx=5
252 ify>251theny=252:gosub800:y=35:x=29:fu=5000:f2=1:gosub5000
255 ify<35theny=35:e=3
256 ifx>319thenx=319
260 pokek,13:z=peek(v+31):gosub800
266 ifpeek(v+31)<>0then300
270 pokek,f(m-fl):iffl=0thenfl=1:goto200
280 fl=0:goto200
300 iff2=1then440
310 ify<149then270
320 ify<227 orx<099or x>123 ore>9orabs(h)>10then330
322 if ll=1andl2=1then330
325 y=227:gosub800:sc=sc+100:l2=1
327 goto400
330 ify<177 orx<197 orx>203 ore>9 orabs(h)>10then340
335 y=179:gosub800:sc=sc+500:l1=1:goto400
340 pokes+4,129:v2=11:pokesr,63+8:sys40441:gosub820:pokesr,126+8:sys40441
350 gosub840:pokesr,189+8:sys40441:gosub840:pokes+4,0:pokes+24,15:pokes+1,2
360 pokev+21,0:pokesr,8:sys40441:goto410
400 pokes+4,0:gosub750:print"{home} landed!!"
410 geta$:ifa$<>"{f7}"then410
415 pokev+21,0:print"{home}       "
420 iffu=0then 460
425 iff2=1theny=10:x=29:e=5:h=0:gosub5000:pokev,x:pokev+1,y:pokev+21,1:goto160
435 goto140
440 ifx<230orx>242ory<121ory>130ore>9orabs(h)>11then340
450 f2=0:sc=sc+1000:l1=0:l2=0:fu=4500:goto400
460 print"{clr}":print:print"do you want to play again?"
470 geta$:ifa$=""then470
480 ifa$="y"then139
490 ifa$<>"n"then470
500 pokes+4,0:print"{clr}":end
700 print:print:print"  enter gravity strength ({rvon}1{rvof},{rvon}2{rvof}, or {rvon}3{rvof})"
701 pokes+5,129:pokes+6,216:pokes+24,15          .
702 pokes,200:pokes+4,0:pokes+1,2
710 geta$:ifa$=""then710
715 ifa$="1"thengr=3:return
720 ifa$="2"thengr=3.6:return
730 ifa$="3"thengr=4.25: return
740 goto710
750 print"{home}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}score";sc;
760 print"{home}{down}{rght}  {home}";tab(28);"fuel     {left}{left}{left}{left}{left}";fu;:return
800 pokev+1,y:ifx<256thenpokev,x:pokev+16,0:return
810 pokev,x-256:poke53264,127:return
820 pokes+1,3:forx=1to4:pokes+24,v2:fory=1to15:next:v2=v2+1
830 next:return
840 forx=1to7:pokes+24,v2:fory=1to9:next:v2=v2-1:next:return
900 print"{clr}":gosub750:print:fory=0to9:a=rnd(0)
910 ifa>.3thenprinttab(rnd(0)*39);"."
920 if a<=.3thenprint
930 next:print:print:print
1000 print"                              {rvon}{shift-pound}{c=-*}{rvof}       "
1100 print"                             {rvon}{shift-pound}  {c=-*}{rvof}      "
1200 print"                           {rvon}{shift-pound}      {c=-*}{rvof}    "
1300 print"                         {rvon}{shift-pound}          {c=-*}{rvof}  "
1400 print"                       {rvon}{shift-pound}             {c=-*}{rvof} "
1500 print"                   {rvon}{shift-pound}500               {c=-*}{rvof}"
1600 print"    {rvon}{shift-pound}{c=-*}{rvof}              {rvon}{shift-pound}                  {rvof}"
1700 print"   {rvon}{shift-pound}  {c=-*}{rvof}           {rvon}{shift-pound}                    {rvof}"
1800 print"  {rvon}{shift-pound}     {c=-*}{rvof}       {rvon}{shift-pound}                      {rvof}"
1900 print"{rvon}{shift-pound}         {c=-*}{rvof}   {rvon}{shift-pound}                        {rvof}"
1910 print"{rvon}           100                         {rvof}";
1920 ifl2=1andl1=1thenprint"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}{c=-*}{rvof}   {rvon}{shift-pound}{rvof}";
1930 return
1999 rem lander sprites
2000 data 0,255,0,0,255,0,7,255,224,7
2010 data 255,224,7,255,224,0,255,0,0,255
2020 data 0,15,255,240,15,255,240,15,255,240
2030 data 3,255,192,3,60,192,6,126,96,12
2040 rem no flame
2050 data 0,48,24,0,24,0,0,0,0,0
2060 data 0,0,0,0,0,0,0,0,0,0,0,0,0
2070 rem small flame
2080 data 0,48,24,60,24,0,102,0,0,60
2090 data 0,0,24,0,0,24,0,0,0,0,0,0,0
2100 rem big flame
2110 data 0,48,24,126,24,0,219,0,0,219
2120 data 0,0,102,0,0,60,0,0,24,0,0,24,0
2130 rem explosion
2140 data 0,0,0,0,0,0,0,0
2150 data 0,0,0,0,0,0,0,0
2160 data 64,0,6,72,0,0,24,0
2170 data 12,224,0,0,228,0,0,0
2180 data 0,13,80,0,0,0,0,0
2190 data 0,0,0,0,0,0,0,0,0,0,0,0,0
2200 data 0,0,0,0,0,0,0,0,0,0
2210 rem frame 2 of explosion
2220 data 0,0,0,0,0,0,0,0
2230 data 0,0,128,0,24,131,0,24
2240 data 3,0,0,0,0,0,0,0
2250 data 48,224,0,48,227,0,0,0
2260 data 0,0,0,0,28,0,0,24
2270 data 152,0,2,8,0,0,64,0
2280 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
2290 rem frame 3 of explosion
2300 data 0,0,0,0,0,0,0,0
2310 data 0,0,128,128,24,129,0,24
2320 data 0,0,0,0,0,0,0,0
2330 data 64,0,0,64,0,112,0,0
2340 data 0,0,0,0,32,0,208,32
2350 data 0,0,0,0,0,0,2,0
2360 data 4,65,0,4,64,128,0,0
2370 data 0,0,0,0,0,0,0
2380 rem block move
2390 data 162,0,189,8,158,157,64,3,232
2400 data 224,63,208,245,96
4999 rem draw cave
5000 print"{clr}":gosub750:print:pokes+4,0:pokes+1,2
5005 print"     {rvon}                                  "
5010 print"     {rvon}                                  "
5020 print"     {rvon}                                  "
5030 print"     {rvon}                                  "
5040 print"     {rvon}                                  "
5050 print"     {rvon}                  {rvof}{shift-pound}  {c=-*}{rvon}  {rvof}{shift-pound}  {c=-*}{rvon}  "
5060 print"     {rvon}                  {rvof}               "
5065 print"     {rvon}                  {rvof}               "
5070 print"     {rvon}                  {rvof}               "
5080 print"     {rvon}                  {rvof}  {c=-p}{c=-p}{c=-p}{c=-p}        "
5090 print"     {rvon}                         {rvof}        "
5100 print"     {rvon}              1000      {rvof})        "
5200 print"     {rvon}                       {rvof})         "
5210 print"     {rvon}                      {rvof})          "
5220 print"     {rvon}                     {rvof})           "
5230 print"     {c=-*}{shift-pound}{c=-*}{shift-pound}{c=-*}{shift-pound}{c=-*}{shift-pound}{rvon}  {rvof}{shift-pound}{c=-*}  {rvof}{shift-pound}{c=-*}{shift-pound}{c=-*}{rvon}  {rvof}{shift-pound}{c=-*}{shift-pound}      "
5240 print"                 {c=-*}{shift-pound}                {rvon}{shift-pound} {rvof}"
5250 print"                                   {rvon}{shift-pound}  {rvof}"
5260 print"                                  {rvon}{shift-pound}   {rvof}"
5270 print"                                 {rvon}{shift-pound}    {rvof}"
5280 print"                               {rvon}{shift-pound}      {rvof}"
5285 print"                 {rvon}{shift-pound}{c=-*}{rvof}               {rvon} {rvof}"
5290 print"     {rvon}                                 {rvof}"
5295 print"     {rvon}                                 {rvof}";
5300 print"{home}{down}{down}{down}";tab(38);"{rvon} {down}{left} {down}{left} {down}{left} {down}{left} {down}{left} {down}{left} {down}{left} {down}{left} {down}{left} {down}{left} {down}{left} {down}{left} {down}{left} {down}{left} {down}{left} {rvof}";
6000 return
