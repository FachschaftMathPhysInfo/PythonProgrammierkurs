# Ein einfenes Modul mit nützlichen Funktionen
# Speichere diese Datei als: mathe_hilfsmittel.py

def quersumme(zahl):
    """Berechnet die Quersumme einer positiven ganzen Zahl."""
    gesamt = 0
    while zahl > 0:
        gesamt += zahl % 10
        zahl = zahl // 10
    return gesamt


def ist_palindrom(text):
    """Prüft, ob ein Text vorwärts und rückwärts gleich ist."""
    # Leerzeichen und Großbuchstaben ignorieren
    sauberer_text = text.replace(" ", "").lower()
    return sauberer_text == sauberer_text[::-1]


def fakultaet(n):
    """Berechnet die Fakultät von n (n!)."""
    if n < 0:
        return None
    elif n == 0 or n == 1:
        return 1
    else:
        ergebnis = 1
        for i in range(2, n + 1):
            ergebnis *= i
        return ergebnis


def durchschnitt(zahlen):
    """Berechnet den Durchschnitt einer Liste von Zahlen."""
    if len(zahlen) == 0:
        return None
    return sum(zahlen) / len(zahlen)
