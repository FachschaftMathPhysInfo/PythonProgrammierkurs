from dataclasses import dataclass


# Ohne dataclass: ein Tupel hat keine Namen fuer seine Werte.
punkt_tupel = (2, 5)
print(punkt_tupel[0])  # welche Zahl war nochmal x?


# Mit dataclass: die Felder haben Namen und einen festen Typ.
@dataclass
class Position:
    x: int
    y: int


p1 = Position(2, 5)
p2 = Position(2, 5)

print(p1)  # Position(x=2, y=5) -- automatische, lesbare Ausgabe
print(p1.x, p1.y)  # 2 5
print(p1 == p2)  # True -- dataclasses vergleichen automatisch alle Felder
