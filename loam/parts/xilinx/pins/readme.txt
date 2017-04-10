SPARTAN-3E FPGA PINOUT INFORMATION
============================================================
Release Date:  18-OCT-2007, v1.4



This archive contains two directories.

*  The /tables directory contains comma-delimited ASCII text
   files for each package type.  These files can be viewed
   and sorted using a spreadsheet program, viewed using a
   text editor, or parsed with user-created scripts.  Each
   line in the file represents one pin on the package.

*  The /footprints directory contains Excel spreadsheets that
   show a footprint or map for each package type.


PINOUT TABLES
=============

The comma-delimited ASCII text files located in the /tables
directory list pinout information for a specific package
type.  Each line represents one pin on the package.

Pinout information for all Spartan-3E devices available in the
package appears on the line.

Here is a brief description of the fields available on each
line.

    SORT_PIN (QFP packages only)
    --------
    Sorting by SORT_PIN orders the pins sequentially on the 
    quad flat pack style packages such as the VQ100, the TQ144,
    and the PQ208.

    SORT_ROW (BGA packages only)
    --------
    Sorting by SORT_ROW orders the pins alphabetically on 
    the ball grid array packages.  Sorting by SORT_ROW is 
    sufficient for the smaller BGA packages.  However, the
    larger BGA packages have ROW indices such as "AA", "AB",
    etc.  An additional field, called SORT_ROW_#, is 
    provided on the large BGA packages to aid sorting.

    SORT_ROW_# (FG484 package only)
    ----------
    The SORT_ROW_# is similar to SORT_ROW, except that
    SORT_ROW_# is an integer value instead of an alphabetic
    value.  Used for sorting pins on the FG484 package.

    SORT_COLUMN (BGA packages only)
    -----------
    SORT_COLUMN is an integer value indicating the column
    number of the pin on a BGA package.

    PIN_NUMBER
    ----------
    The pin identifier for each pin on the package.

For a particular package, there may be multiple Spartan-3E
FPGAs available in that package.  For each pin, all the
possible Spartan-3E FPGAs are listed.  Each device is
represented by two fields on each line, XC3S**E_PIN and
XC3S**E_TYPE.  See the following descriptions.

    XC3S**E_PIN
    -----------
    The XC3S**E_PIN field indicates the name for a particular 
    package pin and for a particular Spartan-3E FPGA in
    that package.  The "**" characters here indicate a 
    wildcard character.  In the pinout table file, the "**"
    characters are replaced by an actual part number, such
    as XC3S250E.

    XC3S**E_TYPE
    -----------
    The XC3S**E_TYPE field indicates the pin type for a
    particular package pin and for a particular Spartan-3E
    FPGA in that package.  The listed type matches those
    described in Module 4 of the Spartan-3E data sheet. The 
    "**" characters here indicate a wildcard character.
    In the pinout table file, the "**" characters are 
    replaced by an actual part number, such as XC3S250E.

    BANK
    ----
    Sorting by BANK orders the pins by their associated I/O 
    bank.  The possible values for BANK include integers
    between 0 and 3, "VCCAUX", and "N/A".  "N/A" indicates
    that the pin is not associated with a specific bank.

    DIFFERENCE
    ----------
    Sorting by DIFFERENCE, descending order highlights any
    pinout differences between Spartan-3E FPGAs in the same
    package.  A period (.) indicates that the pins match
    identically.  "DIFF" indicates that the pins are different
    between packages.


HINTS
-----
To locate unconnected pins in a package type, sort by the TYPE
of the smallest device offered in the package footprint.  Any
unconnected pins on larger devices are a subset of those on
the smallest device.


FOOTPRINT DIAGRAMS
==================

The files in the \footprints directory are all Microsoft Excel
spreadsheet files.  These files present a common footprint for
each package type and show the pins on the package as viewed
from the top (QFP packages) or through the top of the package
(BGA packages).  Note the location of the pin 1 indicator on
QFP packages.

Each pin is labeled and color coded according to Module 4 of
the Spartan-3E data sheet.  No Connect (N.C.) pins are also
indicated with special symbols.

Most footprints were saved as 50% to 75% of normal size so that 
the entire footprint is visible on the screen.  To change the 
magnification, select View --> Zoom from the Excel top menu, 
then select the desired magnification factor.

Excel may issue a warning when you open the file indicating
that the file may contain macros.  Select either "Disable
Macros" or "Enable Macros".  There are no longer any active
macros in the Excel files.


REVISION HISTORY:
================

v1.0: Initial release.

v1.1: Added CP132 package.

v1.2: Updated VQ100 and TQ144 .csv files

v1.3: Miscellaneous corrections to .csv files

v1.4: Corrected G11 and bank 0 pop-up comments in FG400

