#!/bin/bash
#====================================================================================================
#   Author:  		Avinash Eega
#   Date:     		04/18/2022
#   File name: 		get_ppa_results.sh	
#   Description: 	Is an automated script that randomizes all parameters, perform synthesis and get
#                   the Power, Time and Area analysis.
#
#====================================================================================================


## For combShifter module
CUR_DIR="$PWD"
MAX_LEN=$1;
SHIFTER=$2;

source $PWD/18743_setup.bash

if [ "$SHIFTER" = "combShifter" ];
then
    echo ""
    echo COMBINATIONAL LOGIC SHIFTER ITERATIONS BELOW
    echo ""


    for ((i = 2; i <= $MAX_LEN; i++ )) ## for LEN parameter
    do
        for (( j = 1; j < i; j++ )) ## for the MAX_SHIFT_MAG parameter
        do
            # Clean the existing SIM/ files before instigating a new one to avoid incremental compilation errors
            make cleanall
            
            # Update the LEN and MAX_SHIFT_MAG parameters
            sed -i "s#parameter LEN = 1#parameter LEN = $i#" $PWD/src/rtl/combShifter.sv
            sed -i "s#parameter MAX_SHIFT_MAG = 0#parameter MAX_SHIFT_MAG = $j#" $PWD/src/rtl/combShifter.sv
            
            # Call synth command
            #make combShifter-synth > /dev/null 2>&1
            echo LEN = $i, MAX_SHIFT_MAG = $j 
            make combShifter-sim > dummy.log
            sleep 5
            make combShifter-synth > dummy.log
            sleep 5
            
            # Rename the report files with the LEN and MAX_SHIFT_MAG values
            mv $PWD/SYNTH/combShifter/rep/combShifter_area.rpt $PWD/PPA/combShifter/combShifter_area_LEN_"$i"_MAG_"$j".rpt
            mv $PWD/SYNTH/combShifter/rep/combShifter_power.rpt $PWD/PPA/combShifter/combShifter_power_LEN_"$i"_MAG_"$j".rpt
            mv $PWD/SYNTH/combShifter/rep/combShifter_time.rpt $PWD/PPA/combShifter/combShifter_time_LEN_"$i"_MAG_"$j".rpt
            
            # make cleanall
            # get the PPA numbers to a csv file 
            #exec grep "Total cell area" $PWD/SYNTH/combShifter/rep/combShifter_area.rpt | awk -F " " '{print $4}'
            sed -i "s#parameter LEN = $i#parameter LEN = 1#" $PWD/src/rtl/combShifter.sv
            sed -i "s#parameter MAX_SHIFT_MAG = $j#parameter MAX_SHIFT_MAG = 0#" $PWD/src/rtl/combShifter.sv
            sleep 2
        done
    done

elif [ "$SHIFTER" = "tranShifter" ];
then
    # For tranShifter module
    echo ""
    echo TRANSISTOR LOGIC BASED SHIFTER ITERATIONS BELOW
    echo ""


    for ((i = 2; i <= $MAX_LEN; i++ )) ## for LEN parameter
    do
        for (( j = 1; j < i; j++ )) ## for the MAX_SHIFT_MAG parameter
        do
            # Clean the existing SIM/ files before instigating a new one to avoid incremental compilation errors
            make cleanall
            
            # Update the LEN and MAX_SHIFT_MAG parameters
            sed -i "s#parameter LEN = 1#parameter LEN = $i#" $PWD/src/rtl/tranShifter.sv
            sed -i "s#parameter MAX_SHIFT_MAG = 0#parameter MAX_SHIFT_MAG = $j#" $PWD/src/rtl/tranShifter.sv
            
            # Call synth command
            #make tranShifter-synth > /dev/null 2>&1
            echo LEN = $i, MAX_SHIFT_MAG = $j 
            make tranShifter-sim > dummy.log
            sleep 5
            make tranShifter-synth > dummy.log
            sleep 5
            
            # Rename the report files with the LEN and MAX_SHIFT_MAG values
            mv $PWD/SYNTH/tranShifter/rep/tranShifter_area.rpt $PWD/PPA/tranShifter/tranShifter_area_LEN_"$i"_MAG_"$j".rpt
            mv $PWD/SYNTH/tranShifter/rep/tranShifter_power.rpt $PWD/PPA/tranShifter/tranShifter_power_LEN_"$i"_MAG_"$j".rpt
            mv $PWD/SYNTH/tranShifter/rep/tranShifter_time.rpt $PWD/PPA/tranShifter/tranShifter_time_LEN_"$i"_MAG_"$j".rpt
    
    
            # get the PPA numbers to a csv file 
            #exec grep "Total cell area" $PWD/SYNTH/tranShifter/rep/tranShifter_area.rpt | awk -F " " '{print $4}'
        done
    done
    sed -i "s#parameter LEN = $i#parameter LEN = 1#" $PWD/src/rtl/tranShifter.sv
    sed -i "s#parameter MAX_SHIFT_MAG = $j#parameter MAX_SHIFT_MAG = 0#" $PWD/src/rtl/tranShifter.sv

elif [ "$SHIFTER" = "barrelShifter" ];
then
    # For barrelShifter module
    echo ""
    echo BARREL SHIFTER ITERATIONS BELOW
    echo ""


    for ((i = 2; i <= $MAX_LEN; i++ )) ## for LEN parameter
    do
        for (( j = 1; j < i; j++ )) ## for the MAX_SHIFT_MAG parameter
        do
            # Clean the existing SIM/ files before instigating a new one to avoid incremental compilation errors
            make cleanall
            
            # Update the LEN and MAX_SHIFT_MAG parameters
            sed -i "s#parameter LEN = 1#parameter LEN = $i#" $PWD/src/rtl/barrelShifter.sv
            sed -i "s#parameter MAX_SHIFT_MAG = 0#parameter MAX_SHIFT_MAG = $j#" $PWD/src/rtl/barrelShifter.sv
            
            # Call synth command
            #make barrelShifter-synth > /dev/null 2>&1
            echo LEN = $i, MAX_SHIFT_MAG = $j 
            make barrelShifter-sim > dummy.log
            sleep 5
            make barrelShifter-synth > dummy.log
            sleep 5
            
            # Rename the report files with the LEN and MAX_SHIFT_MAG values
            mv $PWD/SYNTH/barrelShifter/rep/barrelShifter_area.rpt  $PWD/PPA/barrelShifter/barrelShifter_area_LEN_"$i"_MAG_"$j".rpt
            mv $PWD/SYNTH/barrelShifter/rep/barrelShifter_power.rpt $PWD/PPA/barrelShifter/barrelShifter_power_LEN_"$i"_MAG_"$j".rpt
            mv $PWD/SYNTH/barrelShifter/rep/barrelShifter_time.rpt  $PWD/PPA/barrelShifter/barrelShifter_time_LEN_"$i"_MAG_"$j".rpt
    
    
            # get the PPA numbers to a csv file 
            #exec grep "Total cell area" $PWD/SYNTH/barrelShifter/rep/tranShifter_area.rpt | awk -F " " '{print $4}'
        done
    done
    sed -i "s#parameter LEN = $i#parameter LEN = 1#" $PWD/src/rtl/barrelShifter.sv
    sed -i "s#parameter MAX_SHIFT_MAG = $j#parameter MAX_SHIFT_MAG = 0#" $PWD/src/rtl/barrelShifter.sv

elif [ "$SHIFTER" = "regShifter" ];
then
    # For regShifter module
    echo ""
    echo REGISTER SHIFTER ITERATIONS BELOW
    echo ""


    for ((i = 2; i <= $MAX_LEN; i++ )) ## for LEN parameter
    do
        for (( j = 1; j < i; j++ )) ## for the MAX_SHIFT_MAG parameter
        do
            # Clean the existing SIM/ files before instigating a new one to avoid incremental compilation errors
            make cleanall
            
            # Update the LEN and MAX_SHIFT_MAG parameters
            sed -i "s#parameter LEN = 1#parameter LEN = $i#" $PWD/src/rtl/regShifter.sv
            sed -i "s#parameter MAX_SHIFT_MAG = 0#parameter MAX_SHIFT_MAG = $j#" $PWD/src/rtl/regShifter.sv
            
            # Call synth command
            #make regShifter-synth > /dev/null 2>&1
            echo LEN = $i, MAX_SHIFT_MAG = $j 
            make regShifter-sim > dummy.log
            sleep 5
            make regShifter-synth > dummy.log
            sleep 5
            
            # Rename the report files with the LEN and MAX_SHIFT_MAG values
            mv $PWD/SYNTH/regShifter/rep/regShifter_area.rpt  $PWD/PPA/regShifter/regShifter_area_LEN_"$i"_MAG_"$j".rpt
            mv $PWD/SYNTH/regShifter/rep/regShifter_power.rpt $PWD/PPA/regShifter/regShifter_power_LEN_"$i"_MAG_"$j".rpt
            mv $PWD/SYNTH/regShifter/rep/regShifter_time.rpt  $PWD/PPA/regShifter/regShifter_time_LEN_"$i"_MAG_"$j".rpt
    
    
            # get the PPA numbers to a csv file 
            #exec grep "Total cell area" $PWD/SYNTH/regShifter/rep/tranShifter_area.rpt | awk -F " " '{print $4}'
        done
    done
    sed -i "s#parameter LEN = $i#parameter LEN = 1#" $PWD/src/rtl/regShifter.sv
    sed -i "s#parameter MAX_SHIFT_MAG = $j#parameter MAX_SHIFT_MAG = 0#" $PWD/src/rtl/regShifter.sv
e





else 
    echo Invalid command. Sample command below.
    echo sh get_ppa_results.sh 5 combShifter
fi
