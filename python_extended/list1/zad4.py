#!/usr/bin/env python3

"""
Napisz program który szyfruje tekst za pomocą następującego algorytmu opartego na 
algorytmie XOR: do zaszyfrowania jest potrzebny klucz, tj. liczba z przedziału[0. . .255]. 
Kolejne litery tekstu zamieniamy na odpowiedni kod ASCII, obliczamy wynik operacji 
XOR i do szyfrogramu wstawiamy wynik operacji zamieniony naodpowiedni znak ASCII. 
Na przykład tekst Python za pomocą klucza 7 (binarnie:0000 0111) szyfrujemy tak:
Python
W~sohi
"""



def szyfruj(text, key):
    assert (255 >= key >= 0), f"'key' argument is expected to be int within 0 and 255 ({key} given)"
    return "".join([chr(ord(c) ^ key) for c in text])
#    return "".join(map(lambda c: chr(ord(c) ^ key), text))

txt1 = "Python"

print(szyfruj(txt1, 7))
