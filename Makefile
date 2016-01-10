###
## Compiler Settings and stuff
###
ASM?=nasm -f elf32
CC?=gcc
CFLAGS=-Os -s
LDFLAGS=-m32 -static -ffunction-sections -fdata-sections -Wl,--gc-sections

STRIP?=strip --strip-all

###
## Targets
###

# Default target
all: hello_worlds

# Lists
# List of hello worlds.
HELLO_WORLDS:=asm_hello_world asm_linux_hello_world c_hello_world
hello_worlds: $(HELLO_WORLDS)

##
# Programs to compile
##

# ASM
asm_hello_world: hello_worlds/asm_hello_world.S.o
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
	$(STRIP) $@

asm_linux_hello_world: hello_worlds/asm_linux_hello_world.S.o
	$(CC) $(CFLAGS) $(LDFLAGS) -nostdlib $< -o $@
	$(STRIP) $@

# C
c_hello_world: hello_worlds/c_hello_world.c
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
	$(STRIP) $@


###
## Non-Target-Specific rules
###

# ASM
%.S.o: %.S
	$(ASM) $^ -o $@

# Clean
clean:
	rm -f hello_worlds/*.o $(HELLO_WORLDS)
