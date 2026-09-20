#import "../lib/helpers.typ": *;
== Funktionen

#Theorie()[

Stell dir eine Küchenmaschine vor, die Orangen zu Saft presst: Du gibst
Orangen hinein (die Eingabe), die Maschine tut ihre Arbeit, und am Ende
bekommst du ein Glas Saft heraus (die Ausgabe). Du musst nicht wissen, wie
die Maschine im Inneren genau funktioniert -- Hauptsache das Ergebnis
stimmt. Und du kannst die Maschine beliebig oft benutzen, mit
unterschiedlichen Mengen an Orangen, ohne sie jedes Mal neu zu bauen.

Genau das ist die Grundidee einer *Funktion* in der Programmierung: ein
wiederverwendbarer Baustein, dem du Werte übergibst (die *Arumente*) und
der dir dafür ein Ergebnis zurückgibt (den *Rückgabewert*). Das Konzept
kennst du bereits aus der Mathematik, zum Beispiel f(x) = x². Dort schreibst
du einfach f(3), wenn du eigentlich 3² meinst -- die Funktion „versteckt"
die eigentliche Rechnung hinter einem Namen.

In Python sieht die Bauanleitung für eine Funktion so aus:

```python
def name(argument1, argument2):
    # Anweisungen
    return ergebnis
```

// Am Beispiel unserer Potenz-Funktion `potenz(x, n)` sieht das dann konkret
// so aus:

// #align(center)[
//   $ underbrace("def", "Schlüsselwort") quad overbrace("potenz", "Name") thin \( underbrace("x", "Argument 1") , underbrace("n", "Argument 2") \) : $
// ]

- ```python def``` (kurz für „define") leitet die Definition ein
- `name` ist ein frei wählbarer, sprechender Name für die Funktion (wie bei
  Variablen: `flaeche_berechnen` statt `f1`)
- in den Klammern stehen die *Argumente* -- Platzhalter für Werte, die die
  Funktion beim Aufruf entgegennimmt
- der eingerückte Block darunter ist der *Funktionsrumpf*, der ausgeführt
  wird, sobald die Funktion aufgerufen wird

// Ein typischer Stolperstein: Anders als in vielen anderen Sprachen braucht
// Python keine geschweiften Klammern, um zu markieren, was zur Funktion
// gehört. Es zählt allein die *Einrückung* -- genau wie du es schon von
// `if` und `while` kennst. Du merkst, dass du aus dem Funktionsrumpf
// „herausgefallen" bist, sobald eine Zeile wieder auf der ursprünglichen
// Ebene beginnt.

Wichtig ist die Unterscheidung zwischen *Ausgabe* und *Rückgabe*,
an der viele anfangs stolpern: ```python print()``` gibt lediglich Text auf dem
Bildschirm aus, sichtbar für die Nutzerin. ```python return``` gibt hingegen einen
Wert an die Stelle im Programm zurück, an der die Funktion aufgerufen
wurde, damit dieser dort in einer Variable gespeichert oder direkt
weiterverarbeitet werden kann. Ein häufiger Anfängerfehler ist es, eine
Funktion, die nur druckt, für eine Berechnung weiterverwenden zu wollen --
probier im Praxisteil selbst aus, was dabei passiert.

Ruft man eine Funktion auf, z.B. ```python potenz(3.142, 4)```, so wird der
Funktionsaufruf im Programm quasi „durch das Ergebnis ersetzt". Deshalb
kannst du Funktionsaufrufe auch ineinander verschachteln:
```python potenz(5.0 + potenz(3.0, 2), 3)``` wird zunächst innen ausgewertet --
```python potenz(3.0, 2)``` ergibt `9.0`, damit wird daraus ```python potenz(14.0, 3)```, und
das ergibt schließlich `2744.0`. Das folgende Beispiel zeigt genau das:

#Code("10_funktionen/funktionen_basics.py")

Unsere Funktion `potenz` wird hier viermal aufgerufen: einmal mit
konkreten Werten, einmal mit einer Variable als Argument, und einmal mit
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
`RecursionError` -- probier das im Spielteil gerne selbst aus. Das ist
kein Beinbruch, sondern eine ganz natürliche Grenze rekursiver Lösungen,
die dir später im Studium noch öfter begegnen wird.
]

#Praxis()[

+ Schreib eine Funktion ```python quadrat(x)```, die eine Zahl mit sich selbst
  multipliziert und das Ergebnis zurückgibt (ohne den Operator `**` zu
  benutzen). Ruf sie mit mehreren unterschiedlichen Werten auf und gib
  dir die Ergebnisse mit ```python print()``` aus.
+ Verändere deine Funktion testweise so, dass sie statt `return ergebnis`
  nur ```python print(ergebnis)``` enthält. Versuche anschließend,
  ```python x = quadrat(4)``` zu schreiben und `x` danach auszugeben. Was passiert,
  und warum? (Tipp: Schau dir an, welchen Typ `x` jetzt hat, mit
  ```python print(type(x))```.)

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

+ Verändere das Programm in `funktionen_collatz.py` so, dass es nicht die
  einzelnen Zahlen `x1`, `x2` und `x3`, sondern deren Summe ausgibt.
+ Ergänze das Programm um eine vierte Zahl ```python x4 = collatz(x3)``` und gib die
  gesamte Folge `eingabe -> x1 -> x2 -> x3 -> x4` aus.

]

#Spiel()[

+ Schreib eine Funktion ```python schritte(x)```, die zählt, wie viele Schritte die
  Collatz-Folge braucht, bis sie bei der 1 ankommt, und diese Anzahl als
  Ganzzahl zurückgibt. Probier die Funktion mit ein paar Startwerten aus.
+ Frag zwei Zahlen von der Nutzerin ab und finde mithilfe deiner
  `schritte`-Funktion heraus, welche der beiden mehr Schritte bis zur 1
  benötigt.
+ Was passiert, wenn du in einer Funktion mehrere `return`-Anweisungen
  hintereinander benutzt? Probier es aus -- welche wird tatsächlich
  ausgeführt?
+ Verschiebe die Definition von `collatz` in `funktionen_collatz.py` ans
  Ende der Datei, also *hinter* die Zeile, in der sie zum ersten Mal
  aufgerufen wird. Führe das Programm aus. Welcher Fehler tritt auf?
  (Anders als in kompilierten Sprachen liest Python eine Datei
  schrittweise von oben nach unten -- eine Funktion muss deshalb *vor*
  ihrem ersten Aufruf definiert sein.)
+ Implementiere eine rekursive Funktion ```python fibonacci(n)```, die das n-te
  Element der Fibonacci-Folge berechnet (```python fibonacci(0) = 0```,
  ```python fibonacci(1) = 1```, ```python fibonacci(n) = fibonacci(n-1) + fibonacci(n-2)```).
+ Ruf deine `fakultaet`-Funktion aus dem Theorieteil mit einer sehr großen
  Zahl auf, z.B. ```python fakultaet(5000)```. Was passiert? Schau dir die
  Fehlermeldung genau an -- was sagt sie dir über den Call Stack?
+ Schau dir deine bisherigen Lösungen aus früheren Lektionen an: Findest
  du Stellen, an denen du wiederkehrenden Code in eine eigene Funktion
  auslagern könntest?

]

#pagebreak()

#Quiz(answer: "b), d)")[
  Welche Aussagen zu Funktionen in Python sind korrekt?
  + Eine Funktion muss immer einen Wert zurückgeben
  + Der Funktionsrumpf wird durch Einrückung markiert, nicht durch
    geschweifte Klammern
  + ```python print()``` innerhalb einer Funktion gibt einen Wert an die aufrufende
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
