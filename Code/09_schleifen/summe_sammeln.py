# Eine Schleife eignet sich gut, um Werte aufzusammeln.
# Wir addieren alle Zahlen von 1 bis 100.

zahl = 1
summe = 0        # Der "Sammelbehaelter". Er startet leer, also bei 0.

while zahl <= 100:
    summe = summe + zahl   # Kurzform: summe += zahl
    zahl = zahl + 1        # Kurzform: zahl += 1

print(f"Die Summe der Zahlen von 1 bis 100 ist {summe}.")

# Zwei Variablen mit klar getrennten Aufgaben:
# "zahl" zaehlt hoch und steuert, wann die Schleife endet.
# "summe" sammelt das Ergebnis ein und wird nie zurueckgesetzt.
