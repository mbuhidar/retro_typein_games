# retro-typein-games
Collaborative repository for typing-in, debugging, and converting 1980s
magazine type-in games and programs for use with Commodore emulators and
original hardware. I'm using this repository to test the library of type-in
tools I'm developing named `retro-typein-tools`.  Contributions are welcome if
you'd like to take on typing in one of the games for nostalgic purposes.
Suggestions on how to improve the type-in tools library are also very welcome.

## File Structure
Each magazine will have a directory with folders for each individual game.

Each game will have a directory containing three files:
- File as-typed from the magazine (including special character codes)
- File converted by tool for optional use with the VICE emulator Petcat tool
- File converted directly to binary format for use with emulator or original hardware

An example for C64 games from Ahoy magazine would be:
- gamename.ahoy (as-typed from magazine)
- gamename.bas (converted for use with Petcat if desired)
- gamename.prg (ready for use with emulator or C64)

Also included in each magazine directory is a README that contains a link to
existing historical archived magazine scans and descriptions for each game from
the magazine for quick reference.

# Retro Type-in Tools
## Installation of the tools library:
`pip install retro-typein-tools` Note: Requires Python 3.6 or later.

## Tool: debug_tokenize

The `debug_tokenize` tool is a debugger and converter for Commodore BASIC 
programs focused on tokenizing magazine type-in programs popular in the 1980s. 
Given an input text file containing BASIC source code in magazine type-in
format, it checks the typed line entries against line checksums that were 
printed in the magazines to insure program is bug-free.  It then outputs two
files using the basename from the input file. The first file is for use with a
separate tokenizer if desired and the second file is an executable for direct
use with an emulator or original hardware.

### Usage

After installation, use `debug_tokenize` directly from the command line - 
consult the help for the latest usage: 

*Note: Currently only options for C64 load address, Basic v2.0, and Ahoy
debugger from April 1984 through April 1987 issues are available (defaults).
More options to come in future releases.*

```
debug_tokenize [-l load_address] [-v basic_version] [-s source_format] input_file
```

```
positional arguments:
  input_file            Specify the input file name including path
                        Note:  Output files will use input file basename
                        with extensions '.pet' for petcat-ready file and
                        '.prg' for Commodore executable file format.

optional arguments:

  -h, --help            show this help message and exit

  -l load_address, --loadaddr load_address
                        Specifies the target BASIC memory address when loading:
                        - 0x0801 - C64 (default)
                        - 0x1001 - VIC20 Unexpanded
                        - 0x0401 - VIC20 +3K
                        - 0x1201 - VIC20 +8K
                        - 0x1201 - VIC20 +16
                        - 0x1201 - VIC20 +24K

  -v basic_version, --version basic_version
                        Specifies the BASIC version for use in tokenizing file.
                        - 1 - Basic v1.0  PET
                        - 2 - Basic v2.0  C64/VIC20/PET (default)
                        - 3 - Basic v3.5  C16/C116/Plus/4
                        - 4 - Basic v4.0  PET/CBM2
                        - 7 - Basic v7.0  C128

  -s source_format, --source source_format
                        Specifies the source BASIC file format:
                        pet - use standard pet control character mnemonics
                        ahoy - use Ahoy! magazine control character mnemonics (default)
```


As an example for an Ahoy! magazine file:

```
Input:    basename.ahoy

Output1:  basename.bas (VICE petcat-ready BASIC source code with special
characters converted to VICE petcat special character codes)

Output2:  basename.prg (tokenized file that can be run on a Commodore 
computer or on an emulator like VICE)
```
---
### Using the output files

If installed, you can use the VICE petcat utility to tokenize the BASIC file
by typing:

```
petcat -w2 -o program.prg -- program.bas 
```

Generates an executable program.prg file that can be run on a Commodore 
computer or emulator.  In this example, it tokenizes for Commodore BASIC v2.

You can also run the .prg file generated directly from the `debug_tokenizer`
program by running it with the following command (must have VICE installed):

```
x64sc -basicload program.prg &
```

Of course, you can also use the .prg file to run on original hardware.
