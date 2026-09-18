def anzeigen(liste):
    if len(liste) == 0:
        print("Die Liste ist noch leer.")
        return
    for i in range(len(liste)):
        print(i + 1, "-", liste[i])


einkaufsliste = []
laeuft = True

while laeuft:
    print()
    print("--- Einkaufsliste ---")
    anzeigen(einkaufsliste)
    print("[h]inzufuegen  [s]treichen  [b]eenden")

    befehl = input("Was moechtest du tun? ")

    if befehl == "h":
        artikel = input("Was soll auf die Liste? ")
        einkaufsliste.append(artikel)
    elif befehl == "s":
        artikel = input("Was hast du eingekauft? ")
        # Ohne diese Pruefung wuerde remove() bei einem unbekannten
        # Artikel das Programm mit einem ValueError abbrechen.
        if artikel in einkaufsliste:
            einkaufsliste.remove(artikel)
        else:
            print("Das steht gar nicht auf der Liste.")
    elif befehl == "b":
        laeuft = False
    else:
        print("Diesen Befehl kenne ich nicht.")

print("Bis zum naechsten Einkauf!")
