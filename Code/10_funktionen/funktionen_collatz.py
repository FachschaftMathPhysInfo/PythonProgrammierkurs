def collatz(x):
    if x % 2 == 0:
        ergebnis = x // 2
    else:
        ergebnis = 3 * x + 1
    return ergebnis


eingabe = int(input("Mit welcher Zahl moechtest du starten? "))

x1 = collatz(eingabe)
x2 = collatz(x1)
x3 = collatz(x2)
# Bis hierhin haben keine Ausgaben stattgefunden, aber collatz wurde
# dreimal aufgerufen. x1, x2 und x3 sind die naechsten drei Glieder
# der Folge, ausgehend von der eingegebenen Zahl.

print(eingabe, "->", x1, "->", x2, "->", x3)
