'''
Consider a list (list = []). You can perform the following commands:
  1. insert i e: Insert integer e at position i.
  2. print: Print the list.
  3. remove e: Delete the first occurrence of integer e.
  4. append e: Insert integer e at the end of the list.
  5. sort: Sort the list.
  6. pop: Pop the last element from the list.
  7. reverse: Reverse the list.
Initialize your list and read in the value of n followed by n lines of commands where each command will be of the 7 types listed above. 
Iterate through each command in order and perform the corresponding operation on your list.
'''
if __name__ == '__main__':
    N = int(input())
    lst=[]
    res=[]
    for i in range(N):
        x=input().split()
        lst.append(x)

    for i in range(len(lst)):
        if lst[i][0]=='append':
            res.append(int(lst[i][1]))
        elif lst[i][0]=='insert':
            res.insert(int(lst[i][1]),int(lst[i][2]))
        elif lst[i][0]=='print':
            print(res)
        elif lst[i][0]=='remove':
            res.remove(int(lst[i][1]))
        elif lst[i][0]=='sort':
            res.sort()
        elif lst[i][0]=='pop':
            res.pop()
        elif lst[i][0]=='reverse':
            res.reverse()
        else:
            None
