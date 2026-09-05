# Aus der letzten Lektion: Dieses Programm stuerzt ab, wenn die zweite
# Zahl 0 ist (ZeroDivisionError). Jetzt fangen wir diesen Fall hoeflich ab.

erste_zahl = int(input("Gib eine ganze Zahl ein: "))
zweite_zahl = int(input("Gib noch eine ganze Zahl ein: "))

# Die bedingte Anweisung: Python prueft, ob die Bedingung nach "if" wahr ist.
if zweite_zahl == 0:
    # Dieser Block wird NUR ausgefuehrt, wenn die Bedingung wahr ist.
    print("Fehler: Durch 0 darf nicht geteilt werden.")
else:
    # Dieser Block wird ausgefuehrt, wenn die Bedingung falsch ist.
    ergebnis = erste_zahl / zweite_zahl
    print(f"{erste_zahl} geteilt durch {zweite_zahl} ist {ergebnis}")

# Diese Zeile steht NICHT eingerueckt - sie gehoert zu keinem Block
# und wird deshalb immer ausgefuehrt, egal wie die Eingabe war.
print("Das Programm ist fertig.")
