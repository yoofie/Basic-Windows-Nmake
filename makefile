# Project Name
PROJECT = mainTest

#------------------------------------------------------------------------------
# PROJECT PATHS
#------------------------------------------------------------------------------
BIN_ROOT = bin
VENDOR_ROOT = vendor
LIB_ROOT = lib
SRC_ROOT = src
OBJ_ROOT = obj

#------------------------------------------------------------------------------
# Output Directories
#------------------------------------------------------------------------------

# For final Exe file
EXE_OUT_DIR = /Fe$(BIN_ROOT)/$(PROJECT)

# Output dir for .obj files
OBJ_OUT_DIR = /Fo$(OBJ_ROOT)/

#------------------------------------------------------------------------------
# C++ Compiler Flags
#------------------------------------------------------------------------------
CXXFLAGS = /nologo /EHsc /std:c++17 /Zi /MP /Fm $(EXE_OUT_DIR) $(OBJ_OUT_DIR)

#------------------------------------------------------------------------------
# Includes Paths (Bare minimum needed to make Windows console app work)
#------------------------------------------------------------------------------
CXX_INCLUDES_PATH =\
/I"F:\Apps\Microsoft Visual Studio 2019\VC\Tools\MSVC\14.29.30133\include" \
/I"C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\ucrt" \
/I"F:\Apps\Microsoft Visual Studio 2019\VC\Tools\MSVC\14.29.30133\lib\x64"

#------------------------------------------------------------------------------
# Source Files
#------------------------------------------------------------------------------
SRC_FILES = \
$(SRC_ROOT)/main.cpp \
$(SRC_ROOT)/settings/settings.cpp

SRC_INCLUDES =\
/I"$(SRC_ROOT)/" \
/I"$(SRC_ROOT)/settings" \

#------------------------------------------------------------------------------
# Vendor
#------------------------------------------------------------------------------

# Uncomment following lines when adding 3rd party libs under /vendor
#VENDOR_SRC_FILES =
#VENDOR_INCLUDES =

#------------------------------------------------------------------------------
# Linker Stuff
#------------------------------------------------------------------------------

LFLAGS=\
	/NOLOGO\
	/DEBUG\
	/SUBSYSTEM:CONSOLE\
#	/LIBPATH:"$(GTEST_BUILD_DIR)\lib\Release"\

#------------------------------------------------------------------------------
# Tools
#------------------------------------------------------------------------------
CXX = cl.exe
LINKER=link
RD=rd/s/q
RM=del/q

#-----------------------------------------------------------------------------
# Commands to build
#-----------------------------------------------------------------------------

# Rules to build bin
all: $(PROJECT).exe
	-@echo -e "\e[1;32mFinished Building $(PROJECT)! \e[0m"

# {$(SRC_ROOT)}.cpp{$(OBJ_ROOT)}.obj:
# 	@if not exist $(OBJ_ROOT) mkdir $(OBJ_ROOT)
# 	@$(CXX) $(CXX_INCLUDES_PATH) $(CXXFLAGS) $<

$(BIN_ROOT)\$(PROJECT).exe: $(OBJS)
	@if not exist $(OUTDIR) mkdir $(OUTDIR)
	$(LINKER) $(LFLAGS) $(LIBS) /PDB:"$(@R).pdb" /OUT:$@ $**

$(PROJECT).exe: $(VENDOR_SRC_FILES) $(SRC_FILES)
	@if not exist $(OBJ_ROOT) mkdir $(OBJ_ROOT)
	@echo -e "Building \e[1;35m"$@ "\e[0m from \e[1;36m"$**"\e[0m"
	@$(CXX) $(CXX_INCLUDES_PATH) $(VENDOR_INCLUDES) $(SRC_INCLUDES) $(CXXFLAGS) $**

# Full Clean - deletes directories
fclean:
	@if exist $(OBJ_ROOT) $(RD) $(OBJ_ROOT)
	@if exist $(BIN_ROOT)\$(TARGET) $(RM) $(BIN_ROOT)\$(TARGET)
	@if exist $(BIN_ROOT)\$(TARGET:exe=ilk) $(RM) $(BIN_ROOT)\$(TARGET:exe=ilk)
	@if exist $(BIN_ROOT)\$(TARGET:exe=pdb) $(RM) $(BIN_ROOT)\$(TARGET:exe=pdb)

# Regular clean - deletes output files
clean:
	@if exist $(BIN_ROOT)\$(TARGET) $(RM) $(BIN_ROOT)\$(TARGET)
	@if exist $(BIN_ROOT)\$(TARGET:exe=ilk) $(RM) $(BIN_ROOT)\$(TARGET:exe=ilk)
	@if exist $(BIN_ROOT)\$(TARGET:exe=pdb) $(RM) $(BIN_ROOT)\$(TARGET:exe=pdb)

p-% : ; @echo $* = "($*)"

.PHONY: all clean fclean .FORCE

# Reference NMAKE makefile that could be useful
# https://github.com/msmania/msvc-nmake-template/blob/master/Makefile.msvc
