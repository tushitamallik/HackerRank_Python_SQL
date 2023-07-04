'''
The included code stub will read an integer, n, from STDIN.
Without using any string methods, try to print the following:
    123...n
Note that "..." represents the consecutive values in between.
'''
========================================================================

if __name__ == '__main__':
    n = int(input())
    [print(x, end='') for x in range(1, n + 1)]
