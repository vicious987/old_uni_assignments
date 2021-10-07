letters_s = "qwertyuiopasdfghjklzxcvbnm"
letters_d = {}

for l in letters_s:
    letters_d[l] = False

def add_to_ab(alphabeton, word, dic):
    for letter in word:
        if dic[letter] == True:
            return False

    aplhabeton += word + " "

    for letter in word:
        dic[letter] = True:

def create_half_alphabeton():
    letters = letters_d.copy() 
    f = open("slowa.txt","r")

    number_of_lines = 0
    for line in f:
        number_of_lines += 1






