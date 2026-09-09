temperaturen = [17.5, 21.0, 19.3, 23.8, 15.2]

# Variante 1: direkt ueber die Elemente laufen.
# Das ist die uebliche Schreibweise, wenn der Index egal ist.
summe = 0.0
for wert in temperaturen:
    summe = summe + wert

print("Summe:          ", summe)
print("Durchschnitt:   ", summe / len(temperaturen))

# Variante 2: ueber die Indizes laufen.
# range(len(...)) liefert 0, 1, 2, ... bis len-1.
# Das brauchen wir, wenn wir die Position mit ausgeben wollen.
for i in range(len(temperaturen)):
    print("Tag", i + 1, "hatte", temperaturen[i], "Grad")

# Das Maximum von Hand suchen: wir merken uns den bisher groessten Wert.
groesster = temperaturen[0]
for wert in temperaturen:
    if wert > groesster:
        groesster = wert

print("Waermster Tag:  ", groesster, "Grad")

# Eine neue Liste aufbauen: leer starten und Stueck fuer Stueck fuellen.
warme_tage = []
for wert in temperaturen:
    if wert > 18.0:
        warme_tage.append(wert)

print("Ueber 18 Grad:  ", warme_tage)
