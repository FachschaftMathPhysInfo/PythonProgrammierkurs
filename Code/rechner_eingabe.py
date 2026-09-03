# Ein kleines Rechenprogramm: Es nimmt zwei ganze Zahlen entgegen und gibt
# Summe, Differenz, Produkt und Quotient aus.

erste_zahl = int(input("Gib eine ganze Zahl ein: "))
zweite_zahl = int(input("Gib noch eine ganze Zahl ein: "))

print("Summe:     ", erste_zahl + zweite_zahl)
print("Differenz: ", erste_zahl - zweite_zahl)
print("Produkt:   ", erste_zahl * zweite_zahl)
print("Quotient:  ", erste_zahl / zweite_zahl)

# f-strings sind bequem, um Text und Werte zu mischen:
print(f"{erste_zahl} geteilt durch {zweite_zahl} ist {erste_zahl / zweite_zahl}")
