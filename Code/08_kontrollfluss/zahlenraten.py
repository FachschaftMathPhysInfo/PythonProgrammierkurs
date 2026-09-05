# Ein kleines Ratespiel - noch mit nur einem Versuch.
# (In der naechsten Lektion, "Schleifen", geben wir mehrere Versuche.)

GESUCHTE_ZAHL = 7

tipp = int(input("Ich denke an eine Zahl von 1 bis 10. Dein Tipp? "))

if tipp == GESUCHTE_ZAHL:
    print("Volltreffer!")
elif tipp < GESUCHTE_ZAHL:
    print("Zu klein.")
else:
    print("Zu gross.")

# Bonus: verschachtelte Bedingung. Der innere if steht weiter eingerueckt
# und wird nur geprueft, wenn der aeussere if schon wahr war.
if tipp != GESUCHTE_ZAHL:
    abstand = GESUCHTE_ZAHL - tipp
    if abstand < 0:
        abstand = -abstand
    if abstand == 1:
        print("Aber ganz knapp daneben!")
