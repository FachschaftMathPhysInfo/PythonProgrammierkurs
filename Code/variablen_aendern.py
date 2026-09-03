# Ein Programm ist eine Folge von Anweisungen, die von oben nach unten
# abgearbeitet werden - keine Sammlung mathematischer Aussagen.

zaehler = 0          # Lasse zaehler zuerst den Wert 0 haben.
zaehler = zaehler + 1  # Nimm den aktuellen Wert (0), addiere 1, speichere zurueck.
zaehler = zaehler + 1  # Und noch einmal: aus 1 wird 2.

print("zaehler ist jetzt:", zaehler)

# Mathematisch ergibt "zaehler = zaehler + 1" keinen Sinn.
# Als Anweisung gelesen heisst es: "Der Name links soll ab jetzt den
# Wert der rechten Seite tragen."

# Eine Variable kann im Laufe des Programms ihren Wert - und sogar ihre
# Art von Wert - wechseln:
inhalt = "ein Text"
print(inhalt, "->", type(inhalt))

inhalt = 42
print(inhalt, "->", type(inhalt))

inhalt = 3.5
print(inhalt, "->", type(inhalt))
