# Eine for-Schleife laeuft nicht nur ueber Zahlen, sondern ueber alles,
# was aus mehreren Teilen besteht. Ein Text besteht aus einzelnen Zeichen.

wort = "Python"

for zeichen in wort:
    print(zeichen)

print("---")

# Damit lassen sich Texte untersuchen. Hier zaehlen wir die Vokale.

satz = input("Schreib einen Satz: ")
vokale = 0

for zeichen in satz:
    if zeichen in "aeiouAEIOU":
        vokale += 1

print(f"Dein Satz enthaelt {vokale} Vokale.")

# Das Wort "in" hat hier zwei verschiedene Aufgaben:
# In der for-Zeile bedeutet es "laufe nacheinander durch".
# In der if-Zeile bedeutet es "kommt darin vor?" und liefert True oder False.
