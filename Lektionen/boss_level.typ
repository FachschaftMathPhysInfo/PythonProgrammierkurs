#import "../lib/helpers.typ": *

== Boss level: Conway's Game of Life

Das war's mit neuen Werkzeugen. Variablen, Kontrollfluss, Schleifen,
Funktionen, Listen, Imports -- alles da. Jetzt wird kombiniert: dein
Abschlussprojekt ist *Conway's Game of Life*, eine Simulation, bei der aus
ein paar simplen Regeln überraschend komplexe Muster entstehen. Diese
Lektion ist deine Anleitung dafür: die Regeln, ein neues Werkzeug
(`dataclass`), und der Fahrplan in drei Phasen.

=== Die Regeln

Ein Spielfeld aus Zellen, jede Zelle ist *lebendig* oder *tot*. Jede Zelle
hat 8 Nachbarn (auch diagonal). Bei jedem Schritt entscheiden diese 4
Regeln gleichzeitig über *alle* Zellen neu:

- *Unterbevölkerung:* Eine lebendige Zelle mit weniger als 2 lebenden
  Nachbarn stirbt.
- *Weiterleben:* Eine lebendige Zelle mit 2 oder 3 lebenden Nachbarn lebt
  weiter.
- *Überbevölkerung:* Eine lebendige Zelle mit mehr als 3 lebenden Nachbarn
  stirbt.
- *Reproduktion:* Eine tote Zelle mit genau 3 lebenden Nachbarn wird
  lebendig.

Wichtig: Die neue Generation wird komplett aus der *alten* berechnet.
Keine Zelle darf sich mitten in der Berechnung schon ändern, sonst zählen
die Nachbarn falsch.

=== dataclass: Felder mit Namen

Bisher hättest du ein Spielfeld z.B. als drei einzelne Variablen
`breite`, `hoehe`, `zellen` durch den Code geschleift, oder als Tupel
`(breite, hoehe, zellen)`, bei dem man sich merken muss, welche Position
welche Bedeutung hat. `dataclass` löst genau das: ein benannter Container
für zusammengehörige Werte.

#Code("14_Boss_Level/dataclass_beispiel.py")

`@dataclass` steht direkt über der Klasse und generiert automatisch die
Grundausstattung (Konstruktor, lesbare Ausgabe, Vergleich per `==`). Du
schreibst nur die Felder mit ihrem Typ hin, den Rest übernimmt Python.

#Hinweis[
  Das ist *kein* Einstieg in klassisches OOP mit Methoden. Eine
  `dataclass` hier ist nichts weiter als eine Liste/ein Dict mit
  Namensschildern an den Werten. Die eigentliche Logik (Regeln, Zählen,
  Anzeigen) bleibt in ganz normalen Funktionen, so wie du es schon
  kennst.
]

=== Projektstruktur

`Spielfeld` bündelt `breite`, `hoehe` und `zellen` (eine Liste von Listen
mit `True`/`False`). Der Rest sind Funktionen, die ein `Spielfeld`
entgegennehmen:

#description(format: it => raw(it))[
/ ist_lebendig(feld, x, y): True, wenn Zelle (x, y) lebendig ist. Werte außerhalb des Feldes zählen als tot.
/ zaehle_lebende_nachbarn(feld, x, y): zählt, wie viele der 8 Nachbarn lebendig sind.
/ naechste_generation(feld): berechnet aus dem alten ein neues Spielfeld nach den 4 Regeln.
/ zeige_feld(feld): gibt das Feld im Terminal aus, z.B. `#` für lebendig, `.` für tot.
]

#Code("14_Boss_Level/conways.py")

#Praxis(title_sup: "Phase 1 -- Grundlogik")[
  + Implementiere `ist_lebendig()`. Denk an Koordinaten außerhalb des
    Feldes.
  + Implementiere `zaehle_lebende_nachbarn()` mit den 8 Nachbarn
    (`x-1` bis `x+1`, `y-1` bis `y+1`, außer `(x, y)` selbst).
  + Implementiere `naechste_generation()` mit den 4 Regeln von oben.
  + Implementiere `zeige_feld()`. Teste mit ein paar von Hand gesetzten
    Zellen, ob eine Generation korrekt weitergerechnet wird.
]

#Praxis(title_sup: "Phase 2 -- Eingabe & Loop")[
  + Bau eine `while`-Schleife, die `zeige_feld()` und
    `naechste_generation()` abwechselnd aufruft, bis die Nutzerin
    abbricht.
  + Lass die Nutzerin am Anfang eintippen, welche Zellen lebendig
    starten sollen (Koordinaten durch Kommata getrennt einlesen).
  + Nutze `time.sleep(0.3)` zwischen den Generationen, damit man die
    Animation im Terminal sehen kann.
]

#Praxis(title_sup: "Phase 3 -- Polish")[
  + Zähle und zeige an, in welcher Generation du gerade bist.
  + Erkenne, wenn sich zwei aufeinanderfolgende Generationen nicht mehr
    unterscheiden (stabiler Zustand), und beende das Programm dann mit
    einer Meldung.
  + Räum den Code auf: sprechende Namen, keine Wiederholungen, kurze
    Funktionen.
]

#Spiel[
  + *Glider:* Setze die 5 Zellen `(1,0) (2,1) (0,2) (1,2) (2,2)` lebendig.
    Dieses Muster wandert über Generationen diagonal über das Feld.
  + *Oszillator:* Setze drei Zellen in eine Reihe. Was passiert?
  + *Größeres Feld:* Probier 30x30 statt 10x10. Ab wann wird das
    Terminal unübersichtlich?
  + *Zufallsstart:* Nutze `random.random()`, um jede Zelle mit z.B. 20%
    Wahrscheinlichkeit lebendig zu starten, statt Koordinaten von Hand
    einzutippen.
  + *Eigene Regeln:* Ändere die Zahlen in den 4 Regeln (z.B.
    Reproduktion bei 2 statt 3 Nachbarn). Was ändert sich am Verhalten?
]
