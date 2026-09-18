# matplotlib ist KEINE Standard-Bibliothek -- vorher installieren mit:
#   pip install matplotlib
import matplotlib.pyplot as plt

# Dieselbe Art von Liste wie in der Listen-Lektion, diesmal aber
# nicht nur ausgegeben, sondern auch sichtbar gemacht.
temperaturen = [3, 5, 9, 14, 18, 22, 25, 24, 19, 13, 7, 4]
monate = ["Jan", "Feb", "Mär", "Apr", "Mai", "Jun",
          "Jul", "Aug", "Sep", "Okt", "Nov", "Dez"]

plt.plot(monate, temperaturen)
plt.title("Durchschnittstemperatur pro Monat")
plt.xlabel("Monat")
plt.ylabel("Temperatur in °C")
plt.show()
