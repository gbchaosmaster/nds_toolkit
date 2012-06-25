# -*- makefile -*-
# vim:set ts=8 sw=8 noet:

# NDS Hacking Kit - A suite of tools for hacking Nintendo video games.
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

# @file linker.mk - Builds the executable for the NDS Hacking Kit.

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
    BUTTON_ACTIVATOR_GENERATOR = pgButtonActivatorGenerator.o
    POINTER_SEARCHER = pgPointerSearcher.o
    CODE_PORTER = pgCodePorter.o
    CODE_COMPRESSOR = pgCodeCompressor.o
endif

# Root Source Directory
ROOT = .

# Output Name
NAME = NDSHackingKit

# wxWidgets Options
WXLDFLAGS = `wx-config --libs`

# Output Directories
BUILDROOT = $(ROOT)/build
BINDIR = $(BUILDROOT)/bin
OBJDIR = $(BUILDROOT)/obj

# Output Files
EXE = $(BINDIR)/$(NAME)
OBJ = Program.o frmMain.o MenuBar.o \
      Clipboard.o CodeParser.o EBuilder.o FileHandler.o wxcArrayString.o \
      $(BUTTON_ACTIVATOR_GENERATOR) $(POINTER_SEARCHER) \
      $(CODE_PORTER) $(CODE_COMPRESSOR)
OPATHS = $(addprefix $(OBJDIR)/,$(OBJ))

# Compiler
CXX = g++
DEBUG = -g -DDEBUG
LDFLAGS = -Wall $(WXLDFLAGS)

.PHONY: all debug configure clean rebuild rebuild-dbg

all: LDFLAGS += -O2
all: configure
all: $(EXE)

debug: LDFLAGS += $(DEBUG)
debug: configure
debug: $(EXE)

configure:
	mkdir -p $(BINDIR)

$(EXE): $(OPATHS)
	$(CXX) $(LDFLAGS) $(OPATHS) -o $@

clean:
	touch $(EXE) && rm $(EXE)

rebuild: clean
rebuild: $(EXE)

rebuild-dbg: clean
rebuild-dbg: debug
