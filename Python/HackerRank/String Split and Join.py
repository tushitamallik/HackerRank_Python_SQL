'''
You are given a string. Split the string on a " " (space) delimiter and join using a - hyphen.
'''
===============================================================================================
def split_and_join(line):
    # write your code here
    line = line.split(" ")
    line = "-".join(line)
    return line

if __name__ == '__main__':
    line = input()
    result = split_and_join(line)
    print(result)
