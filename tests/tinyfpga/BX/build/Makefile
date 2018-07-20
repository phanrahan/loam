NAME ?= blink

PCF = $(NAME).pcf

DEVICE = 8k
PACKAGE = cm81
QUIET = -q

$(NAME).bin: $(NAME).v $(PCF)
	yosys $(QUIET) -p 'synth_ice40 -top main -blif $(NAME).blif' $(NAME).v
	arachne-pnr $(QUIET) -d $(DEVICE) -P $(PACKAGE) -o $(NAME).txt -p $(PCF) $(NAME).blif
	icepack $(NAME).txt $(NAME).bin

upload: $(NAME).bin
	tinyprog --libusb -p $<

clean:
	rm -f *.bin *.txt *.blif *.rpt

.PHONY: all explain install clean
