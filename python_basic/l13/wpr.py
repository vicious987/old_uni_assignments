t1 = [
        [1],#0
        [0,2],#1
        [1,3,4],#2
        [2,4],#3
        [2,3]#4

        ]
t2 = [
        [1],#0
        [2,0],#1
        [3,1],#2
        [2],#3

        ]
t3 = [ [1,2],[0,2],[0,1]]
t4 = [ [1],[0]]
t5 = [ [], [] ]
t6 = [ [1], [0], [3],[2] ]
t7 = [ [1,4,2],#0
        [0,2],#1
        [1,3,0],#2
        [2,4],#3
        [3,0],#4
        [6,8], #5
        [5,7],
        [6,8],
        [7,5]   #6
        ]


def visited_dict(Tree):
    visited = {}
    for x in range(len(Tree)):
        visited[x] = False 
    return visited

def travel(v, Tree, visited):
    visited[v] = True
    for x in Tree[v]:
        if not visited[x]:
            travel(x, Tree, visited) 
    return visited

def count_visited(vt):
    counter = 0
    for x in vt:
        if vt[x] == True:
            counter += 1
    return counter

def f(Tree):
    r = []
    visited_tree_list = []
    for x in Tree:
        visited_tree_list.append(visited_dict(Tree))
    for i,x in enumerate(Tree):
        travel(i, Tree, visited_tree_list[i])
    for x in visited_tree_list:
        r.append(count_visited(x))
    return r


#print(f(t1))
#print(f(t2))
print(f(t3))
print(f(t4))
print(f(t5))
print(f(t6))
print(f(t7))
