# Wenn von vornherein feststeht, wie oft etwas passieren soll,
# ist die for-Schleife die passende Wahl.

for i in range(5):
    print(i)

# Ausgabe: 0 1 2 3 4
# range(5) liefert fuenf Zahlen - beginnend bei 0, OHNE die 5 selbst.

print("---")

# Mit zwei Angaben: von wo bis wo (Ende bleibt aussen vor).
for zahl in range(1, 6):
    print(zahl)

# Ausgabe: 1 2 3 4 5

print("---")

# Mit drei Angaben: von, bis, Schrittweite.
for zahl in range(0, 21, 5):
    print(zahl)

# Ausgabe: 0 5 10 15 20

print("---")

# Rueckwaerts zaehlen mit negativer Schrittweite.
for zahl in range(3, 0, -1):
    print(zahl)
print("Start!")

print("---")

# Dieselbe Summe wie mit while - nur deutlich kuerzer.
summe = 0
for zahl in range(1, 101):
    summe += zahl
print(f"Summe von 1 bis 100: {summe}")
