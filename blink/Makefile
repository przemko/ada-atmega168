DEVICE     = m168
CLOCK      = 8000000
PROGRAMMER = -c usbasp -P /dev/tty.usbmodem1421
OBJECTS    = main.o
FUSES      = -U hfuse:w:0xd9:m -U lfuse:w:0x24:m

AVRDUDE = avrdude $(PROGRAMMER) -p $(DEVICE)


all: compile dump flash

compile: main.elf

main.elf: main.adb
	avr-gnatmake -p -XMCU=atmega168 -Patmega168.gpr

dump: main.dump

main.dump: main.elf
	avr-objdump -d -S main.elf > main.dump

flash: main.hex
	$(AVRDUDE) -U flash:w:main.hex:i

main.hex: main.elf
	avr-objcopy -O ihex -R .eeprom main.elf main.hex

clean:
	rm -f *.hex *.dump *.elf *.o *.ali b~*.ad? *~

