#asdkljsadlksajdsajdsalkjdalkjsdlsakdjsalkjlsa !/usr/bin/env python3
import sys

def chessboard(n = 1,k = 1, char1 = ' ', char2 = '#'):
    for p in range(2*n):
        for z in range(k):      #printing boxline
            for y in range(n):  #printing line of boxline 
                for x in range(k):
                    print(char1, end = '')
                for x in range(k):
                    print(char2, end = '')
            print()
        char1, char2 = char2, char1


chessboard(int(sys.argv[1]),int(sys.argv[2]))
