import sys
def envelope(n,c = "#"):
    array = [ [' ' for x in range(n)] for y  in range(n)]

    for x in range(n):
        for y in range(n):
            if x == 0:              # horizontal upper side
                array[x][y] = c 
            elif x == n - 1:        # horizontal lower side
                array[x][y] = c 
            elif y == 0:            # verical left side
                array[x][y] = c 
            elif y == n - 1:        # vertical right side 
                array[x][y] = c 
            elif x == y:            # \ line
                array[x][y] = c 
            elif x + y == n - 1:    # / line
                array[x][y] = c 

    for x in range(n):
        for y in range(n):
            print(array[x][y], end ='')
        print()

envelope(int(sys.argv[1]))
