# input() hält das Programm an und wartet auf eine Eingabe der Nutzerin.
# WICHTIG: input() liefert das Eingegebene IMMER als Text (str) zurück -
# auch dann, wenn die Nutzerin eine Zahl eingetippt hat.

erste_eingabe = input("Gib eine Zahl ein: ")
zweite_eingabe = input("Gib noch eine Zahl ein: ")

# "+" verbindet zwei Texte einfach hintereinander (Konkatenation).
# Bei den Eingaben "12" und "3" käme hier "123" heraus - nicht 15!
print("Als Text aneinandergehängt:", erste_eingabe + zweite_eingabe)

# Damit wir rechnen können, müssen wir den Text erst in eine ganze Zahl
# umwandeln. Das erledigt die Funktion int().
erste_zahl = int(erste_eingabe)
zweite_zahl = int(zweite_eingabe)

print("Als Zahlen addiert:", erste_zahl + zweite_zahl)
