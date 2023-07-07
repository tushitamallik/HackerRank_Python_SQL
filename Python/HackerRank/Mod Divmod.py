'''
Read in two integers, a and b, and print three lines.
The first line is the integer division a//b (While using Python2 remember to import division from __future__).
The second line is the result of the modulo operator: a%b.
The third line prints the divmod of a and b.
'''
a, b = int(input()), int(input())
print(a//b, a%b, divmod(a,b), sep = '\n')
