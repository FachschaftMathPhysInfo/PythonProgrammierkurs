# Teilt die zweite Zahl die erste? Wir nutzen den Rest-Operator "%"
# aus der letzten Lektion: Ist der Rest 0, dann ist die Division glatt
# aufgegangen - die zweite Zahl ist ein Teiler der ersten.

zahl = int(input("Zahl: "))
teiler = int(input("Moeglicher Teiler: "))

if teiler == 0:
    print("Durch 0 teilt es sich nicht.")
elif zahl % teiler == 0:
    print(f"{teiler} teilt {zahl}.")
else:
    rest = zahl % teiler
    print(f"{teiler} teilt {zahl} nicht (Rest {rest}).")
