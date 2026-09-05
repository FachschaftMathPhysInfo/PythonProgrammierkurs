# Schleifen duerfen ineinander stecken. Die innere Schleife laeuft dabei
# bei jedem einzelnen Durchlauf der aeusseren Schleife komplett durch.

for reihe in range(1, 11):

    for faktor in range(1, 11):
        ergebnis = reihe * faktor
        # end=" " verhindert den Zeilenumbruch nach jeder Ausgabe.
        # :4 sorgt fuer eine Breite von vier Zeichen - so stehen die Spalten untereinander.
        print(f"{ergebnis:4}", end=" ")

    print()   # leeres print() beendet die Zeile

# 10 Durchlaeufe aussen mal 10 Durchlaeufe innen ergeben 100 Ausgaben.
