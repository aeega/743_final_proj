
#====================================================================================================
#   Author:  		Avinash Eega
#   Date:     		04/17/2022
#   File name: 		Makefile	
#   Description: 	Is a Makefile that does functional simulation and synthesis of all the shifter
#   			 	modules present in the src directory.
#
#====================================================================================================

.PHONY: help
help:
	@echo ""
	@echo "	S Y N T A X "
	@echo ""
	@echo " make [args.] "
	@echo ""
	@echo " Arguments: "
	@echo "   combShifter-sim:  	RTL simulation of combinational logic based shifter"
	@echo "   combShifter-wave:  	Waveform gui of combinational logic based shifter"
	@echo "   combShifter-synth: 	Synthesis run for combinational logic based shifter"
	@echo "   tranShifter-sim:  	RTL simulation of transmission gate logic based shifter"
	@echo "   tranShifter-wave:  	Waveform gui of transmission gate logic based shifter"
	@echo "   tranShifter-synth: 	Synthesis run for transmission gate logic based shifter"
	@echo "   barrelShifter-sim:  	RTL simulation of barrel shifter"
	@echo "   barrelShifter-wave:  	Waveform gui of barrel shifter"
	@echo "   barrelShifter-synth: 	Synthesis run for barrel shifter"
	@echo "   regShifter-sim:  		RTL simulation of reg shifter"
	@echo "   regShifter-wave:  	Waveform gui of reg shifter"
	@echo "   regShifter-synth: 	Synthesis run for reg shifter"
	@echo "   cleanall: 			Cleans all SIM/ SYNTH/ and PNR/ directories
	@echo "   cleanPPA: 			Cleans all files under PPA/ subdirectories
	@echo ""
	@echo " "

SIM := ${CURDIR}/SIM
SRC:= ${CURDIR}/src
SYNTH := $(CURDIR)/SYNTH
BACK := /afs/andrew/course/18/743/backend

.SILENT:
.PHONY: combShifter-sim
combShifter-sim:
	
	if [ ! -d "$(SIM)" ]; then \
        mkdir $(SIM) && mkdir $(SIM)/combShifter;\
		cd $(SIM)/combShifter && vcs -sverilog -debug_all -full64 $(SRC)/tb/combShifter_tb.sv $(SRC)/rtl/combShifter.sv && ./simv;\
	elif [ ! -d "$(SIM)/combShifter" ]; then \
        mkdir $(SIM)/combShifter;\
		cd $(SIM)/combShifter && vcs -sverilog -debug_all -full64 $(SRC)/tb/combShifter_tb.sv $(SRC)/rtl/combShifter.sv && ./simv;\
	else \
		cd $(SIM)/combShifter && vcs -sverilog -debug_all -full64 $(SRC)/tb/combShifter_tb.sv $(SRC)/rtl/combShifter.sv && ./simv;\
	fi;
	

.PHONY: combShifter-wave
combShifter-wave:
	
	if [ ! -d "$(SIM)" ]; then \
        @echo "Perform simulation first";\
	elif [ ! -d "$(SIM)/combShifter" ]; then \
        @echo "Perform simulation first";\
	else \
		cd $(SIM)/combShifter && ./simv -gui;\
	fi;
	
	

.PHONY: tranShifter-sim
tranShifter-sim:
	
	if [ ! -d "$(SIM)" ]; then \
        mkdir $(SIM) && mkdir $(SIM)/tranShifter;\
		cd $(SIM)/tranShifter && vcs -sverilog -debug_all -full64 $(SRC)/tb/tranShifter_tb.sv $(SRC)/rtl/custom_tgate.sv $(SRC)/rtl/tranShifter.sv && ./simv;\
	elif [ ! -d "$(SIM)/tranShifter" ]; then \
        mkdir $(SIM)/tranShifter;\
		cd $(SIM)/tranShifter && vcs -sverilog -debug_all -full64 $(SRC)/tb/tranShifter_tb.sv $(SRC)/rtl/custom_tgate.sv $(SRC)/rtl/tranShifter.sv && ./simv;\
	else \
		cd $(SIM)/tranShifter && vcs -sverilog -debug_all -full64 $(SRC)/tb/tranShifter_tb.sv $(SRC)/rtl/custom_tgate.sv $(SRC)/rtl/tranShifter.sv && ./simv;\
	fi;


.PHONY: tranShifter-wave
tranShifter-wave:
	
	if [ ! -d "$(SIM)" ]; then \
        @echo "Perform simulation first";\
	elif [ ! -d "$(SIM)/tranShifter" ]; then \
        @echo "Perform simulation first";\
	else \
		cd $(SIM)/tranShifter && ./simv -gui;\
	fi;

.PHONY: barrelShifter-sim
barrelShifter-sim:
	
	if [ ! -d "$(SIM)" ]; then \
        mkdir $(SIM) && mkdir $(SIM)/barrelShifter;\
		cd $(SIM)/barrelShifter && vcs -sverilog -debug_all -full64 $(SRC)/tb/barrelShifter_tb.sv $(SRC)/rtl/custom_tgate.sv $(SRC)/rtl/barrelShifter.sv && ./simv;\
	elif [ ! -d "$(SIM)/barrelShifter" ]; then \
        mkdir $(SIM)/barrelShifter;\
		cd $(SIM)/barrelShifter && vcs -sverilog -debug_all -full64 $(SRC)/tb/barrelShifter_tb.sv $(SRC)/rtl/custom_tgate.sv $(SRC)/rtl/barrelShifter.sv && ./simv;\
	else \
		cd $(SIM)/barrelShifter && vcs -sverilog -debug_all -full64 $(SRC)/tb/barrelShifter_tb.sv $(SRC)/rtl/custom_tgate.sv $(SRC)/rtl/barrelShifter.sv && ./simv;\
	fi;


.PHONY: barrelShifter-wave
barrelShifter-wave:
	
	if [ ! -d "$(SIM)" ]; then \
        @echo "Perform simulation first";\
	elif [ ! -d "$(SIM)/barrelShifter" ]; then \
        @echo "Perform simulation first";\
	else \
		cd $(SIM)/barrelShifter && ./simv -gui;\
	fi;

.PHONY: regShifter-sim
regShifter-sim:
	
	if [ ! -d "$(SIM)" ]; then \
        mkdir $(SIM) && mkdir $(SIM)/regShifter;\
		cd $(SIM)/regShifter && vcs -sverilog -debug_all -full64 $(SRC)/tb/regShifter_tb.sv $(SRC)/rtl/custom_tgate.sv $(SRC)/rtl/regShifter.sv && ./simv;\
	elif [ ! -d "$(SIM)/regShifter" ]; then \
        mkdir $(SIM)/regShifter;\
		cd $(SIM)/regShifter && vcs -sverilog -debug_all -full64 $(SRC)/tb/regShifter_tb.sv $(SRC)/rtl/custom_tgate.sv $(SRC)/rtl/regShifter.sv && ./simv;\
	else \
		cd $(SIM)/regShifter && vcs -sverilog -debug_all -full64 $(SRC)/tb/regShifter_tb.sv $(SRC)/rtl/custom_tgate.sv $(SRC)/rtl/regShifter.sv && ./simv;\
	fi;


.PHONY: regShifter-wave
regShifter-wave:
	
	if [ ! -d "$(SIM)" ]; then \
        @echo "Perform simulation first";\
	elif [ ! -d "$(SIM)/regShifter" ]; then \
        @echo "Perform simulation first";\
	else \
		cd $(SIM)/regShifter && ./simv -gui;\
	fi;

# S Y N T H E S I S

.PHONY: combShifter-synth
combShifter-synth:
	
	if [ ! -d "$(SYNTH)" ]; then \
		mkdir $(SYNTH) && mkdir $(SYNTH)/combShifter;\
		cd $(SYNTH)/combShifter && dc_shell -f $(CURDIR)/tcl/synth_combShifter.tcl;\
	elif [ ! -d "$(SYNTH)/combShifter" ]; then \
		mkdir $(SYNTH)/combShifter;\
		cd $(SYNTH)/combShifter && dc_shell -f $(CURDIR)/tcl/synth_combShifter.tcl;\
	else \
		cd $(SYNTH)/combShifter && dc_shell -f $(CURDIR)/tcl/synth_combShifter.tcl;\
	fi;
	
.PHONY: tranShifter-synth
tranShifter-synth:
	if [ ! -d "$(SYNTH)" ]; then \
		mkdir $(SYNTH) && mkdir $(SYNTH)/tranShifter;\
		cd $(SYNTH)/tranShifter && dc_shell -f $(CURDIR)/tcl/synth_tranShifter.tcl;\
	elif [ ! -d "$(SYNTH)/tranShifter" ]; then \
		mkdir $(SYNTH)/tranShifter;\
		cd $(SYNTH)/tranShifter && dc_shell -f $(CURDIR)/tcl/synth_tranShifter.tcl;\
	else \
		cd $(SYNTH)/tranShifter && dc_shell -f $(CURDIR)/tcl/synth_tranShifter.tcl;\
	fi;		

.PHONY: barrelShifter-synth
barrelShifter-synth:
	if [ ! -d "$(SYNTH)" ]; then \
		mkdir $(SYNTH) && mkdir $(SYNTH)/barrelShifter;\
		cd $(SYNTH)/barrelShifter && dc_shell -f $(CURDIR)/tcl/synth_barrelShifter.tcl;\
	elif [ ! -d "$(SYNTH)/barrelShifter" ]; then \
		mkdir $(SYNTH)/barrelShifter;\
		cd $(SYNTH)/barrelShifter && dc_shell -f $(CURDIR)/tcl/synth_barrelShifter.tcl;\
	else \
		cd $(SYNTH)/barrelShifter && dc_shell -f $(CURDIR)/tcl/synth_barrelShifter.tcl;\
	fi;	
	
.PHONY: regShifter-synth
regShifter-synth:
	if [ ! -d "$(SYNTH)" ]; then \
		mkdir $(SYNTH) && mkdir $(SYNTH)/regShifter;\
		cd $(SYNTH)/regShifter && dc_shell -f $(CURDIR)/tcl/synth_regShifter.tcl;\
	elif [ ! -d "$(SYNTH)/regShifter" ]; then \
		mkdir $(SYNTH)/regShifter;\
		cd $(SYNTH)/regShifter && dc_shell -f $(CURDIR)/tcl/synth_regShifter.tcl;\
	else \
		cd $(SYNTH)/regShifter && dc_shell -f $(CURDIR)/tcl/synth_regShifter.tcl;\
	fi;		


.PHONY: cleanall
cleanall:
	rm -rf $(CURDIR)/SIM $(CURDIR)/SYNTH $(CURDIR)/PNR 
	#find . -maxdepth 1 -type d | grep "./" | xargs -I {} make clean -C {}

.PHONY: cleanPPA
cleanPPA:
	rm -rf $(CURDIR)/PPA/combShifter/* $(CURDIR)/PPA/tranShifter/* $(CURDIR)/PPA/barrelShifter/* $(CURDIR)/PPA/regShifter/*
