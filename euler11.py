def maxProd(m, max = 0) :
    for l in m :
        for i in range(0, len(l) - 3) :
            prod = l[i] * l[i+1] * l[i+2] * l[i+3]
            max = max if max > prod else prod
            # prod = (prod / l[i]) * l[i+3]
    return max

def diagonals(m, minlen = 4):
    md = []
    for i in range(0, 20 - 3) :
        d = []
        for j in range(0, 20-i) :
            d.append(m[j][j+i])
        md.append(d)
    for i in range(0, 20 - 3) :
        d = []
        for j in range(0, 20-i) :
            d.append(m[j+i][j])
        md.append(d)
    return md

def euler11() :
    with open("euler11.txt") as f :
        m = [[int(w) for w in l.split()] for l in f] # PARSE
        max = maxProd(m, 0)
        mt = zip(*m) # transpose
        max = maxProd(mt, max)
        md = diagonals(m, 4)
        print(md)
        max = maxProd(md, max)
        max = maxProd(diagonals([l[::-1] for l in m]), max)
        print(max)

euler11()
