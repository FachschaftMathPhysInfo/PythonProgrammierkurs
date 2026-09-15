# Die random-Bibliothek erzeugt Zufallszahlen
import random

# Eine zufällige Ganzzahl zwischen 1 und 6 (wie ein Würfel)
wuerfel = random.randint(1, 6)
print(f"Würfelwurf: {wuerfel}")

# Eine zufällige Fließkommazahl zwischen 0 und 1
zufall = random.random()
print(f"Zufallszahl zwischen 0 und 1: {zufall}")

# Ein zufälliges Element aus einer Liste auswählen
farben = ["rot", "gruen", "blau", "gelb", "lila"]
zufallsfarbe = random.choice(farben)
print(f"Zufällige Farbe: {zufallsfarbe}")

# Eine Liste durcheinander würfeln
nummern = [1, 2, 3, 4, 5]
random.shuffle(nummern)  # Verändert die Liste direkt!
print(f"Durchmischte Liste: {nummern}")

# Mehrere zufällige Elemente ohne Zurücklegen
ausgewählte = random.sample(farben, 3)  # 3 verschiedene Farben
print(f"3 zufällige Farben: {ausgewählte}")
