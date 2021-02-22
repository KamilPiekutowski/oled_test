#*********************************************************************
# This is the makefile for the Adafruit SSD1306 OLED library driver
#
#	02/18/2013 	Charles-Henri Hallard (http://hallard.me)
#							Modified for compiling and use on Raspberry ArduiPi Board
#							LCD size and connection are now passed as arguments on 
#							the command line (no more #define on compilation needed)
#							ArduiPi project documentation http://hallard.me/arduipi
#
# *********************************************************************

prefix := $(DESTDIR)/usr

# The recommended compiler flags for the Raspberry Pi
CCFLAGS=-Ofast 
#CCFLAGS=

# define all programs
PROGRAMS = ssd1306_demo teleinfo-oled
SOURCES = ${PROGRAMS:=.cpp}
LD_LIBRARY_PATH=$(DESTDIR)/lib

all: ${PROGRAMS}

${PROGRAMS}: ${SOURCES}
	$(CC) ${CCFLAGS} -Wall -L../ -lssd1306 $@.cpp -o $@

clean:
	rm -rf $(PROGRAMS)

install: all
	test -d $(prefix) || mkdir $(prefix)
	test -d $(prefix)/bin || mkdir $(prefix)/bin
	for prog in $(PROGRAMS); do \
	  install -m 0755 $$prog $(prefix)/bin; \
	done

.PHONY: install


