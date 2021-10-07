def word_to_dict(word):
    d = {}
    for c in word:
        if c not in d:
            d[c] = 1
        else:
            d[c] += 1
    return d


def arrangable(word1, word2):
    d1 = word_to_dict(word1)
    d2 = word_to_dict(word2)
    for x in d1:
        if x not in d2:
            return False
        else:
            if d1[x] > d2[x]:
                return False
    return True


w1 = ["aktyw","kot","motyl","lokomotywa", "lokmo",""]
w2 = ["kotka","zak","asdsadasvr"]
tw = "lokomotywa"

for x in w1:
    print(arrangable(x,tw))

print("----")

for x in w2:
    print(arrangable(x,tw))
