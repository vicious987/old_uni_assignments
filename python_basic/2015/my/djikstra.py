graph = input("gib graph\n") #[(edge_name1,edge_name2, edge_value)]
starting_node_name = input("gib start name\n")
finish_node_name = input("gib finish name\n")

import math

def get_neighbour_list(node_name, graph):
    neighbour_list = []
    for x in graph:
        if x[0] == node_name:
           neighbour_list.append(x[1])
        elif x[1] == node_name:
           neighbour_list.append(x[0])
    return neighbour_list

def update_values(node_name, neighbours, graph):
    for x in neighbors:
        if x not in visited:
            if  
            

def djikstra(starting_node_name, finish_node_name, graph):

   visited = [starting_node_name] 
   value_list = {} 

    for x in graph:
       if x[0] not in value_list:
           value_list[x[0]] = math.inf
       elif x[1] not in value_list:
           value_list[x[1]] = math.inf

    value_list[starting_node] = 0
    
    while True:
        neighbour_list = get_neighbour_list(starting_node_name, graph)
        for x in neighbour_list:
            if x not in visited
               if value_list[x] >  
       #for every unvisited neighbor:
            #if edge value < node value
                # replace node v with edge val
        # choose new starting, unvisited, with lowest node v

#def rec_djikstra():

