def potenz(x, n):
    ergebnis = x
    i = 1
    while i < n:
        ergebnis = ergebnis * x
        i = i + 1
    return ergebnis


ergebnis1 = potenz(3.142, 4)
ergebnis2 = potenz(ergebnis1, 2)
ergebnis3 = potenz(5.0 + potenz(3.0, 2), 3)

print(ergebnis1, ergebnis2, ergebnis3)
