# NDS Toolkit - A suite of tools for hacking Nintendo video games.
# Copyright (C) 2012 Vinny Diehl
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

# @file Makefile - Contains instructions for building the application.
#
# make
# Builds application.
#
# make debug
# Builds application with debugging symbols and DEBUG defined.
#
# make rebuild
# Rebuilds the application, including all object files.
#
# make rebuild-dbg
# Rebuilds the application, including all object files, to the debug target.
#
# make clean
# Deletes the object files.
#
# make distclean
# Removes all configurations options and resets to default.
# Run this before committing unless you have a good reason not to.
#
# make erase
# make delete
# Deletes the build directory and all files within.

# The following section is generated by the configuration script. Do not
# edit its contents unless you know what you're doing, and do not edit the
# designators surrounding it or the configuration script will break.
### BEGIN CONFIG ###
SETUP = default
### END CONFIG ###

# Parse preset config setups. Note that if the page is to be included,
# the name of the object file is placed into the variable; if it is to be
# excluded, it will be left blank. OBJS will read all of these, and
# only the ones selected for inclusion will be compiled.
ifeq ($(SETUP),default)
    BUTTON_ACTIVATOR_GENERATOR = ButtonActivatorGenerator.o \
				 pgButtonActivatorGenerator.o
    POINTER_SEARCHER = PointerSearcher.o PSR.o pgPointerSearcher.o
    CODE_PORTER = CodePorter.o pgCodePorter.o
    CODE_COMPRESSOR = LoopCodeGenerator.o \
		      PatchCodeBuilder.o \
		      pgCodeCompressor.o
    CODE_BEAUTIFIER = pgCodeBeautifier.o
endif

# Tell pages/Makefile to enforce the configuration. That Makefile requires
# this enforcement so that it can still be built incrementally.
PAGESMAKEVARS = ENFORCE_CONFIG=1 \
		BUTTON_ACTIVATOR_GENERATOR="$(BUTTON_ACTIVATOR_GENERATOR)" \
		POINTER_SEARCHER="$(POINTER_SEARCHER)" \
		CODE_PORTER="$(CODE_PORTER)" \
		CODE_COMPRESSOR="$(CODE_COMPRESSOR)" \
		CODE_BEAUTIFIER="$(CODE_BEAUTIFIER)"

# Root Source Directory
ROOT = .

# Output Name
NAME = NDSToolkit
ALTNAME = ndstoolkit

# Output Directories
BUILDROOT = $(ROOT)/build
BINDIR = $(BUILDROOT)/bin
OBJDIR = $(BUILDROOT)/obj
INSTALL = /usr/bin

# Output Files
EXE = $(BINDIR)/$(NAME)
OBJ = Clipboard.o CodeParser.o Downloader.o FileHandler.o \
      MenuBar.o Program.o frmMain.o \
      $(BUTTON_ACTIVATOR_GENERATOR) $(POINTER_SEARCHER) \
      $(CODE_PORTER) $(CODE_COMPRESSOR) $(CODE_BEAUTIFIER)
OPATHS = $(addprefix $(OBJDIR)/,$(OBJ))

# Compatability Library Paths
COMPAT = compatibility
WX29 = $(COMPAT)/wx2.9
WX29BUILD = $(WX29)/build

# Library Object Files
LIBOPATHS = $(WX29BUILD)/arrstr.o

# Make
MAKE = make
MAKETGT =

.PHONY: all build-run debug distclean configure clean delete erase install \
        rebuild rebuild-dbg rebuild-run rebuild-debug-run run uninstall

all: configure
all: $(EXE)

debug: MAKETGT += debug
debug: configure
debug: $(EXE)

configure:
	@mkdir -p $(OBJDIR)

$(EXE): $(OPATHS) $(LIBOPATHS)
	$(MAKE) -f linker.mk $(MAKETGT)

### Object Builds

# app

$(OBJDIR)/Program.o:
	$(MAKE) -C app $(MAKETGT)

# frames

$(OBJDIR)/frmMain.o:
	$(MAKE) -C frames $(MAKETGT)

# base

$(OBJDIR)/MenuBar.o:
	$(MAKE) -C base $(MAKETGT)

# pages

$(OBJDIR)/pgButtonActivatorGenerator.o:
	$(MAKE) -C pages $(MAKETGT) $(PAGESMAKEVARS)
$(OBJDIR)/ButtonActivatorGenerator.o:
	$(MAKE) -C pages $(MAKETGT) $(PAGESMAKEVARS)

$(OBJDIR)/pgCodeCompressor.o:
	$(MAKE) -C pages $(MAKETGT) $(PAGESMAKEVARS)
$(OBJDIR)/LoopCodeGenerator.o:
	$(MAKE) -C pages $(MAKETGT) $(PAGESMAKEVARS)
$(OBJDIR)/PatchCodeBuilder.o:
	$(MAKE) -C pages $(MAKETGT) $(PAGESMAKEVARS)

$(OBJDIR)/pgCodePorter.o:
	$(MAKE) -C pages $(MAKETGT) $(PAGESMAKEVARS)
$(OBJDIR)/CodePorter.o:
	$(MAKE) -C pages $(MAKETGT) $(PAGESMAKEVARS)

$(OBJDIR)/pgPointerSearcher.o:
	$(MAKE) -C pages $(MAKETGT) $(PAGESMAKEVARS)
$(OBJDIR)/PointerSearcher.o:
	$(MAKE) -C pages $(MAKETGT) $(PAGESMAKEVARS)

$(OBJDIR)/pgCodeBeautifier.o:
	$(MAKE) -C pages $(MAKETGT) $(PAGESMAKEVARS)

# clipboard

$(OBJDIR)/Clipboard.o:
	$(MAKE) -C clipboard $(MAKETGT)

# codeparser

$(OBJDIR)/CodeParser.o:
	$(MAKE) -C codeparser $(MAKETGT)

# filehandler

$(OBJDIR)/Downloader.o:
	$(MAKE) -C filehandler $(MAKETGT)

$(OBJDIR)/FileHandler.o:
	$(MAKE) -C filehandler $(MAKETGT)

$(OBJDIR)/PSR.o:
	$(MAKE) -C filehandler $(MAKETGT)

### Library Builds

$(WX29BUILD)/arrstr.o:
	$(MAKE) -C $(COMPAT) $(MAKETGT)

clean:
	@mkdir -p $(OBJDIR)
	@rm -r $(OBJDIR)
	@mkdir -p $(WX29BUILD)
	@rm -r $(WX29BUILD)
	@echo "Build objects cleaned."

distclean:
	@touch .ndsconfig
	@mv .ndsconfig .ndsconfig.tmp
	@./configure > /dev/null || ./configure
	@mv .ndsconfig.tmp .ndsconfig
	@echo "Configuration has been reset."

rebuild: clean
rebuild: $(EXE)

rebuild-dbg: clean
rebuild-dbg: debug

erase: delete
delete:
	@mkdir -p $(BUILDROOT)
	@rm -r $(BUILDROOT)
	@mkdir -p $(WX29BUILD)
	@rm -r $(WX29BUILD)
	@echo "All build items have been removed."

install:
	@test -f $(EXE) || \
	 (echo "Build the program first so that it may be installed."; exit 1)
	@install -m 0755 $(EXE) $(INSTALL)/$(NAME)
	@ln -sf $(INSTALL)/$(NAME) $(INSTALL)/$(ALTNAME)
	@echo "NDS Toolkit has been installed."

uninstall:
	@rm -f $(INSTALL)/$(NAME) $(INSTALL)/$(ALTNAME)
	@echo "NDS Toolkit has been uninstalled."

run:
	$(EXE)

build-run: all
build-run: run

debug-run: debug
debug-run: run

rebuild-run: rebuild
rebuild-run: run

rebuild-dbg-run: rebuild-dbg
rebuild-dbg-run: run
