# Ein Ratespiel mit Zufallszahlen
import random

# Computer wählt eine Zufallszahl von 1 bis 100
geheime_zahl = random.randint(1, 100)
versuche = 0
geraten = False

print("Willkommen zum Zahlenratespiel!")
print("Ich denke mir eine Zahl zwischen 1 und 100.")
print("Versuche, sie zu erraten!")

# So lange raten, bis die richtige Zahl erraten wurde
while not geraten:
    # Nutzereingabe
    eingabe = input("Deine Vermutung: ")

    try:
        zahl = int(eingabe)
    except ValueError:
        print("Bitte gib eine ganze Zahl ein!")
        continue

    versuche += 1

    # Hinweise geben
    if zahl < geheime_zahl:
        print("Zu niedrig! Versuche es höher.")
    elif zahl > geheime_zahl:
        print("Zu hoch! Versuche es niedriger.")
    else:
        geraten = True
        print(f"Richtig! Du hast es in {versuche} Versuchen geschafft!")
