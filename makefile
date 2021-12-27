

PROJECT = mainTest

CXX = cl.exe
LINKER=link
RD=rd/s/q
RM=del/q
#------------------------------------------------------------------------------
# PROJECT PATHS
#------------------------------------------------------------------------------
BIN_ROOT = bin
VENDOR_ROOT = vendor
LIB_ROOT = lib
SRC_ROOT = src
OBJ_ROOT = obj
DEBUG_ROOT = debug

#------------------------------------------------------------------------------
# Language Settings
#------------------------------------------------------------------------------
C_SRC_SUFFIX = c
CXX_SRC_SUFFIX = cpp
HEADER_FILE_SUFFIX = h

CXXFLAGS = /nologo /EHsc /std:c++17 /Zi /MP /Fm /Fe$(BIN_ROOT)/$(PROJECT) /Fo$(OBJ_ROOT)/

LDFLAGS = 
#------------------------------------------------------------------------------
# Includes Paths
#------------------------------------------------------------------------------
CXX_INCLUDES_PATH =\
/I"F:\Apps\Microsoft Visual Studio 2019\VC\Tools\MSVC\14.29.30133\include" \
/I"C:\Program Files (x86)\Windows Kits\10\Include\10.0.19041.0\ucrt" \
/I"F:\Apps\Microsoft Visual Studio 2019\VC\Tools\MSVC\14.29.30133\lib\x64" \
/I"$(SRC_ROOT)/" \
/I"$(SRC_ROOT)/settings" \


#SRC_INCLUDES = {$(addprefix "/I",$(CXX_INCLUDES_PATH))}
SRC_FILES = \
$(SRC_ROOT)/main.cpp \
$(SRC_ROOT)/settings/settings.cpp


#------------------------------------------------------------------------------
# Includes Paths
#------------------------------------------------------------------------------

LFLAGS=\
	/NOLOGO\
	/DEBUG\
	/SUBSYSTEM:CONSOLE\
#	/LIBPATH:"$(GTEST_BUILD_DIR)\lib\Release"\

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

$(PROJECT).exe: $(SRC_FILES)
	@if not exist $(OBJ_ROOT) mkdir $(OBJ_ROOT)
	@echo -e "Building \e[1;35m"$@ "\e[0m from \e[1;36m"$**"\e[0m"
	@$(CXX) $(CXX_INCLUDES_PATH) $(CXXFLAGS) $**

clean:
	@if exist $(OBJ_ROOT) $(RD) $(OBJ_ROOT)
	@if exist $(BIN_ROOT)\$(TARGET) $(RM) $(BIN_ROOT)\$(TARGET)
	@if exist $(BIN_ROOT)\$(TARGET:exe=ilk) $(RM) $(BIN_ROOT)\$(TARGET:exe=ilk)
	@if exist $(BIN_ROOT)\$(TARGET:exe=pdb) $(RM) $(BIN_ROOT)\$(TARGET:exe=pdb)

p-% : ; @echo $* = "($*)"

.PHONY: all clean fclean .FORCE

# Reference NMAKE makefile that could be useful
# https://github.com/msmania/msvc-nmake-template/blob/master/Makefile.msvc
