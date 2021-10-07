
d = {}
ret = []
f = open("slowa.txt", 'r')

for line in f:
    word = line.strip()
    reversed_word = word[::-1]
    d[word] = False
    if reversed_word in d:
        ret.append( (word, reversed_word) )

print(ret)
