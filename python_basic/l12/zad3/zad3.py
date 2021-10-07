c_l =["UL","UP","WL","WP","LPO","PLO","PL","LP"] def new_state(ml,mr,s,command):
    l = s[0]
    r = s[1]
    if command = "UL":#uzupelnij lewy
        l = ml
    elif command = "UP":
        r = mr
    elif command = "WL":
        l = 0
    elif command = "WP":
        r = 0
    elif command = "LPO":#lewy w prawo, overflow
        r += l
        l = 0
        if r > mr : 
            r = mr
    elif command = "PLO"
        l += r 
        r  = 0
        if l > ml : 
            l = ml
    elif command "LP":
        r += l
        l = 0
        if r > mr : 
            l = r - mr
            r = mr
    elif command = "PL"
        l += r 
        r  = 0
        if l > ml : 
            r = l - ml
            l = ml
    return (l,r)

def make_graph(l,r):
    G = {} 
    G[(0,0)] = []

