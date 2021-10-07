import sys

key = int(sys.argv[1])
text = sys.argv[2]
cipher = ""

assert 0 <= key <= 255  , " asserted! "

for c in text :
    cipher += chr(ord(c) ^ key)
print cipher
