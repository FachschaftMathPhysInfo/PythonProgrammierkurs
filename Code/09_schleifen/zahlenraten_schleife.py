# Das Ratespiel aus der letzten Lektion - jetzt mit mehreren Versuchen.

GESUCHTE_ZAHL = 7
MAX_VERSUCHE = 3

versuch = 0
geraten = False

while versuch < MAX_VERSUCHE and not geraten:
    versuch += 1
    tipp = int(input(f"Versuch {versuch} von {MAX_VERSUCHE}. Zahl von 1 bis 10? "))

    if tipp == GESUCHTE_ZAHL:
        print("Volltreffer!")
        geraten = True
    elif tipp < GESUCHTE_ZAHL:
        print("Zu klein.")
    else:
        print("Zu gross.")

if not geraten:
    print(f"Schade, die Zahl war {GESUCHTE_ZAHL}.")

# Die Schleife endet aus ZWEI Gruenden: entweder sind die Versuche
# aufgebraucht, oder die Zahl wurde erraten. Beides steht in der Bedingung.
