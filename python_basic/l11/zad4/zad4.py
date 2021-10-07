def ppn(word):
    d = dict()
    k = 1
    for letter in word:
        if letter not in d:
            d[letter] = k
            k += 1
    word = list("-".join(word))
    for index, letter in enumerate(word):
        if letter != "-":
            word[index] = str(d[word[index]])
    return "".join(word)

def seek_translation(word, filename):
    r = []
    word_ppn = ppn(word)
    f = open(filename, "r")
    for line in f:
        if len(word) == len(line.strip()):
            if word_ppn == ppn(line.strip()):
                r.append(line.strip())
    return r


cipher1 = "fulfolfu ćtąśśótą tlźlźltą"
cipher1 = cipher1.split()
cipher2 = "udhufńfd ąuąuęąę yrrożdśś śdśsdtsć"
cipher2 = cipher2.split()

print("szyfr 1")
for word in cipher1:
    print(seek_translation(word,"slowa.txt"))

print("szyfr 2")
for word in cipher2:
    print(seek_translation(word,"slowa.txt"))
