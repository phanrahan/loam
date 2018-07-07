#NAME = out
NAME = inout

DEVICE = SLG46620V

QUIET = -q

all: $(NAME).txt

%.json: %.v
	yosys $(QUIET) -p 'synth_greenpak4 -top main -part $(DEVICE) -json $*.json' $<

%.txt: %.json
	gp4par $(QUIET) -p $(DEVICE) $*.json -o $*.txt --unused-pull down --unused-drive 10k

upload: $(NAME).txt
	gp4prog -e $< -v 3.3 -n 4

clean:
	rm -f *.txt *.json 


.PRECIOUS: %.txt %.json 

.PHONY: all explain install clean
