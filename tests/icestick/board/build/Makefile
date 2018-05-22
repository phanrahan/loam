NAME ?= j1
#NAME ?= blink48Mhz
#NAME ?= blink96Mhz
#NAME ?= blink192Mhz

#NAME ?= D5
#NAME ?= D1234
#NAME ?= dtr_rts
#NAME ?= dsr_cts

PCF = $(NAME).pcf

DEVICE = 1k
QUIET = -q

$(NAME).bin: $(NAME).v $(PCF)
	yosys $(QUIET) -p 'synth_ice40 -top main -blif $(NAME).blif' $(NAME).v
	arachne-pnr $(QUIET) -d $(DEVICE) -o $(NAME).txt -p $(PCF) $(NAME).blif
	icepack $(NAME).txt $(NAME).bin

upload: $(NAME).bin
	iceprog $(NAME).bin

upload_mac: $(NAME).bin
	iceprog $(NAME).bin

clean:
	rm -f *.bin *.txt *.blif *.rpt

.PHONY: all explain install clean
