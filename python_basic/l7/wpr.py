grams = {}
def get_q_grams(word,q):
    for i in range(0, len(word) - (q -1)):
        g = "" 
        for x in range(q):
            g = g + word[i+x] 
        if g not in grams:
            grams[g] = 1
        else:
            grams[g] += 1


f = open("slowa.txt",'r')

q = 4 
d = 10 

for line in f:
    get_q_grams(line.strip(),q)

top = {}
every_gram_copy = grams.copy()


for x in range(d):
    m = max(every_gram_copy, key = every_gram_copy.get) 
    top[m] = every_gram_copy[m]
    del every_gram_copy[m]

slowa = {}
for t in top:
    slowa[t] = ""

for t in slowa:
    for line in f:
        if t in line.strip() and len(line.strip()) > len(slowa[t]):
                slowa[t] = line.strip()
print(slowa)



print(top)
