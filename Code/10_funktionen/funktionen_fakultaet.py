def fakultaet(n):
    if n == 0:
        return 1
    return n * fakultaet(n - 1)


ergebnis = fakultaet(5)
print(ergebnis)
