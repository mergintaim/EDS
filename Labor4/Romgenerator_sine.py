
# Generate Sinus Rom File with arbitrary precision
import os
import sys


import math as m
import numpy as np

#initilization
PATH_TO_ROMFILEFOLDER = "./"
FILENAME = 'sine_ROM'
FILEEXTENSION = '.coe'
number_of_datapoints = 32768
bitwidth_of_counter = m.ceil(m.log2(number_of_datapoints))

##
def yes_or_no(question):
    while "the answer is invalid":
        reply = str(raw_input(question+' (y/n): ')).lower().strip()
        if reply[:1] == 'y':
            return True
        if reply[:1] == 'n':
            return False

def main():
    
    #create sin values
    x_elements = list(range(0,number_of_datapoints,1))
    x_elements_floats = [(element * 2 * m.pi)/number_of_datapoints for element in x_elements]
    sine = np.sin(x_elements_floats)
    ## Loop to fill file
    # TODO check for file exists and handle?

    try:
        romfile = open(FILENAME,"x")
    except Exception as e:
        overwrite = yes_or_no("Do you want to overwrite the old file? ")
        
        return

    
    print(1)

if __name__ == "__main__":
    main()
