'''
You are given a string S.
Your task is to find the indices of the start and end of string k in S.

Input Format
  The first line contains the string .
  The second line contains the string .

Output Format
  Print the tuple in this format: (start _index, end _index).
  If no match is found, print (-1, -1).
'''
============================================================================

import re

S, k = input(), input()
end = 0
for i in re.finditer(f"(?={k})", S):
    end = i.start() + len(k) - 1
    print((i.start(), end))
print((-1, -1) if end == 0 else "")
