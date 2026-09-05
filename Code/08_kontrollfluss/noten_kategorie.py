# Mehr als zwei Faelle: mit "elif" (kurz fuer "else if") haengen wir
# weitere Bedingungen an. Python prueft sie der Reihe nach von oben nach
# unten und nimmt den ERSTEN Zweig, dessen Bedingung wahr ist.

punkte = int(input("Wie viele Punkte hast du erreicht (0-100)? "))

if punkte >= 90:
    note = "sehr gut"
elif punkte >= 75:
    note = "gut"
elif punkte >= 60:
    note = "befriedigend"
elif punkte >= 50:
    note = "ausreichend"
else:
    # Wird nur erreicht, wenn KEINE der Bedingungen oben wahr war.
    note = "nicht bestanden"

print(f"Ergebnis: {note}")

# Warum ist die Reihenfolge wichtig? Bei 95 Punkten ist auch
# "punkte >= 75" wahr - aber Python hat den ersten passenden Zweig
# (punkte >= 90) schon genommen und ueberspringt den Rest.
