#import "../lib/helpers.typ": *;
== Listen

#Theorie()[

Stellt euch euren Einkaufszettel vor: ein Blatt Papier, auf dem
untereinander „Milch“, „Brot“, „Eier“ und „Käse“ stehen. Der Zettel ist
*ein einziges* Ding, das ihr in die Tasche steckt -- und trotzdem enthält
er vier Informationen, die in einer festen Reihenfolge stehen. Ihr könnt
sagen „der zweite Eintrag“ und jede und jeder weiß, was gemeint ist. Ihr
könnt unten etwas anhängen, etwas durchstreichen, oder zählen, wie viel
noch offen ist.

Genau dieses Blatt Papier ist eine *Liste*: ein Behälter, der beliebig
viele Werte in einer festen Reihenfolge unter *einem* Namen zusammenfasst.
Bisher hattet ihr für jeden Wert eine eigene Variable -- `x1`, `x2`, `x3`.
Das funktioniert für drei Werte. Bei den Temperaturmesswerten eines
ganzen Jahres wird es unmöglich, und spätestens dann, wenn ihr beim
Schreiben des Programms noch gar nicht wisst, wie viele Werte es sein
werden, geht es überhaupt nicht mehr. Die Liste löst genau dieses Problem:
Sie wächst und schrumpft, während euer Programm läuft.

In Python schreibt ihr eine Liste als Werte in eckigen Klammern, getrennt
durch Kommata:

```
einkaufsliste = ["Milch", "Brot", "Eier", "Kaese"]
```

Eine solche Liste ist mehr als die Summe ihrer Teile: Sie ist selbst ein
Wert, den ihr einer Variable zuweisen, an eine Funktion übergeben oder aus
einer Funktion zurückgeben könnt.

=== Auf einzelne Elemente zugreifen

Um an einen einzelnen Eintrag zu kommen, gebt ihr seine Position an --
den *Index* -- in eckigen Klammern hinter dem Listennamen. Hier lauert der
erste und mit Abstand häufigste Stolperstein: Python zählt ab *null*.

#align(center)[
  #table(
    columns: 5,
    align: center,
    stroke: 0.5pt,
    [Index], [`0`], [`1`], [`2`], [`3`],
    [Wert], [`"Milch"`], [`"Brot"`], [`"Eier"`], [`"Kaese"`],
    [von hinten], [`-4`], [`-3`], [`-2`], [`-1`],
  )
]

`einkaufsliste[0]` ist also „Milch“, nicht „Brot“. Das wirkt zunächst
unnatürlich, hat aber einen praktischen Grund: Der Index beschreibt
eigentlich nicht die Nummer des Elements, sondern seinen *Abstand zum
Anfang* der Liste. Das erste Element hat vom Anfang aus gesehen den
Abstand null.

Daraus folgt unmittelbar die zweite Stolperfalle: Eine Liste mit vier
Einträgen hat die Indizes `0` bis `3`. Der Zugriff auf
`einkaufsliste[4]` bricht das Programm mit einem `IndexError` ab. Wie viele
Elemente eine Liste gerade enthält, verrät euch die Funktion `len()`
(kurz für „length“, also Länge) -- der größte gültige Index ist immer
`len(liste) - 1`. Praktisch ist auch, dass Python negative Indizes
versteht: `list[-1]` ist das letzte Element, ganz ohne vorher zu zählen.

#Code("12_listen/listen_basics.py")

=== Listen verändern

Anders als eine Zahl oder ein Text ist eine Liste *veränderbar*. Ihr müsst
also keine neue Liste bauen, um etwas hinzuzufügen -- ihr verändert die
bestehende. Die dafür nötigen Werkzeuge schreibt man mit einem Punkt
hinter den Listennamen; man nennt sie *Methoden*. Ihr könnt euch das
vorstellen wie Funktionen, die fest zu genau dieser einen Liste gehören
und deshalb wissen, an welchem Zettel sie arbeiten sollen.

#description(format: it => raw(it))[
/ list.append(wert): hängt einen Wert hinten an
/ list.insert(index, wert): fügt einen Wert an der genannten Position ein
/ list.remove(wert): entfernt das erste Vorkommen dieses Werts
/ list.pop(): entfernt das letzte Element und gibt es zurück
/ list[index] = wert: überschreibt ein vorhandenes Element
/ wert in liste: prüft, ob ein Wert enthalten ist (ergibt `True` oder `False`)
]

#Code("12_listen/listen_veraendern.py")

Auch hier gibt es einen typischen Anfängerfehler: `append` hängt genau
*ein* Element an. Schreibt ihr `list.append(["Apfel", "Banane"])`, so
landet die *ganze zweite Liste* als ein einziges Element in eurer Liste --
ihr habt dann eine Liste in einer Liste. Wollt ihr stattdessen zwei Listen
aneinanderhängen, benutzt `+` oder `list.extend(zusatz)`.

Ein zweiter, verwandter Stolperstein: `list.append("Milch")` verändert die
Liste und gibt selbst *nichts* zurück. Wer `liste = list.append("Milch")`
schreibt, überschreibt seine Liste mit `None` und wundert sich danach über
einen `TypeError`. Merkt euch die Faustregel: Methoden, die eine Liste
verändern, schreibt man ohne Zuweisung.

=== Listen und Schleifen -- ein perfektes Paar

Der eigentliche Gewinn entsteht erst im Zusammenspiel mit dem, was ihr
schon kennt. Eine Liste ist *iterierbar*: Eine `for`-Schleife kann ihre
Elemente eines nach dem anderen durchgehen, ohne dass ihr euch um Indizes
kümmern müsst.

```
for wert in temperaturen:
    print(wert)
```

Wenn ihr zusätzlich die *Position* braucht -- etwa um „Tag 3“ auszugeben --
lauft ihr stattdessen über die Indizes: `range(len(temperaturen))` liefert
genau die Zahlen `0` bis `len - 1`, also exakt die gültigen Indizes.

#Code("12_listen/listen_schleife.py")

Achtet auf das letzte Muster in diesem Beispiel: Wir starten mit einer
*leeren* Liste und füllen sie in der Schleife Schritt für Schritt mit
`append`. Dieses „Sammeln“ ist eines der meistgenutzten Muster überhaupt
und wird euch von jetzt an ständig begegnen.

=== Listen an Funktionen übergeben

Listen und Funktionen ergänzen sich hervorragend: Statt eine feste Anzahl
Parameter zu vereinbaren, übergebt ihr eine einzige Liste beliebiger Länge.
Dabei verhalten sich Listen allerdings anders als Zahlen, und das
überrascht fast alle beim ersten Mal.

Übergebt ihr eine Zahl, bekommt die Funktion eine *Kopie* des Wertes --
die Variable draußen bleibt unberührt. Übergebt ihr eine Liste, bekommt die
Funktion keine Kopie, sondern gewissermaßen die *Adresse* des Zettels.
Beide arbeiten am selben Blatt Papier: Was die Funktion streicht, ist auch
draußen gestrichen.

#Code("12_listen/listen_funktionen.py")

Das ist kein Fehler, sondern gewollt und ausgesprochen nützlich -- es
erlaubt einer Funktion, eine große Liste zu bearbeiten, ohne sie
kopieren zu müssen. Ihr solltet es nur bewusst tun. Wollt ihr das Original
schützen, übergebt mit `list[:]` eine echte Kopie.

Damit habt ihr eure erste *Datenstruktur* in der Hand: eine Art, mehrere
Werte so zu organisieren, dass ein Programm sinnvoll mit ihnen arbeiten
kann. Was ihr bisher an einzelnen Variablen mühsam von Hand verwaltet habt,
lässt sich ab jetzt in wenigen Zeilen ausdrücken.
]

#Praxis()[

+ Legt eine Liste `wochentage` mit den sieben Wochentagen an. Gebt den
  ersten Tag, den letzten Tag (nutzt dafür den Index `-1`) und die Länge
  der Liste aus.
+ Greift absichtlich auf `wochentage[7]` zu und lest die Fehlermeldung
  aufmerksam durch. Welcher Fehlertyp erscheint, und was sagt er euch
  über den größten gültigen Index?
+ Schreibt ein Programm, das eine Liste mit fünf Zahlen anlegt und mit
  einer `for`-Schleife deren Summe und Durchschnitt berechnet -- ohne die
  eingebaute Funktion `sum()` zu benutzen.
+ Erweitert `listen_schleife.py` so, dass zusätzlich der *kälteste* Tag
  gefunden und ausgegeben wird.
+ Schreibt eine Funktion `laengstes_wort(woerter)`, die eine Liste von
  Texten bekommt und das längste davon zurückgibt. (Tipp: `len()`
  funktioniert auch auf Texten.)

]

#Praxis()[

Wir bauen ein kleines, vollständiges Programm: eine Einkaufsliste, die
zur Laufzeit wächst und schrumpft. Es kombiniert alles, was ihr bisher
gelernt habt -- `while`, `if`, Funktionen, `input()` und nun Listen.

#Code("12_listen/listen_einkaufsliste.py")

+ Tippt das Programm ab und probiert es aus. Was passiert, wenn ihr die
  Prüfung `if artikel in einkaufsliste:` entfernt und dann versucht,
  einen Artikel zu streichen, der gar nicht auf der Liste steht?
+ Ergänzt einen Befehl `[l]eeren`, der die gesamte Liste auf einmal löscht.
+ Ergänzt einen Befehl `[a]nzahl`, der ausgibt, wie viele Artikel noch
  offen sind.
+ Sorgt dafür, dass ein Artikel nicht doppelt auf die Liste kommt.

]

#Spiel()[

+ *Zahlen umdrehen:* Schreibt eine Funktion `umdrehen(liste)`, die eine
  neue Liste mit den Elementen in umgekehrter Reihenfolge zurückgibt --
  von Hand mit einer Schleife, ohne `reverse()`. Vergleicht euer Ergebnis
  anschließend mit `list[::-1]`.
+ *Suchen:* Schreibt eine Funktion `finde(liste, gesucht)`, die den Index
  des gesuchten Elements zurückgibt -- oder `-1`, wenn es nicht enthalten
  ist. Warum ist `-1` hier eine sinnvolle Wahl für „nicht gefunden“?
+ *Statistik:* Fragt so lange Zahlen von der Nutzerin ab, bis sie eine
  leere Eingabe macht, sammelt alle Zahlen in einer Liste und gebt am
  Ende Anzahl, Summe, Durchschnitt, Minimum und Maximum aus.
+ *Verschachtelt:* Eine Liste darf selbst Listen enthalten. Legt ein
  Spielfeld `feld = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]`
  an und schreibt `feld[1][1] = "X"`. Gebt das Feld zeilenweise aus.
  Damit habt ihr das Grundgerüst für das Abschlussprojekt bereits gebaut.
+ *Falle mit Ansage:* Führt `a = [1, 2, 3]`, dann `b = a`, dann
  `b.append(4)` aus und gebt danach `a` aus. Erklärt eurer Sitznachbarin,
  warum `a` jetzt vier Elemente hat.
+ *Fortgeschritten:* Sortiert eine Liste von Zahlen von Hand: Sucht immer
  das kleinste verbleibende Element und hängt es an eine neue Liste an.
  Wie viele Durchläufe braucht ihr bei zehn Elementen?

]

#Quiz(answer: "c)")[
  Die Liste `farben = ["rot", "gruen", "blau"]` ist gegeben. Was gibt
  `print(farben[1])` aus?
  + `rot`
  + Einen `IndexError`
  + `gruen`
  + `blau`
]

#Quiz(answer: "b)")[
  Was passiert bei `zahlen = [10, 20, 30]` und anschließend
  `print(zahlen[3])`?
  + Es wird `30` ausgegeben, weil die Liste drei Elemente hat
  + Das Programm bricht mit einem `IndexError` ab, weil der größte
    gültige Index `2` ist
  + Es wird `None` ausgegeben
  + Python hängt automatisch ein viertes Element an
]

#Quiz(answer: "a), c)")[
  Welche Aussagen über Listen in Python sind korrekt?
  + Eine Liste kann während der Programmlaufzeit wachsen und schrumpfen
  + `len(liste)` liefert den größten gültigen Index
  + Übergibt man eine Liste an eine Funktion, kann die Funktion das
    Original verändern
  + Alle Elemente einer Liste müssen denselben Typ haben
]

#Quiz(answer: "d)")[
  Ihr wollt an `tiere = ["Hund"]` die Liste `["Katze", "Maus"]` anhängen,
  sodass am Ende `["Hund", "Katze", "Maus"]` herauskommt. Welche Zeile
  leistet das *nicht*?
  + `tiere = tiere + ["Katze", "Maus"]`
  + `tiere.extend(["Katze", "Maus"])`
  + `tiere.append("Katze")` gefolgt von `tiere.append("Maus")`
  + `tiere.append(["Katze", "Maus"])`
]
