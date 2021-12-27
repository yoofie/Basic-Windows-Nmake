# Super basic Windows NMAKE project

Visual Studio is bloated. I just want to have a minimal project template where I can make quick C++ programs meant for the Windows system.

This is a simple starter template project that uses Windows MSVC 2022 compiler and using the the standalone windows `[NMAKE][1]` utility. This template project also is meant to be used with VS code. Debugging is supported.

## Makefile

The MSVC compiler & NMAKE utility is different from the standard GCC stuff. This makes the makefile much simpler.

Just edit the makefile with the source paths and source files.

## How to use
Once the VS Studio CLI SDK is installed, simply run `nmake /NOLOGO all` in the project root dir to build the project.

### Maybe todo
- Add library support


[1]:https://docs.microsoft.com/en-us/cpp/build/reference/nmake-reference?view=msvc-170
