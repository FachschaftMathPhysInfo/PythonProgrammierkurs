einkaufsliste = ["Milch", "Brot", "Eier"]
print("Start:      ", einkaufsliste)

# Ein Element hinten anhaengen
einkaufsliste.append("Kaese")
print("append:     ", einkaufsliste)

# Ein Element an einer bestimmten Position einfuegen.
# Alle folgenden Elemente ruecken dabei eine Position nach hinten.
einkaufsliste.insert(1, "Butter")
print("insert:     ", einkaufsliste)

# Ein Element ueber seinen Wert entfernen (das erste Vorkommen)
einkaufsliste.remove("Eier")
print("remove:     ", einkaufsliste)

# Ein Element ueber seinen Index entfernen - pop() gibt es zusaetzlich zurueck
letztes = einkaufsliste.pop()
print("pop:        ", einkaufsliste, "| entfernt wurde:", letztes)

# Ein vorhandenes Element ueberschreiben
einkaufsliste[0] = "Hafermilch"
print("zugewiesen: ", einkaufsliste)

# Pruefen, ob ein Wert enthalten ist
if "Brot" in einkaufsliste:
    print("Brot steht auf der Liste.")

# Vorsicht: append haengt genau EIN Element an.
# Zwei Listen verbindet man mit + oder extend().
zusatz = ["Apfel", "Banane"]
einkaufsliste = einkaufsliste + zusatz
print("verbunden:  ", einkaufsliste)
