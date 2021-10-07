w = "wolf"
g = "goat"
c = "cabbage"
h = "human"

L = [w,g,c,h] 
R = []

move_history = []

def legal(S):
    if "human" in S:
        return True
    else:
        if "wolf" in S and "goat" in S:
            return False
        if "goat" in S and "cabbage" in S:
            return False
    return True
    
def move(
