#import "../lib/helpers.typ": *;
== Lektion: Funktionen

#Theorie()[

Stellt euch eine Küchenmaschine vor, die Orangen zu Saft presst: Ihr gebt
Orangen hinein (die Eingabe), die Maschine tut ihre Arbeit, und am Ende
bekommt ihr ein Glas Saft heraus (die Ausgabe). Ihr müsst nicht wissen, wie
die Maschine im Inneren genau funktioniert -- Hauptsache, das Ergebnis
stimmt. Und ihr könnt die Maschine beliebig oft benutzen, mit
unterschiedlichen Mengen an Orangen, ohne sie jedes Mal neu zu bauen.

Genau das ist die Grundidee einer *Funktion* in der Programmierung: ein
wiederverwendbarer Baustein, dem ihr Werte übergebt (die *Parameter*) und
der euch dafür ein Ergebnis zurückgibt (den *Rückgabewert*). Das Konzept
kennt ihr bereits aus der Mathematik, zum Beispiel f(x) = x². Dort schreibt
ihr einfach f(3), wenn ihr eigentlich 3² meint -- die Funktion „versteckt"
die eigentliche Rechnung hinter einem Namen.

In Python sieht die Bauanleitung für eine Funktion so aus:

```
def name(parameter1, parameter2):
    # Anweisungen
    return ergebnis
```

Am Beispiel unserer Potenz-Funktion `potenz(x, n)` sieht das dann konkret
so aus:

#align(center)[
  $ underbrace("def", "Schlüsselwort") quad overbrace("potenz", "Name") thin \( underbrace("x", "Parameter 1") , underbrace("n", "Parameter 2") \) : $
]

- `def` (kurz für „define") leitet die Definition ein
- `name` ist ein frei wählbarer, sprechender Name für die Funktion (wie bei
  Variablen: `flaeche_berechnen` statt `f1`)
- in den Klammern stehen die *Parameter* -- Platzhalter für Werte, die die
  Funktion beim Aufruf entgegennimmt
- der eingerückte Block darunter ist der *Funktionsrumpf*, der ausgeführt
  wird, sobald die Funktion aufgerufen wird

Ein typischer Stolperstein: Anders als in vielen anderen Sprachen braucht
Python keine geschweiften Klammern, um zu markieren, was zur Funktion
gehört. Es zählt allein die *Einrückung* -- genau wie ihr es schon von
`if` und `while` kennt. Ihr merkt, dass ihr aus dem Funktionsrumpf
„herausgefallen" seid, sobald eine Zeile wieder auf der ursprünglichen
Ebene beginnt.

Wichtig ist außerdem die Unterscheidung zwischen *Ausgabe* und *Rückgabe*,
an der viele anfangs stolpern: `print()` gibt lediglich Text auf dem
Bildschirm aus, sichtbar für die Nutzerin. `return` gibt hingegen einen
Wert an die Stelle im Programm zurück, an der die Funktion aufgerufen
wurde, damit dieser dort in einer Variable gespeichert oder direkt
weiterverarbeitet werden kann. Ein häufiger Anfängerfehler ist es, eine
Funktion, die nur druckt, für eine Berechnung weiterverwenden zu wollen --
probiert im Praxisteil selbst aus, was dabei passiert.

Ruft man eine Funktion auf, z.B. `potenz(3.142, 4)`, so wird der
Funktionsaufruf im Programm quasi „durch das Ergebnis ersetzt". Deshalb
könnt ihr Funktionsaufrufe auch ineinander verschachteln:
`potenz(5.0 + potenz(3.0, 2), 3)` wird zunächst innen ausgewertet --
`potenz(3.0, 2)` ergibt `9.0`, damit wird daraus `potenz(14.0, 3)`, und
das ergibt schließlich `2744.0`. Das folgende Beispiel zeigt genau das:

#Code("10_funktionen/funktionen_basics.py")

Unsere Funktion `potenz` wird hier viermal aufgerufen: einmal mit
konkreten Werten, einmal mit einer Variable als Parameter, und einmal mit
dem Ergebnis eines weiteren Funktionsaufrufs -- ohne dass dieses zuerst in
einer eigenen Variable zwischengespeichert werden muss.

Ein besonderer Fall ist es, wenn sich eine Funktion selbst aufruft -- das
nennt man *Rekursion*. Ein klassisches Beispiel ist die Fakultät
(n! = 1 · 2 · 3 · ... · n):

#Code("10_funktionen/funktionen_fakultaet.py")

Entscheidend ist hier der *Basisfall* (`n == 0`), der die Rekursion
beendet. Ohne ihn würde sich die Funktion unendlich oft selbst aufrufen.
Da jeder Funktionsaufruf Speicher belegt (den sogenannten *Call Stack*),
führt eine zu tiefe oder endlose Rekursion in Python irgendwann zu einem
`RecursionError` -- probiert das im Spielteil gerne selbst aus. Das ist
kein Beinbruch, sondern eine ganz natürliche Grenze rekursiver Lösungen,
die euch später im Studium noch öfter begegnen wird.
]

#Praxis()[

+ Schreibt eine Funktion `quadrat(x)`, die eine Zahl mit sich selbst
  multipliziert und das Ergebnis zurückgibt (ohne den Operator `**` zu
  benutzen). Ruft sie mit mehreren unterschiedlichen Werten auf und gebt
  euch die Ergebnisse mit `print()` aus.
+ Verändert eure Funktion testweise so, dass sie statt `return ergebnis`
  nur `print(ergebnis)` enthält. Versucht anschließend,
  `x = quadrat(4)` zu schreiben und `x` danach auszugeben. Was passiert,
  und warum? (Tipp: Schaut euch an, welchen Typ `x` jetzt hat, mit
  `print(type(x))`.)

]

Funktionen werden vor allem dann gebraucht, wenn ein Programmteil
mehrfach mit unterschiedlichen Werten ausgeführt werden soll. Ein
motivierendes Beispiel dafür ist die *Collatz-Vermutung*: Man nehme sich
eine beliebige natürliche Startzahl $x_1$ und bilde daraus immer wieder
nach folgender Regel die nächste Zahl der Folge:

#align(center)[
  $ x_n = cases(
    x_(n-1) / 2 & "falls " x_(n-1) " gerade",
    3 dot.op x_(n-1) + 1 & "falls " x_(n-1) " ungerade",
  ) $
]

Die Vermutung (bis heute weder bewiesen noch widerlegt) besagt, dass man
bei *jeder* Startzahl irgendwann bei der 1 landet -- egal, wie groß die
Startzahl ist. Für den Startwert $x_1 = 42$ sieht die Folge zum Beispiel
so aus:

#align(center)[
  42 #sym.arrow.r 21 #sym.arrow.r 64 #sym.arrow.r 32 #sym.arrow.r 16
  #sym.arrow.r 8 #sym.arrow.r 4 #sym.arrow.r 2 #sym.arrow.r 1
  #sym.arrow.r 4 #sym.arrow.r 2 #sym.arrow.r 1 #sym.arrow.r ...
]

Damit wir für eine gegebene Zahl nicht jedes Mal von Hand rechnen müssen,
lagern wir die Rechenregel in eine Funktion `collatz(x)` aus, die uns die
jeweils nächste Zahl der Folge zurückgibt:

#Code("10_funktionen/funktionen_collatz.py")

#Praxis()[

+ Verändert das Programm in `funktionen_collatz.py` so, dass es nicht die
  einzelnen Zahlen `x1`, `x2` und `x3`, sondern deren Summe ausgibt.
+ Ergänzt das Programm um eine vierte Zahl `x4 = collatz(x3)` und gebt die
  gesamte Folge `eingabe -> x1 -> x2 -> x3 -> x4` aus.

]

#Spiel()[

+ Schreibt eine Funktion `schritte(x)`, die zählt, wie viele Schritte die
  Collatz-Folge braucht, bis sie bei der 1 ankommt, und diese Anzahl als
  Ganzzahl zurückgibt. Probiert die Funktion mit ein paar Startwerten aus.
+ Fragt zwei Zahlen von der Nutzerin ab und findet mithilfe eurer
  `schritte`-Funktion heraus, welche der beiden mehr Schritte bis zur 1
  benötigt.
+ Was passiert, wenn ihr in einer Funktion mehrere `return`-Anweisungen
  hintereinander benutzt? Probiert es aus -- welche wird tatsächlich
  ausgeführt?
+ Verschiebt die Definition von `collatz` in `funktionen_collatz.py` ans
  Ende der Datei, also *hinter* die Zeile, in der sie zum ersten Mal
  aufgerufen wird. Führt das Programm aus. Welcher Fehler tritt auf?
  (Anders als in kompilierten Sprachen liest Python eine Datei
  schrittweise von oben nach unten -- eine Funktion muss deshalb *vor*
  ihrem ersten Aufruf definiert sein.)
+ Implementiert eine rekursive Funktion `fibonacci(n)`, die das n-te
  Element der Fibonacci-Folge berechnet (`fibonacci(0) = 0`,
  `fibonacci(1) = 1`, `fibonacci(n) = fibonacci(n-1) + fibonacci(n-2)`).
+ Ruft eure `fakultaet`-Funktion aus dem Theorieteil mit einer sehr großen
  Zahl auf, z.B. `fakultaet(5000)`. Was passiert? Schaut euch die
  Fehlermeldung genau an -- was sagt sie euch über den Call Stack?
+ Schaut euch eure bisherigen Lösungen aus früheren Lektionen an: Findet
  ihr Stellen, an denen ihr wiederkehrenden Code in eine eigene Funktion
  auslagern könntet?

]

#Quiz(answer: "b), d)")[
  Welche Aussagen zu Funktionen in Python sind korrekt?
  + Eine Funktion muss immer einen Wert zurückgeben
  + Der Funktionsrumpf wird durch Einrückung markiert, nicht durch
    geschweifte Klammern
  + `print()` innerhalb einer Funktion gibt einen Wert an die aufrufende
    Stelle zurück
  + Dieselbe Funktion kann mehrmals mit unterschiedlichen Argumenten
    aufgerufen werden
]

#Quiz(answer: "b)")[
  Was passiert, wenn eine rekursive Funktion keinen Basisfall besitzt, der
  die Rekursion beendet?
  + Python berechnet trotzdem irgendwann das richtige Ergebnis
  + Es kommt zu einem `RecursionError`, weil der Call Stack irgendwann
    überläuft
  + Die Funktion gibt automatisch `None` zurück und läuft normal weiter
  + Der Computer stürzt sofort vollständig ab
]
