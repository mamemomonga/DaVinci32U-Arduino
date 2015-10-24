
# Arduino IDEの場所
ARDUINO_IDE  := /Applications/Arduino.app

ARDUINO_DIR   := $(ARDUINO_IDE)/Contents/Java
FIRMWARE_ZIP  := da-vinci-32u-20130208.zip

DaVinci32U: \
	DaVinci32U/avr/platform.txt \
	DaVinci32U/avr/boards.txt \
	DaVinci32U/avr/cores/ \
	DaVinci32U/avr/variants/leonardo/ \
	DaVinci32U/avr/bootloaders/da-vinci-32u-master.hex
clean:
	rm -rf DaVinci32U

DaVinci32U/avr:
	mkdir -p $@

DaVinci32U/avr/platform.txt: DaVinci32U/avr
	cp -a $(ARDUINO_DIR)/hardware/arduino/avr/platform.txt $@

DaVinci32U/avr/boards.txt: DaVinci32U/avr
	cp boards.txt $@

DaVinci32U/avr/cores/: DaVinci32U/avr
	mkdir -p $@
	cp -a $(ARDUINO_DIR)/hardware/arduino/avr/cores/ $@

DaVinci32U/avr/variants/leonardo/: DaVinci32U/avr
	mkdir -p $@
	cp -a $(ARDUINO_DIR)/hardware/arduino/avr/variants/leonardo/ $@

DaVinci32U/avr/bootloaders/da-vinci-32u-master.hex:
	mkdir -p $(dir $@)
	cd $(dir $@); \
		curl -o $(FIRMWARE_ZIP) https://strawberry-linux.com/pub/$(FIRMWARE_ZIP); \
		unzip $(FIRMWARE_ZIP); \
		cp $(basename $(FIRMWARE_ZIP))/da-vinci-32u-master.hex da-vinci-32u-master.hex; \

