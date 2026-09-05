# Rechnen mit ganzen Zahlen. Python nutzt die Rechenausdrücke, die wir aus
# der Schule kennen, plus die bereits bekannte Zuweisung mit "=".

a = 18
b = 5

print("Summe:        ", a + b)   # 23
print("Differenz:    ", a - b)   # 13
print("Produkt:      ", a * b)   # 90
print("Quotient:     ", a / b)   # 3.6   <- / liefert IMMER eine Kommazahl (float)
print("Ganzzahl-Div: ", a // b)  # 3     <- // schneidet den Rest ab
print("Rest (modulo):", a % b)   # 3     <- was bei 18 : 5 übrig bleibt
print("Potenz:       ", a ** b)  # 1889568  <- a hoch b

# Rechenreihenfolge ("Punkt vor Strich") gilt wie in der Mathematik.
# Mit Klammern kann man sie steuern:
print(2 + 3 * 4)     # 14
print((2 + 3) * 4)   # 20
