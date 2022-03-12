## Magazine info: 
One link to the magazine issue:  [Ahoy_1984_April](https://archive.org/details/ahoy-magazine-04)
____


## C-64 BUG REPELLENT (description from the magazine)

By Michael Kleinert and David Barron

If you're an Ahoy! reader, chances are that from time to time you type in
programs listed in the back. Unfortunately, man is not perfect and you've
probably made errors typing them in. Another sad but true fact is that you then
had to check the nonworking programs line by line, hoping to spot your errors.
This has never been fun, and never will be.
In order to alleviate this situation, we've developed a system for the
Commodore 64 that allows for a quick check of your program. Each line is
represented by two letters. You check your code against the code listed in
Ahoy!, and if there difference, an error exists in that line. This system
allows for a fast and easy error check before running the program.

In the program listings section you'll find the program we're speaking of,
titled C-64 Bug Repellent. It is a basic loader for an assembly language
program that resides at $C000 or 49152 (all you non-assemblers stop worrying
and keep reading!). Before you start to type in a program from Ahoy!, run
Bug Repellent. It will take care of what it has to and then disappear into a
cloud of floppy disks. Once it’s run, type NEW and proceed to type in the
Ahoy! program you've selected. When that’s done, save your program (do not run
it!) and type:

SYS 49152 [RETURN]

You will be asked if you want the line value codes displayed on the screen or
dumped to the printer. If you select printer, make sure it’s on. A table of
codes will be sent to your printer. If you select screen, the table will appear
there. This table will move quickly, too quickly for most mortals. In order to
satisfy its human operators the program allows you to pause the listing. This
is done by depressing and holding the SHIFT key. To pause for an extended
period of time, depress SHIFT LOCK. As long as it’s locked, the display remains
frozen.

Compare the table your machine generates to the table in Ahoy! that follows the
program you're entering. If you spot a difference, jot down the number of the
line where the contradiction occurs. When you're done with the comparison, go
back and LIST each line where an error occurred, spot the error, and correct it.

Another nifty feature of the program is its ability to inform you as to how
many lines your program is. This is another quick way to check whether you
entered every line, or missed a few.

We hope our program makes computing a bit more enjoyable for you. Don't put up
with disgusting bugs in your programs any longer!

____
## Lunar Lander by Anthony Wood

See magazine for notes on game play.  

Notes on typed-in version:  The first version of Bug Repellent did not take character position in the line into account when determining the checksum values to verify lines.  That makes it difficult to get screen graphics entered with special character codes entered correctly.  The typed-in code to date has the first level graphics worked out, but the second level screen has not been adjusted yet. I haven't beaten level one yet, so I haven't even seen level two at this point. I will need to create a shortcut in the code to be able to work out the graphics on that level.
In working out the level one graphics, there were a couple of changes to the lines that were made that drove different checksums than are published in the magazine.  Not sure why - typo in magazine maybe?
Those lines are:  
 - 1400 KI vs OI as printed in magazine
 - 1700 OI vs KI as printed in magazine
 - 1900 OI vs KI as printed in magazine

 Once I have the level 2 graphics worked out, I will plan to publish the checksums for the program using a later version of Bug Repellent that will detect spacing issues in program lines that define screen graphics.

____