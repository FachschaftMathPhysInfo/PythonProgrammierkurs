# Unser eigenes Modul nutzen
# Hinweis: Diese Datei muss im selben Verzeichnis wie mathe_hilfsmittel.py liegen!

import eigenes_modul

# Die Funktionen aus unserem Modul benutzen
zahl = 12345
print(f"Quersumme von {zahl}: {eigenes_modul.quersumme(zahl)}")

text = "A man a plan a canal Panama"
ist_pal = eigenes_modul.ist_palindrom(text)
print(f"Ist '{text}' ein Palindrom? {ist_pal}")

# Fakultät von 5 berechnen
print(f"5! = {eigenes_modul.fakultaet(5)}")

# Durchschnitt einer Liste
noten = [2.0, 1.5, 3.5, 2.5]
print(f"Durchschnitt der Noten: {eigenes_modul.durchschnitt(noten)}")
