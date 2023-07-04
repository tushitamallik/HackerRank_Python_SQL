'''
Given an integer, n, perform the following conditional actions:
  If n is odd, print Weird
  If n is even and in the inclusive range of  to , print Not Weird
  If n is even and in the inclusive range of  to , print Weird
  If n is even and greater than , print Not Weird
'''
=================================================================================

import sys


N = int(raw_input().strip())

if N % 2 != 0:
    print "Weird"
else:
    if N >= 2 and N <= 5:
        print "Not Weird"
    elif N >= 6 and N <= 20:
        print "Weird"
    elif N > 20:
        print "Not Weird"
