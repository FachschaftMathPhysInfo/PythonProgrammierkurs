einkaufsliste = ["Milch", "Brot", "Eier", "Kaese"]

# Der Index zaehlt ab 0, nicht ab 1!
print("Das erste Element:", einkaufsliste[0])
print("Das dritte Element:", einkaufsliste[2])

# Negative Indizes zaehlen von hinten: -1 ist das letzte Element.
print("Das letzte Element:", einkaufsliste[-1])

# len() sagt uns, wie viele Elemente die Liste enthaelt.
anzahl = len(einkaufsliste)
print("Die Liste hat", anzahl, "Eintraege.")

# Der groesste gueltige Index ist also anzahl - 1:
print("Auch das letzte Element:", einkaufsliste[anzahl - 1])

# Eine Liste darf auch Zahlen enthalten - oder gemischte Typen.
temperaturen = [17.5, 21.0, 19.3, 23.8]
gemischt = ["Federico", 21, True]
print(temperaturen, gemischt)

# Eine leere Liste ist ein voellig gueltiger Startpunkt.
notizen = []
print("Leere Liste:", notizen, "mit Laenge", len(notizen))
