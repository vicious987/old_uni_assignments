#!/usr/bin/env python3

#            1 2 3 4 5 6 7 8 9
test1 = [    [3,0,6,5,0,8,4,0,0], #1
            [5,2,0,0,0,0,0,0,0], #2
            [0,8,7,0,0,0,0,3,1], #3
            [0,0,3,0,1,0,0,8,0], #4
            [9,0,0,8,6,3,0,0,5], #5
            [0,5,0,0,9,0,6,0,0], #6
            [1,3,0,0,0,0,2,5,0], #7
            [0,0,0,0,0,0,0,7,4], #8
            [0,0,5,2,0,6,3,0,0]] #9


test2 =    [[ 0, 0, 4,   0, 0, 0,   0, 6, 7 ],
            [ 3, 0, 0,   4, 7, 0,   0, 0, 5 ],
            [ 1, 5, 0,   8, 2, 0,   0, 0, 3 ],

            [ 0, 0, 6,   0, 0, 0,   0, 3, 1 ],
            [ 8, 0, 2,   1, 0, 5,   6, 0, 4 ],
            [ 4, 1, 0,   0, 0, 0,   9, 0, 0 ],
                            
            [ 7, 0, 0,   0, 8, 0,   0, 4, 6 ],
            [ 6, 0, 0,   0, 1, 2,   0, 0, 0 ],
            [ 9, 3, 0,   0, 0, 0,   7, 1, 0 ]]


def printSudokuLine(row):
    print(row[:3], row[3:6], row[6:9])

def printSudoku(sudoku):
    for i in range(9):
        printSudokuLine(sudoku[i])
        if i%3 == 2:
            print()

digits = {1, 2, 3, 4, 5, 6, 7, 8, 9}

def possibleHorizontal(sudoku, i):
    return digits - set(sudoku[i])

def possibleVertical(sudoku, j):
    return digits - set([sudoku[x][j] for x in range(9)])

def possibleSquare(sudoku, i, j):
    i, j = i//3, j//3
    sqr = [row[j*3:j*3+3] for row in sudoku[i*3:i*3+3]] # square as list of rows
    return digits - set([x for sub in sqr for x in sub])    # flattened

def possibleAnswers(sudoku, i, j):
    return possibleSquare(sudoku, i, j) & possibleHorizontal(sudoku, i) & possibleVertical(sudoku, j)

def findBlank(sudoku):
    for i in range(9):
        for j in range(9):
            if sudoku[i][j] == 0:
                return (i, j)  # row, col
    return None


#find version
def solveSudoku(sudoku):
    blank = findBlank(sudoku)
    if not blank:
        return True
    else:
        i, j = blank 

    for d in digits:
        if(d in possibleAnswers(sudoku, i, j)):
            sudoku[i][j] = d 
            if solveSudoku(sudoku):
                return True
            sudoku[i][j] = 0
    return False 

def genBlanktofill(sudoku):
    for i in range(9):
        for j in range(9):
            if (sudoku[i][j] == 0):
                yield (i, j)
"""
#global generator version
blankGenerator = genBlanktofill(test1)
def solveSudoku(sudoku):
    blankPair = next(blankGenerator, False)
    #blankPair is false only then blankGenerator has nothing left to iterate over
    if(not blankPair): 
        return True
    i, j = blankPair

    for d in digits:
        if(d in possibleAnswers(sudoku, i, j)):
            sudoku[i][j] = d 
            if(solveSudoku(sudoku)): 
                return True
            sudoku[i][j] = 0
    return False 
"""

"""
#generator in args version
def solve(sudoku, blankGenerator):
    blankPair = next(blankGenerator, False)
    #blankPair is false only then blankGenerator has nothing left to iterate over
    if(not blankPair): 
        return True
    i, j = blankPair

    for d in digits:
        if(d in possibleAnswers(sudoku, i, j)):
            sudoku[i][j] = d 
            if(solve(sudoku, blankGenerator)): 
                return True
            sudoku[i][j] = 0
    return False 

def solveSudoku(sudoku):
    blankgen = genBlanktofill(sudoku)
    return solve(sudoku, blankgen)
"""

printSudoku(test1)
print(solveSudoku(test1))
printSudoku(test1)
