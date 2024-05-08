# Makefile for application

# Compiler and flags
CC = gcc
CFLAGS = -g -Wall -Wextra $(LCDEFS) $(LCOPTS)
LDFLAGS = -L/usr/X11R6/lib
LDLIBS = -lXm -lXt -lX11

# Source files
SRCS = xdCallbacks.c xdDiff.c xdHelp.c xdMain.c xdUtil.c xdSearch.c xdDefault.c
OBJS = $(SRCS:.c=.o)
TARGET = xdiff

# Targets
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)

# Rule for compiling C files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Installation
install: $(TARGET)
	install -m 755 $(TARGET) /usr/sbin
	install -m 755 gdiff /usr/sbin
	install -m 644 Xdiff.ad /usr/lib/X11/app-defaults

# Clean-up
clean:
	rm -f $(OBJS) $(TARGET)
