# retro-typein-games
A collaborative repository for typing-in, debugging, and converting 1980s
magazine type-in games and programs for use with Commodore emulators and
original hardware.  Also, using this repository to test the library of type-in
tools I'm developing named `retro-typein-tools`.  Contributions are welcome if
you'd like to take on typing in one of the games for nostalgic purposes.
Suggestions on how to improve the type-in tools library are also very welcome.

## File Structure
Each magazine will have a directory with folders for each individual game.

Each game should have a directory containing two files:
- File as-typed from the magazine (including special character codes)
- File converted directly to binary format for use with emulator or original hardware

An example for C64 games from Ahoy magazine would be:
- gamename.ahoy (as-typed from magazine)
- gamename.prg (ready for use with emulator or C64)

Also included in each magazine directory is a README that contains a link to
existing historical archived magazine scans and descriptions for each game from
the magazine for quick reference.

# retro-typein-tools
Tools for typing-in, debugging, and converting 1980s magazine type-in games and 
programs for use with Commodore emulators and original hardware.  Feel free to
report any issues with the tools in the [retro-typein-tools Github repository](https://github.com/mbuhidar/retro_typein_tools).

## Installation
`pip install retro-typein-tools`

## Tool: debug_tokenize

The `debug_tokenize` tool is a debugger and converter for Commodore BASIC 
programs focused on tokenizing magazine type-in programs popular in the 1980s. 
Given an input text file containing BASIC source code in magazine type-in
format, it checks the typed line entries against line checksums that were 
printed in the magazines to insure program is bug-free.  It then outputs an
executable .prg file for direct use with an emulator or original hardware.

### Usage

After installation, use `debug_tokenize` directly from the command line - 
consult the help for the latest usage: 

**Note:** Currently the only implemented options are for C64 load address,
and the first three of the four Ahoy debugger versions.
More options to come in future releases.

```
debug_tokenize [-l load_address] [-s source_format] input_file
```

```
positional arguments:
  input_file            Specify the input file name including path
                        Note:  Output files will use input file basename
                        with extensions '.bas' for petcat-ready file and
                        '.prg' for Commodore run file format.

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

  -s source_format, --source source_format
                        Specifies the magazine source for conversion and checksum:
                        ahoy1 - Ahoy magazine (Apr-May 1984)
                        ahoy2 - Ahoy magazine (Jun 1984-Oct 1984) (default)
                        ahoy3 - Ahoy magazine (Nov 1984-)
```

As an example for an Ahoy! magazine file:

```
Input:    basename.ahoy

Output:  basename.prg (tokenized file that can be run on a Commodore 
computer or on an emulator like VICE)
```

### Notes for entering programs from Ahoy issues prior to November 1984:

In addition to the special character codes contained in braces 
in the magazine, Ahoy also used a shorthand convention for 
specifying a key entry preceeded by either the Shift key or the 
Commodore key as follows:

    Underlined characters - preceed entry with Shift key
    Overlined characters - preceed entry with Commodore key

Standard keyboard letters should be typed as follows for these two cases.

    {s A}, {s B}, {s *} etc.
    {c A}, {c B}, {c *}, etc.

There are a few instances where the old hardware has keys not
available on a modern keyboard or are otherwise ambiguous.
Those should be entered as follows:

    {EP} - British Pound symbol
    {UP_ARROW} - up arrow symbol
    {LEFT_ARROW} - left arrow symbol
    {PI} - Pi symbol
    {s RETURN} - shifted return
    {s SPACE} - shifted space
    {c EP} - Commodore-Bristish Pound symbol
    {s UP_ARROW} - shifted up arrow symbol

After the October 1984 issue, the over/under score representation was 
discontinued as was the use of braces as delineators.  After October 1984, the
braces were replaced by brackets, however, either can be used while typing in
the programs for any issue.  The special characters can be typed as listed
in the magazines after that issue.

### Using the output files

You can run the .prg file generated by the `debug_tokenizer` program by
running it with the VICE emulator with the following command (must have VICE
installed):

```
x64sc -basicload program.prg &
```

Of course, you can also run the .prg file on original hardware.
