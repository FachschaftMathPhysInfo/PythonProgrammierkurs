# Jede Bedingung ist im Kern eine Frage, die Python mit True (wahr) oder
# False (falsch) beantwortet. True und False sind ein eigener Datentyp: bool.

alter = 20

print(alter == 20)   # Gleich?            -> True
print(alter != 20)   # Ungleich?          -> False
print(alter < 18)    # Kleiner?           -> False
print(alter >= 18)   # Groesser-gleich?   -> True

# Mit and, or und not lassen sich Bedingungen verknuepfen:
temperatur = 24
sonnig = True

print(temperatur > 20 and sonnig)   # beide muessen wahr sein  -> True
print(temperatur > 30 or sonnig)    # eine reicht              -> True
print(not sonnig)                   # kehrt um                 -> False

# Genau dieselben Ausdruecke stehen sonst hinter einem "if":
if temperatur > 20 and sonnig:
    print("Zeit fuer eine Pause draussen.")
