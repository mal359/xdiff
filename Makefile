# Makefile for application

# Compiler and flags
CC = gcc
CFLAGS = -O2 -g -Wall -Wextra $(LCDEFS) $(LCOPTS)

# Edit for your installation!
LDFLAGS = -L/usr/lib/x86_64-linux-gnu -L/usr/local/lib
LDLIBS = -lXm -lXt -lX11 -lXmu -lXext

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
	install -m 755 $(TARGET) /usr/local/bin
	install -m 755 gdiff /usr/local/bin
	install -m 644 Xdiff.ad /usr/local/share/X11/app-defaults

# Clean-up
clean:
	rm -f $(OBJS) $(TARGET)
