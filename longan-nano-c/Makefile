#
#
#

CROSS_COMPILE ?= riscv32-unknown-elf-
GD32VF103_BSP ?= /path/to/GD32VF103_Firmware_Library

CP = $(CROSS_COMPILE)objcopy
CC = $(CROSS_COMPILE)gcc
AS = $(CROSS_COMPILE)as
LD = $(CROSS_COMPILE)ld

CCFLAGS = -Wall -Wextra -Werror -std=c11 -ffreestanding -nostdlib -march=rv32g
ASFLAGS =
LDFLAGS = --nostdlib

CCFLAGS += -DHXTAL_VALUE=8000000U \
	 -Iinclude \
	 -I$(GD32VF103_BSP)/Firmware/GD32VF103_standard_peripheral/Include \
	 -I$(GD32VF103_BSP)/Firmware/GD32VF103_standard_peripheral \
	 -I$(GD32VF103_BSP)/Template

VPATH += $(GD32VF103_BSP)/Firmware/GD32VF103_standard_peripheral/Source

all: firmware-noirq

firmware-noirq: ld/flash.ld start-noirq.o main-noirq.o gd32vf103_usart.o gd32vf103_rcu.o gd32vf103_gpio.o
	$(LD) $(LDFLAGS) -T$< $(filter-out $<, $^) -o $@.elf
	$(CP) -O binary $@.elf $@.bin

%.o: %.s
	$(AS) $(ASFLAGS) $< -o $@

%.o: %.c
	$(CC) $(CCFLAGS) -c $< -o $@

clean:
	rm -rf *.o firmware-*.*

.PHONY: all run clean
