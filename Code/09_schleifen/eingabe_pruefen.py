# Ein haeufiger Einsatz von Schleifen: so lange fragen, bis die Eingabe passt.

alter = -1   # Ein Startwert, der die Bedingung sicher erfuellt.

while alter < 0 or alter > 120:
    alter = int(input("Wie alt bist du? (0 bis 120) "))

    if alter < 0 or alter > 120:
        print("Das kann nicht stimmen. Versuch es noch einmal.")

print(f"Danke! Du bist {alter} Jahre alt.")


# Dieselbe Idee mit "while True" und "break".
# "while True" ist eine Schleife ohne Ende - sie wird von innen heraus
# mit "break" verlassen. Das spart den kuenstlichen Startwert oben.

while True:
    lieblingsfarbe = input("Nenne eine Farbe (nicht leer): ")

    if lieblingsfarbe != "":
        break               # verlaesst die Schleife sofort

    print("Da stand nichts. Bitte nochmal.")

print(f"Schoene Wahl: {lieblingsfarbe}")
