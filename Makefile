#include directory
IDIR = include
#what compiler to use
CXX = g++
#compiler flags
CXXFLAGS = -I$(IDIR)

#directory for executable
EDIR = bin/openHouse.exe

#directories for object files and library files
ODIR = build
LDIR = lib
SDIR = src

#what libraries to use, like -lm
LIBS =

#header dependencies
_DEPS = 
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

#objects to make
_OBJ = main.o
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

#remakes header files
$(ODIR)/%.o: $(SDIR)/%.cpp $(DEPS)
	$(CXX) -c -o $@ $< $(CXXFLAGS)

#main make
baseballsim: $(OBJ)
	$(CXX) -o $(EDIR) $^ $(CXXFLAGS) $(LIBS)