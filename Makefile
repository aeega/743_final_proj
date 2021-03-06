
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
	@echo "   combShifter-sim:  RTL sim. of combinational logic based shifter"
	@echo "   combShifter-wave:  waveform gui of combinational logic based shifter"
	@echo "   tranShifter-sim:  RTL sim. of transmission gate logic based shifter"
	@echo "   tranShifter-wave:  waveform gui of transmission gate logic based shifter"
	@echo "   pulse_gen-sim: RTL sim. of RNL neuron "
	@echo "   pulse_gen-wave: waveform gui of RNL neuron "
	@echo "   combShifter-synth: synthesis run for combinational logic based shifter"
	@echo "   tranShifter-synth: synthesis run for transmission gate logic based shifter"
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
        mkdir $(SIM) && mkdir $(SIM)/bitonic_sort;\
		cd $(SIM)/bitonic_sort && vcs -sverilog -debug_all -full64 -top bitonic_sort_test $(SRC)/tb/bitonic_sort_test.sv $(SRC)/rtl/neuron_snl_grl.sv && ./simv;\
	elif [ ! -d "$(SIM)/bitonic_sort" ]; then \
        mkdir $(SIM)/bitonic_sort;\
		cd $(SIM)/bitonic_sort && vcs -sverilog -debug_all -full64 -top bitonic_sort_test $(SRC)/tb/bitonic_sort_test.sv $(SRC)/rtl/neuron_snl_grl.sv && ./simv;\
	else \
		cd $(SIM)/bitonic_sort && vcs -sverilog -debug_all -full64 -top bitonic_sort_test $(SRC)/tb/bitonic_sort_test.sv $(SRC)/rtl/neuron_snl_grl.sv && ./simv;\
	fi;
	

.PHONY: combShifter-wave
combShifter-wave:
	
	if [ ! -d "$(SIM)" ]; then \
        @echo "Perform simulation first";\
	elif [ ! -d "$(SIM)/bitonic_sort" ]; then \
        @echo "Perform simulation first";\
	else \
		cd $(SIM)/bitonic_sort && ./simv -gui;\
	fi;
	
	

.PHONY: tranShifter-sim
tranShifter-sim:

	if [ ! -d "$(SIM)" ]; then \
        mkdir $(SIM) && mkdir $(SIM)/synapse;\
		cd $(SIM)/synapse && vcs -sverilog -debug_all -full64 -top synapse_tb $(SRC)/tb/synapse_tb.sv $(SRC)/rtl/neuron_rnl_ptt.sv && ./simv ; \
	elif [ ! -d "$(SIM)/synapse" ]; then \
        mkdir $(SIM)/synapse;\
		cd $(SIM)/synapse && vcs -sverilog -debug_all -full64 -top synapse_tb $(SRC)/tb/synapse_tb.sv $(SRC)/rtl/neuron_rnl_ptt.sv && ./simv ; \
	else \
		cd $(SIM)/synapse && vcs -sverilog -debug_all -full64 -top synapse_tb $(SRC)/tb/synapse_tb.sv $(SRC)/rtl/neuron_rnl_ptt.sv && ./simv ; \
	fi; 



.PHONY: tranShifter-wave
tranShifter-wave:
	if [ ! -d "$(SIM)" ]; then \
        @echo "Perform simulation first";\
	elif [ ! -d "$(SIM)/synapse" ]; then \
        @echo "Perform simulation first";\
	else \
		cd $(SIM)/synapse && ./simv -gui;\
	fi;


.PHONY: combShifter-synth
snl-synth:
	
	if [ ! -d "$(SYNTH)" ]; then \
		mkdir $(SYNTH) && mkdir $(SYNTH)/snl_neuron;\
		cd $(SYNTH)/snl_neuron && dc_shell -f $(CURDIR)/tcl/synth_snl.tcl;\
	elif [ ! -d "$(SYNTH)/snl_neuron" ]; then \
		mkdir $(SYNTH)/snl_neuron;\
		cd $(SYNTH)/snl_neuron && dc_shell -f $(CURDIR)/tcl/synth_snl.tcl;\
	else \
		cd $(SYNTH)/snl_neuron && dc_shell -f $(CURDIR)/tcl/synth_snl.tcl;\
	fi;
	
.PHONY: tranShifter-synth
rnl-synth:
		
	if [ ! -d "$(SYNTH)" ]; then \
		mkdir $(SYNTH) && mkdir $(SYNTH)/rnl_neuron;\
		cd $(SYNTH)/rnl_neuron && dc_shell -f $(CURDIR)/tcl/synth_rnl.tcl;\
	elif [ ! -d "$(SYNTH)/rnl_neuron" ]; then \
		mkdir $(SYNTH)/rnl_neuron;\
		cd $(SYNTH)/rnl_neuron && dc_shell -f $(CURDIR)/tcl/synth_rnl.tcl;\
	else \
		cd $(SYNTH)/rnl_neuron && dc_shell -f $(CURDIR)/tcl/synth_rnl.tcl;\
	fi;

	

.PHONY: cleanall
cleanall:
	rm -rf $(CURDIR)/SIM $(CURDIR)/SYNTH $(CURDIR)/PNR
	#find . -maxdepth 1 -type d | grep "./" | xargs -I {} make clean -C {}
