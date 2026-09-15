# Bibliotheken mit einem Kürzel importieren
import math as m
import random as rnd

# Kürzer zu schreiben, aber weniger aussagekräftig
wurzel = m.sqrt(25)
print(f"Wurzel von 25: {wurzel}")

# random als rnd zu kürzen ist praktisch
zahl = rnd.randint(1, 100)
print(f"Zufallszahl: {zahl}")

# Einzelne Funktionen direkt importieren
from math import pi, sqrt

# Jetzt können wir pi und sqrt direkt nutzen
print(f"pi = {pi}")
print(f"sqrt(49) = {sqrt(49)}")

# Vorsicht: Das kann zu Verwechslungen führen!
# Wenn wir eine Variable sqrt nennen würden, überschreiben wir die Funktion
