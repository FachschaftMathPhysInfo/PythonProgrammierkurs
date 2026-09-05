# Eine while-Schleife wiederholt einen Block, solange die Bedingung wahr ist.

sekunden = 5

while sekunden > 0:
    print(sekunden)
    sekunden = sekunden - 1   # Ohne diese Zeile laeuft die Schleife ewig!

print("Start!")

# Ablauf: Python prueft "sekunden > 0". Ist das wahr, laeuft der eingerueckte
# Block einmal komplett durch - danach wird die Bedingung ERNEUT geprueft.
# Erst wenn sie falsch ist, geht es unterhalb der Schleife weiter.
