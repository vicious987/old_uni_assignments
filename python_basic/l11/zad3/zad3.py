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

            
            
print(ppn("tlźlźltą"))
print(ppn("hahaheeh"))

