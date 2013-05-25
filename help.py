#!/usr/bin/python

import re

input_file=open("/home/maldun/prog/Lisp/astermode/liste.txt",'r')
output_file=open("/home/maldun/prog/Lisp/astermode/liste_output.txt",'w')

lines = input_file.readlines()
i = 0
for line in lines:
    i += 1
    output = re.search("[A-Z_]{2,}",line)
    if output: 
        output = '\"' + re.search("[A-Z_]{2,}",line).group(0) + '\" '
        if i%5 == 0:
            output += '\n'
    
        output_file.write(output)

    print output
    
    
output_file.close()
