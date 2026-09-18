def durchschnitt(werte):
    """Berechnet den Mittelwert aller Zahlen in der uebergebenen Liste."""
    summe = 0.0
    for wert in werte:
        summe = summe + wert
    return summe / len(werte)


def hinzufuegen(liste, eintrag):
    """Haengt einen Eintrag an - und veraendert dabei die Original-Liste."""
    liste.append(eintrag)


noten = [1.7, 2.3, 1.0, 3.0]
print("Durchschnitt:", durchschnitt(noten))

# Achtung, wichtiger Unterschied zu Zahlen:
# Eine Liste wird nicht kopiert, wenn man sie an eine Funktion uebergibt.
# Die Funktion arbeitet auf DERSELBEN Liste.
print("Vorher: ", noten)
hinzufuegen(noten, 2.0)
print("Nachher:", noten)

# Bei einer Zahl passiert das nicht:
def erhoehen(zahl):
    zahl = zahl + 1


punkte = 10
erhoehen(punkte)
print("Punkte sind unveraendert:", punkte)

# Wer die Original-Liste schuetzen will, uebergibt eine Kopie.
# liste[:] erzeugt eine echte Kopie aller Elemente.
kopie = noten[:]
hinzufuegen(kopie, 5.0)
print("Original:", noten)
print("Kopie:   ", kopie)
