#import "../lib/helpers.typ": *

== Lektion: Imports

#Theorie()[
    //Haben keine Listen selber geschriebe, muss man anders formulieren.
// Ihr habt in der letzten Lektion gelernt, wie man eigene Datenstrukturen -- Listen -- baut und damit selbst geschriebene Werkzeuge zusammensetzt. Jetzt geht es einen Schritt weiter: Wie holt man sich fertige, bereits von anderen gebaute Werkzeuge in sein Programm, ohne sie selbst schreiben zu müssen?

    // Stellt euch ein großes Haus vor, in dem jedes Zimmer eine bestimmte Aufgabe hat: die Küche zum Kochen, die Werkstatt zum Schrauben, die Bibliothek zum Lesen. Wenn ihr kochen wollt, geht ihr in die Küche, aber ihr müsst die Küche nicht selbst in eurem Wohnzimmer bauen. Der Zugang ist einfach vorhanden, man muss ihn nur nutzen.

    Wir haben jetzt viele Grundwerkzeuge kennengelernt und können jetz alles Programmieren was man programmieren kann  (das wurde sogar mal bewiesen). Doch alles selber schreiben ist anstrengend. Programmiererinnen sind faul und bedienen sich gerne am Code von anderen. Niemand will immer alles von Grund auf selber schreiben. Es wäre doch toll, wenn wir einfach bestehenden Code nehmen können, und ihn in unserem Programm einfach verwenden können.

Genau so funktionieren *Module* und *Imports* in Python: Andere Programmierer haben bereits nützliche Funktionen und Werkzeuge geschrieben, mathematische Funktionen, Zufallszahlengeneratoren, Dateioperationen und vieles mehr. Diese sind in sogenannten *Modulen* organisiert. Mit dem Befehl `import` holt ihr euch diese Module ins Programm und könnt sie sofort benutzen als ob ihr sie selber geschrieben hättet.

Ohne Imports müsste jeder Programmierer alles von Grund auf neu schreiben. Wurzeln berechnen? Zufallszahlen generieren? Listen sortieren? Das würde immer wieder hunderte Zeilen Code bedeuten. Mit Imports könnt ihr auf bewährte, getestete Lösungen zurückgreifen, eine zentrale Stärke von Python.

=== Die Standard-Bibliothek

Python kommt mit einer riesigen *Standard-Bibliothek*, das sind Module, die bereits mit Python installiert sind. Ihr müsst sie nicht extra herunterladen, sie sind immer da. Hier sind einige der wichtigsten:

#align(center)[
  #table(
    columns: 2,
    align: left,
    stroke: 0.5pt,
    [*Modul*], [*Zweck*],
    [`math`], [Mathematische Funktionen (Wurzel, sin, cos, pi, etc.)],
    [`random`], [Zufallszahlen und Zufallsauswahl],
    [`time`], [Datum, Zeit und Verzögerungen],
    [`string`], [Texte und Zeichenklassen],
//    [`json`], [Daten speichern und lesen],
  )
]
//Alles in Python is in C implementiert
Die `math`-Bibliothek ist das perfekte Beispiel: Sie bietet hunderte mathematische Funktionen, die man immer mal wieder braucht kann.  Warum ist das nicht alles standartmäßig in Python? Ein Grund dafür ist das auf einmal sehr viele Namen für Funktionen blockiert sind.

=== Import-Syntax: Verschiedene Wege

Es gibt mehrere Wege, ein Modul zu importieren. Jeder hat seinen Sinn:

#description(format: it => raw(it))[
/ import math: Importiert das ganze Modul. Man schreibt dann `math.sqrt(16)`
/ import math as m: Importiert das Modul mit einem Kürzel. Praktisch bei langen Namen: `m.sqrt(16)`
/ from math import sqrt: Importiert nur eine einzelne Funktion direkt. Man schreibt dann einfach `sqrt(16)`, kein Präfix nötig
/ from math import sqrt, pi: Mehrere Dinge auf einmal importieren
]
//Star Syntax maybe dann im Shell part erklären? Wäre vielleicht sinnvoll
Ein Anfängerfehler: `from math import *` importiert *alles* aus einem Modul auf einmal. Das funktioniert, kann aber zu Verwechslungen führen, wenn mehrere Module Funktionen mit demselben Namen haben. Besser ist es, genau zu sagen, was man braucht.

=== Beispiel: math-Modul für Kreisberechnungen

Ein praktisches Beispiel: Ihr wollt den Umfang und die Fläche eines Kreises berechnen. Dafür braucht ihr Pi (π), und damit wollt ihr euch nicht von Hand einen Näherungswert ausdenken.

#Code("13_import/import_math_basics.py")

Beachtet hier besonders:
- `import math`: Das ganze Modul wird importiert.
- `math.sqrt()`, `math.pi`: Alles wird mit dem Modulnamen vorangestellt.
- `math.floor()` und `math.ceil()`: Funktionen zum Abrunden und Aufrunden, die mit ganzen Zahlen arbeiten.

Das erspart euch die Mühe, Pi selbst auf 15 Dezimalstellen genau zu programmieren und die Implementierung in `math` ist obendrein noch optimiert.

=== Beispiel: random-Modul für Zufall

Die `random`-Bibliothek ist unverzichtbar, wenn euer Programm Zufallsentscheidungen treffen soll, Würfelspiele, Kartenmischen, zufällige Auswahl aus einer Liste.

#Code("13_import/import_random.py")

Wichtig hier:
- `random.randint(1, 6)`: Gibt eine ganze Zahl zwischen 1 und 6 aus, wie ein Würfel.
- `random.choice(liste)`: Wählt zufällig ein Element aus einer Liste.
- `random.shuffle(liste)`: Mischt die Liste durcheinander, verändert die Liste *direkt*, gibt nichts zurück!

=== Kürzel und selektive Imports

Bei längeren Modulnamen ist es praktisch, sie mit `as` zu kürzen:

#Code("13_import/import_with_alias.py")

Hier seht ihr auch `from math import pi, sqrt`, das ist hilfreich, wenn ihr nur einzelne, häufig benutzte Funktionen braucht. Aber Achtung: Ihr könnt dann versehentlich eine Variable mit demselben Namen überschreiben, und die Funktion ist weg.

=== Eigene Module schreiben

Das Schöne ist: Das Konzept funktioniert in beide Richtungen. Ihr könnt euch eigene Sammlungen von Funktionen schreiben und dann wie ein Module importieren. Das ist die Grundlage für größere Programme: Man gliedert seinen Code in logische Teile, jeder Teil wird eine Datei mit nützlichen Funktionen.

Ein einfaches Beispiel: Ihr schreibt eine Datei `eigenes_modul.py` mit hilfreichen mathematischen Funktionen und dann importiert ihr sie überall sonst, wo ihr sie braucht.

#Code("13_import/eigenes_modul.py")

#Code("13_import/eigenes_modul_nutzen.py")

Entscheidend: Die `eigenes_modul_nutzen.py` Datei muss im *selben Verzeichnis* liegen wie `eigenes_modul.py`, sonst findet Python das Modul nicht. (Später, mit Paketen und der richtigen Installation, wird das flexibler, für den Anfang ist "im selben Ordner" aber die Regel.)

Ein praktisches Beispiel, das alles kombiniert: Wir bauen das bekannte Zahlenratespiel, aber diesmal mit echten Zufallszahlen.

#Code("13_import/zahlenratespiel_mit_random.py")

Hier verbindet sich alles: `import random`, um eine Zufallszahl zu wählen; `while`-Schleife und `if`-Verzweigungen, um das Spiel zu steuern; und `try`/`except`, um butzgerät Input zu behandeln.

=== Ausblick: Bibliotheken jenseits der Standard-Bibliothek

`math`, `random` und Co. sind fest eingebaut, sie kommen automatisch mit Python. Daneben gibt es aber tausende weitere Bibliotheken, die *nicht* automatisch dabei sind, sondern erst installiert werden müssen. Dafür gibt es `pip`, den Paketmanager von Python. Mit `pip install matplotlib` ladet ihr zum Beispiel die Bibliothek `matplotlib` herunter, mit der sich Daten als Diagramme darstellen lassen.

Erinnert euch an die `temperaturen`-Liste aus der Listen-Lektion: Bisher konntet ihr sie nur mit `print()` als Zahlenreihe ausgeben. Mit `matplotlib` macht ihr daraus ein echtes Diagramm:

//#Code("13_import/import_matplotlib_beispiel.py") // MISSING

Der Import funktioniert genau wie bei den Standard-Modulen -- `import matplotlib.pyplot as plt` -- ist nur ein Kürzel für einen langen Modulnamen, wie ihr es schon von `import math as m` kennt. Der einzige Unterschied ist, dass `matplotlib` vorher installiert werden muss.

Falls `pip install matplotlib` bei euch nicht auf Anhieb klappt (je nach Betriebssystem und Setup kann das unterschiedlich laufen), ist das kein Problem, dieser Abschnitt ist ein Ausblick zum Kennenlernen, keine Voraussetzung für die kommenden Lektionen.

] // Gefährlich. Ich weiss nicht wie sinnvoll wir mathplotlib auf die Cip rechner bekomḿen.

#Praxis()[

+ Schreibt ein Programm, das mit der `math`-Bibliothek eine Zahl einliest und dann Quadrat, Quadratwurzel und die Fakultät ausgibt. (Hinweis: `math.factorial(n)` berechnet n!)
+ Werft einen Würfel zehnmal und zählt, wie oft eine 6 fällt. Nutzt `random.randint()`.
+ Schreibt ein Programm, das fünf Namen von der Nutzerin einliest, sie in eine Liste packt, sie mit `random.shuffle()` durchmischt und dann in neuer Reihenfolge ausgibt.
+ Speichert die Funktionen aus `eigenes_modul.py` in einer eigenen Datei und schreibt ein Programm, das alle vier Funktionen (`quersumme`, `ist_palindrom`, `fakultaet`, `durchschnitt`) testet.

]

#Praxis()[

Erweitert das Zahlenratespiel aus `zahlenratespiel_mit_random.py`:

+ Gebt nicht nur an, ob die geratene Zahl zu hoch oder zu niedrig ist, sondern auch, wie weit die Abweichung ist (z.B. „Zu niedrig, Abweichung: 15").
+ Setzt eine maximale Anzahl von Versuchen (z.B. 7) und endet das Spiel danach, egal ob richtig geraten oder nicht.
+ Schreibt nach dem Spiel die Anzahl der Versuche in eine Datei (dafür braucht ihr `open()` und `write()`, die ihr ausprobieren dürft).
+ Ändert das Spiel so, dass nicht nur eine, sondern zwei oder drei Zahlen zu erraten sind.

]

#Spiel()[

+ *Würfelsimulation:* Simuliert das Werfen zweier Würfel 1000 Mal und zählt, wie oft die Summe 7 ist. Wie oft sollte das theoretisch vorkommen?
+ *Zufälliger Satz:* Schreibt Listen mit Subjekten, Verben und Objekten (z.B. `subjekte = ["Der Hund", "Die Katze", "Das Kind"]`). Nutzt `random.choice()`, um aus jeder Liste ein Element zu wählen und einen zufälligen Satz zu bilden.
+ *Wort-Statistik:* Schreibt ein Modul, das die Wortlänge analysiert: eine Funktion `laengste_woerter(text, n)`, die die `n` längsten Wörter eines Textes zurückgibt. (Tipp: `len()` funktioniert auf Strings, `split()` teilt einen Text in Wörter.)
+ *Lotto-Ziehung:* Schreibt ein Programm, das 6 verschiedene Zahlen zwischen 1 und 49 zieht (wie beim Lotto) nutzt `random.sample()`. Lest anschließend von der Nutzerin 6 Zahlen ein und sagt ihr, wie viele richtig sind.
+ *Zufälliges Passwort:* Schreibt ein Modul mit einer Funktion `zufallspasswort(laenge)`, die ein zufälliges Passwort generiert. (Tipp: `string.ascii_letters + string.digits + string.punctuation` enthält alle möglichen Zeichen; `random.choice()` und eine `for`-Schleife kombinieren diese.)
+ *Festgelegte Zufallszahl:* Lest nach, was `random.seed()` macht. Warum ist das wichtig für Tests und Reproduzierbarkeit?
+ *Eigene Grafik:* Installiert `matplotlib` (`pip install matplotlib`) und passt `import_matplotlib_beispiel.py` an: Nutzt statt der Temperaturen eine eigene Datenreihe (z.B. eure Würfelergebnisse aus Aufgabe 1) und probiert `plt.bar()` statt `plt.plot()` aus. Was ändert sich?

]

#Quiz(answer: "b)")[
  Was tut die Zeile `import math as m`?
  + Importiert nur die `m`-Funktion aus der math-Bibliothek
  + Importiert das ganze math-Modul, aber gibt ihm das Kürzel `m`
  + Erstellt eine neue Variable namens `m` mit der Wert der math-Bibliothek
  + Das ist ungültige Syntax
]

#Quiz(answer: "a), c)")[
  Welche Aussagen über `from math import sqrt` sind richtig?
  + Man kann danach `sqrt(16)` direkt schreiben, ohne `math.` voranstellen zu müssen
  + Man importiert die ganze math-Bibliothek
  + Nur die `sqrt`-Funktion wird importiert, nicht die ganze Bibliothek
  + Das ist weniger effizient als `import math`
]

#Quiz(answer: "c)")[
  Was passiert bei diesem Code?

  ```python
  import random
  liste = [1, 2, 3, 4, 5]
  ergebnis = random.shuffle(liste)
  print(ergebnis)
  ```

  + Es wird die durchmischte Liste `[3, 1, 4, 5, 2]` ausgegeben (oder ähnlich)
  + Es wird `None` ausgegeben, und die Liste `liste` bleibt unverändert
  + Es wird `None` ausgegeben, aber die Liste `liste` wurde durchmischt
  + Das ist ein Fehler und das Programm bricht ab
]

#Quiz(answer: "b)")[
  Ihr schreibt eine Datei `funktionen.py` mit einer Funktion `berechne(x)`. In einer anderen Datei im selben Verzeichnis schreibt ihr `import funktionen` und ruft `funktionen.berechne(5)` auf. Was passiert?
  + Das ist ein Fehler, man darf nur Standardmodule importieren
  + Die Funktion wird aufgerufen und das Programm funktioniert
  + Das funktioniert nur, wenn `funktionen.py` am Ende `if __name__ == "__main__"` enthält
  + Die Datei `funktionen.py` wird sofort ausgeführt wie ein normales Programm
]

#Quiz(answer: "d)")[
  Die `random`-Bibliothek ist:
  + Teil des Betriebssystems (z.B. Windows oder macOS)
  + Ein Modul, das man separat von Python.org herunterladen muss
  + Nur auf manchen Computern installiert
  + Teil der Standard-Bibliothek und mit Python immer verfügbar
]

Damit habt ihr das letzte Werkzeug in der Hand: Variablen, Kontrollfluss, Schleifen, Funktionen, Listen und jetzt Imports. Mehr braucht es nicht, um ein vollständiges Programm zu bauen, im Abschlussprojekt setzt ihr alles zusammen.
