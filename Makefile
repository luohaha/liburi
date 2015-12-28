TARGET=liburi.so
CC=gcc
CFLAGS=-shared -fpic
LDFLAGS=`pkg-config --libs --cflags liburiparser`
SOURCES = parse.c props.c recompose.c
OBJECTS=$(SOURCES:.c=.o)

all:
	$(CC) $(SOURCES) $(CFLAGS) $(LDFLAGS) -o $(TARGET)

install:
	sudo cp $(TARGET) /usr/lib
	if [ ! -d "/usr/local/include/liburi" ]; then sudo mkdir /usr/local/include/liburi; fi;
	sudo cp liburi.h /usr/local/include
	sudo cp liburi.pc /usr/share/pkgconfig

uninstall:
	if [ -d "/usr/local/include/liburi" ]; then sudo rm -rf /usr/local/include/liburi; fi;
	sudo rm /usr/share/pkgconfig/liburi.pc
	sudo rm /usr/lib/liburi.so
clean:
	rm -f $(shell find . -name "*.o") $(TARGET)
