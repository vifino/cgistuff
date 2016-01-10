###
## Compiler Settings and stuff
###
ASM?=nasm -f elf32
CC?=gcc
CFLAGS=-Os -s
LDFLAGS=-m32 -static -ffunction-sections -fdata-sections -Wl,--gc-sections

###
## Targets
###

# Default target
all: hello_worlds

# Lists
# List of hello worlds.
HELLO_WORLDS:=asm_hello_world
hello_worlds: $(HELLO_WORLDS)

##
# Programs to compile
##

asm_hello_world: hello_worlds/asm_hello_world.S.o
	$(CC) $(CFLAGS) $(LDFLAGS) $< -o $@
	strip --strip-all $@

clean-asm_hello_world:
	rm asm_hello_world

###
## Non-Target-Specific rules
###

# ASM
%.S.o: %.S
	$(ASM) $^ -o $@


# Clean
clean:
	rm -f hello_worlds/*.o
