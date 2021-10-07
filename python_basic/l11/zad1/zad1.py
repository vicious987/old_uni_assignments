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


print(cesar("abc", 33))
