def cesar(word, key):
    word = list(word)
    alphabet = "aąbcćdeęfghijklłmnńoóprsśtuwyzźż"
    if key > len(alphabet):
        key = key % len(alphabet)
    ciphered_alphabet = alphabet[key:] + alphabet[:key]
    cipher = dict(zip(alphabet, ciphered_alphabet))
    for index,letter in enumerate(word):
        word[index] = cipher[word[index]]
    return word

def quick_cesar_pair_check(a,b):
    if len(a) != len(b):
        return False
    for x in a:
        if x not in b:
            return False
    return True
        
def cesar_pair(a,b):
    if not quick_cesar_pair_check(a,b): 
        return False
    k = 1
    while k <= 32 or k <= len(a):
        if cesar(a,k) == b and cesar(b,k) == a:
            return True
        k += 1
    return False

f = open("slowa.txt")

for line in f:
    if 
