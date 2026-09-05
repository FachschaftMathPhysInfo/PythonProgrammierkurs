# In Python entscheidet die EINRUECKUNG, welche Zeilen zu einem Block
# gehoeren. Es gibt keine geschweiften Klammern wie in anderen Sprachen.

alter = int(input("Wie alt bist du? "))

# --- Version A: beide print-Zeilen sind eingerueckt ---------------------
# Beide Zeilen gehoeren zum if-Block. Bei alter >= 18 werden BEIDE
# ausgegeben, sonst KEINE.
if alter >= 18:
    print("Du bist volljaehrig.")
    print("Du darfst waehlen.")

# --- Zum Ausprobieren: ruecke die zweite Zeile aus --------------------
# Wenn "Du darfst waehlen." NICHT eingerueckt ist, gehoert sie nicht mehr
# zum if-Block. Dann wird sie IMMER ausgegeben - auch fuer eine 12.
#
# if alter >= 18:
#     print("Du bist volljaehrig.")
# print("Du darfst waehlen.")     # <- steht jetzt ausserhalb des if

# Merke: Die Einrueckung ist nicht Deko, sie ist Teil der Bedeutung.
# Ueblich sind 4 Leerzeichen pro Stufe. Alle Zeilen eines Blocks muessen
# gleich weit eingerueckt sein.
