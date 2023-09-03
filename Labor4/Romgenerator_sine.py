
# Generate Sinus Rom File with arbitrary precision
import os
import sys
import math as m
import numpy as np
import pathlib as pl

#initilization
PATH_TO_ROMFILEFOLDER = __file__
FILEEXTENSION = '.coe'
INITSTRING = 'memory_initialization_radix=10;\nmemory_initialization_vector=\n'
NUMBER_OF_DATAPOINTS = 32768
bitwidth_of_counter = m.ceil(m.log2(NUMBER_OF_DATAPOINTS))
filename = str(pl.Path(PATH_TO_ROMFILEFOLDER).parent.resolve().absolute()) + '\\' + 'sine_ROM' +'_maxnum_' + str(NUMBER_OF_DATAPOINTS) + "_" + str(bitwidth_of_counter) +'_bit' + FILEEXTENSION

def yes_or_no(question):
    while "the answer is invalid":
        reply = str(input(question+' (y/n): ')).lower().strip()
        if reply[:1] == 'y':
            return True
        if reply[:1] == 'n':
            return False

def main():
    #create sin values
    x_elements = list(range(0,NUMBER_OF_DATAPOINTS,1))
    x_elements_floats = [(element * 2 * m.pi)/NUMBER_OF_DATAPOINTS for element in x_elements]
    sine = np.sin(x_elements_floats)
    sine_ints = [m.floor((element+1)*(NUMBER_OF_DATAPOINTS/2)) for element in sine]
    #generate sine string
    sinestring = ",\n".join(map(str,sine_ints))
    ## Loop to fill file
    try:
        romfile = open(filename,"x")
    except Exception as e:
        overwrite = yes_or_no("Do you want to overwrite the old file? ")
        if not overwrite: print("Dann halt nicht du Pisser!");return
    romfile = open(filename,"w")

    romfile.write(INITSTRING + sinestring + ";")
    romfile.close
    
if __name__ == "__main__":
    main()
