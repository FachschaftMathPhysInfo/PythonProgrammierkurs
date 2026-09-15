# Die math-Bibliothek bietet mathematische Funktionen
import math

# Quadratwurzel berechnen
zahl = 16
wurzel = math.sqrt(zahl)
print(f"Die Quadratwurzel von {zahl} ist {wurzel}")

# Die Konstante Pi nutzen
radius = 5
umfang = 2 * math.pi * radius
flaeche = math.pi * radius ** 2
print(f"Kreis mit Radius {radius}:")
print(f"  Umfang: {umfang}")
print(f"  Fläche: {flaeche}")

# Winkelfunktionen (Winkel in Radianten!)
winkel_rad = math.pi / 4  # 45 Grad in Radianten
print(f"sin(45°) = {math.sin(winkel_rad)}")
print(f"cos(45°) = {math.cos(winkel_rad)}")

# Runden nach mathematischen Regeln
zahl = 3.7
gerundet = math.floor(zahl)  # Abrunden
print(f"floor({zahl}) = {gerundet}")

aufgerundet = math.ceil(zahl)  # Aufrunden
print(f"ceil({zahl}) = {aufgerundet}")
