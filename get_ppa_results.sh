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

echo ""
echo COMBINATIONAL LOGIC SHIFTER ITERATIONS BELOW
echo ""

for ((i = 2; i <= $MAX_LEN; i++ )) ## for LEN parameter
do
    for (( j = 1; j < i; j++ ))
    do
        # Update the LEN and MAX_SHIFT_MAG parameters
        sed -i "s#parameter LEN = $((i-1))#parameter LEN = $i#" $PWD/src/rtl/combShifter.sv
        sed -i "s#parameter MAX_SHIFT_MAG = $((j-1))#parameter MAX_SHIFT_MAG = $j#" $PWD/src/rtl/combShifter.sv
        
        # Call synth command
        #make combShifter-synth > /dev/null 2>&1
        echo LEN = $i, MAX_SHIFT_MAG = $j 
        make combShifter-synth > dummy.log
        
       # echo $output
       # if [ "$output" -neq "0" ]
       # then
       #     echo there is a error
       #     exit
       # else 
       #     echo I am here
       # fi

        # Rename the report files with the LEN and MAX_SHIFT_MAG values
        mv $PWD/SYNTH/combShifter/rep/combShifter_area.rpt $PWD/SYNTH/combShifter/rep/combShifter_area_LEN_"$i"_MAG_"$j".rpt
        mv $PWD/SYNTH/combShifter/rep/combShifter_power.rpt $PWD/SYNTH/combShifter/rep/combShifter_power_LEN_"$i"_MAG_"$j".rpt
        mv $PWD/SYNTH/combShifter/rep/combShifter_time.rpt $PWD/SYNTH/combShifter/rep/combShifter_time_LEN_"$i"_MAG_"$j".rpt


        # get the PPA numbers to a csv file 
        #exec grep "Total cell area" $PWD/SYNTH/combShifter/rep/combShifter_area.rpt | awk -F " " '{print $4}'
    done
done
sed -i "s#parameter LEN = $MAX_LEN#parameter LEN = 1#" $PWD/src/rtl/combShifter.sv
sed -i "s#parameter MAX_SHIFT_MAG = $((MAX_LEN-1))#parameter MAX_SHIFT_MAG = 0#" $PWD/src/rtl/combShifter.sv


# For tranShifter module
CUR_DIR="$PWD"
MAX_LEN=$1;

echo ""
echo TRANSISTOR LOGIC BASED SHIFTER ITERATIONS BELOW
echo ""

for ((i = 2; i <= $MAX_LEN; i++ )) ## for LEN parameter
do
    for (( j = 1; j < i; j++ ))
    do
        # Update the LEN and MAX_SHIFT_MAG parameters
        sed -i "s#parameter LEN = $((i-1))#parameter LEN = $i#" $PWD/src/rtl/tranShifter.sv
        sed -i "s#parameter MAX_SHIFT_MAG = $((j-1))#parameter MAX_SHIFT_MAG = $j#" $PWD/src/rtl/tranShifter.sv
        
        # Call synth command
        #make tranShifter-synth > /dev/null 2>&1
        echo LEN = $i, MAX_SHIFT_MAG = $j 
        make tranShifter-synth > dummy.log
        
       # echo $output
       # if [ "$output" -neq "0" ]
       # then
       #     echo there is a error
       #     exit
       # else 
       #     echo I am here
       # fi

        # Rename the report files with the LEN and MAX_SHIFT_MAG values
        mv $PWD/SYNTH/tranShifter/rep/tranShifter_area.rpt $PWD/SYNTH/tranShifter/rep/tranShifter_area_LEN_"$i"_MAG_"$j".rpt
        mv $PWD/SYNTH/tranShifter/rep/tranShifter_power.rpt $PWD/SYNTH/tranShifter/rep/tranShifter_power_LEN_"$i"_MAG_"$j".rpt
        mv $PWD/SYNTH/tranShifter/rep/tranShifter_time.rpt $PWD/SYNTH/tranShifter/rep/tranShifter_time_LEN_"$i"_MAG_"$j".rpt


        # get the PPA numbers to a csv file 
        #exec grep "Total cell area" $PWD/SYNTH/tranShifter/rep/tranShifter_area.rpt | awk -F " " '{print $4}'
    done
done
sed -i "s#parameter LEN = $MAX_LEN#parameter LEN = 1#" $PWD/src/rtl/tranShifter.sv
sed -i "s#parameter MAX_SHIFT_MAG = $((MAX_LEN-1))#parameter MAX_SHIFT_MAG = 0#" $PWD/src/rtl/tranShifter.sv

