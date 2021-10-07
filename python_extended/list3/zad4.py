#!/usr/bin/env python3

import random

def simplify(text, wordlen, removeAtLeast):
    removeSoFar = 0
    sign = text[-1]

    def wordfilter(w):
        nonlocal removeSoFar
        if len(w.rstrip("?!,.\'\"")) > wordlen:
            removeSoFar+= 1
            return False 
        return True 

    words = [word for word in text.split(" ") if wordfilter(word)]

    removeLeft = removeAtLeast - removeSoFar
    for x in range(removeLeft if removeLeft < len(words) else len(words)): 
        words.pop(random.randrange(len(words)))

    if words[-1][-1] != sign:
        words[-1] += sign

    return " ".join(words).capitalize()

tekst = "Podział peryklinalny inicjałów wrzecionowatych kambium charakteryzuje się ścianą podziałową inicjowaną w płaszczyźnie maksymalnej."

print(simplify(tekst,10,10))
