def visited_dict(Tree):
    visited = {}
    for x in range(len(Tree)):
        visited[x] = False 
    return visited

def ifroot(v, Tree, visited, skierowany = True):
    visited[v] = True
    for x in Tree[v]:
        if not visited[x]:
            ifroot(x, Tree, visited, skierowany) 
        else:
            return visited, False
    return visited, skierowany

#def f(Tree):
#    for v in Tree:
#        if x in v:
#            return False
#    return True

#def q(Tree):
#    d = visited_dict(Tree)
#    for v in range(len(Tree)):
#        f(Tree)


t1 = [[1], [2], [3, 4], [], []]

t2 = [[1], [2], [3, 4], [4], []] 

#for r in visited_dict(t2):
#    print(ifroot(r,t2,visited_dict(t2), True))


def skierowany(Tree):
    L = []
    for v in visited_dict(Tree):
        x = ifroot(v,Tree,visited_dict(Tree))
        L.append((all(list(x[0].values())), x[1]))
    return L


print(skierowany(t1))
print(skierowany(t2))


