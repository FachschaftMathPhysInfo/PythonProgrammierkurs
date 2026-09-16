from dataclasses import dataclass


@dataclass
class Spielfeld:
    breite: int
    hoehe: int
    zellen: list  # Liste von Listen mit True (lebendig) / False (tot)


def starte_leeres_feld(breite: int, hoehe: int) -> Spielfeld:
    zellen = [[False for _ in range(breite)] for _ in range(hoehe)]
    return Spielfeld(breite, hoehe, zellen)


def ist_lebendig(feld: Spielfeld, x: int, y: int) -> bool:
    # TODO: True zurueckgeben, wenn die Zelle an (x, y) lebendig ist.
    # Achtung: x, y koennen ausserhalb des Feldes liegen -- dann: tot.
    pass


def zaehle_lebende_nachbarn(feld: Spielfeld, x: int, y: int) -> int:
    # TODO: die 8 Nachbarzellen von (x, y) durchgehen und zaehlen,
    # wie viele davon lebendig sind (ist_lebendig() hilft hier).
    pass


def naechste_generation(feld: Spielfeld) -> Spielfeld:
    # TODO: aus dem aktuellen Feld ein neues Spielfeld nach den 4 Regeln
    # berechnen. Nicht das alte Feld veraendern, ein neues zurueckgeben!
    pass


def zeige_feld(feld: Spielfeld):
    # TODO: das Feld zeilenweise ausgeben, z.B. "#" fuer lebendig, "." fuer tot.
    pass


if __name__ == "__main__":
    feld = starte_leeres_feld(10, 10)
    # TODO: ein paar Zellen lebendig machen, z.B. einen Glider
    zeige_feld(feld)
