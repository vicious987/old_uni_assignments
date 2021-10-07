XY = [
("ab", "xy"),
("ab", "yx"),
("cd","az"),
("ba", "az"),
("qw", "er") ]


YZ = [
("xy", "op"),
("yx" ,"op"),
("yx","de"),
("az", "uw") ]

#f1 = open("slownikXY.txt","r")
#f2 = open("slownikYZ.txt","r")

#YZ_from_file = []
#XY_from_file = []

#for line in f1:
#    splitted = line.split()
#    XY_from_file.append( (splitted[0],splitted[1]) ) 

#for line in f2:
#    splitted = line.split()
#    YZ_from_file.append( (splitted[0],splitted[1]) ) 

def translate(word, d):
    translation = []
    for x in d:
        if x[0] == word:
            translation.append(x[1])
    return translation

def d1_to_d2(dict1, dict2):
    d = {}
    for x in dict1:
        d[x[0]] = []
    for x in dict1:
        d[x[0]].append(x[1])
    for entry in d:
        t = []
        for word in d[entry]:
            t.extend(translate(word,dict2))
            d[entry] = t
    return d

my_dict = d1_to_d2(XY,YZ)
#my_dict_big = d1_to_d2(XY_from_file, YZ_from_file)

for d in my_dict:
    my_dict[d] = list(set(my_dict[d]))

for d in my_dict:
    print(d, my_dict[d])


f3 = open("xyz.txt", "a")
#f4 = open("XYZ_in_file.txt", "a")

for d in my_dict:
    if my_dict[d] == []:
            f3.write(d + " : *\n")
    for t in my_dict[d]:
        f3.write(d + " : " + t + "\n")
        

#for d in my_dict_big:
#    if my_dict_big[d] == []:
#            f4.write(d + " : *\n")
#    for t in my_dict_big[d]:
#        f4.write(d + " : " + t + "\n")
