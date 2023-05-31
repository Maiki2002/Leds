# Cross-compiler for ARM
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy

# Compiler and linker flags
LDFLAGS = -T stm32f103c8t6.ld

# List of source files
SRCS = main1.s ivt.s default_handler.s reset_handler.s delay.s read_button.s output.s digital_read.s

# List of object files
OBJS = $(SRCS:.s=.o)

# Main target
all: prog.bin

# Compile ARM assembly source files into object files
%.o: %.s
	$(AS) -o $@ $<

# Link object files into an ELF executable
prog.elf: $(OBJS) stm32f103c8t6.ld
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

# Convert ELF executable into a binary image
prog.bin: prog.elf
	$(OBJCOPY) -O binary $< $@

# Clean up object files and binary image
cleanwin:
	Del /F $(OBJS) prog.elf prog.bin

# Clean up object files and binary image
clean:
	rm -f $(OBJS) prog.elf prog.bin

unlink:
	git remote rm origin

write:
	st-flash write 'prog.bin' 0x8000000

.PHONY: all clean unlink
