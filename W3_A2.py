# This assignment was a puzzle
# the code below is an example of a hashing algorithm we were instructed to
# find 2 entries that would cause a collision.

# I found 2 which were DACB and BACD.
# BCDE and CABDE



while True:
    txt = input("Enter a string: ")
    if len(txt) < 1 : break

    hv = 0
    pos = 0
    for let in txt:
        pos = ( pos % 3 ) + 1  
        hv = (hv + (pos * ord(let))) % 1000000
        print(let, pos, ord(let), hv)

    print(hv, txt)
    
    
    
