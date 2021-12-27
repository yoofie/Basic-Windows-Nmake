# Super basic Windows NMAKE project

Visual Studio is bloated. I just want to have a minimal project template where I can make quick C++ programs meant for the Windows system.

This is a simple starter template project that uses Windows MSVC 2022 compiler and using the the standalone windows `NMAKE` utility. This template project also is meant to be used with VS code. Debugging is supported.

## Makefile

The MSVC compiler & NMAKE utility is different from the standard GCC stuff. This makes the makefile much simpler.

Just edit the makefile with the source paths and source files.

### Maybe todo
- Add library support
