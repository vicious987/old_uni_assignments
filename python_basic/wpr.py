def pivot(some_list, p):
    lower_list = []
    higher_list = []
    for x in some_list:
        if x <= p:
            lower_list.append(x)
        else :
            higher_list.append(x)
    return lower_list, higher_list 

def multipivot(some_list, pivot_list):
    ret_list = []
    
    ret_list.append(pivot(some_list, pivot_list[0])[0])
    for index in range(1,len(pivot_list)):
        temp_l1 = pivot(some_list, pivot_list[index - 1])[1]
        temp_l2 = pivot(some_list, pivot_list[index])[0]
        temp_1and2 = list(set(temp_l1) & set(temp_l2))
        ret_list.append(temp_1and2)

    ret_list.append(pivot(some_list, pivot_list[-1])[1])
    return ret_list



#print(pivot([3,4,2,1,6,5], 3))

print(multipivot([3,4,2,1,6,5],  [2,4]))
print(multipivot([3,4,2,10,1,6,9,5,8,],  [2,5,9]))
