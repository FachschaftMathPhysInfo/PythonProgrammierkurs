#import "../lib/helpers.typ": *;
== Listen

#Theorie()[

Stell dir deinen Einkaufszettel vor: ein Blatt Papier, auf dem
untereinander „Milch“, „Brot“, „Eier“ und „Käse“ stehen. Der Zettel ist
*ein einziges* Ding, das du in die Tasche steckst -- und trotzdem enthält
er vier Informationen, die in einer festen Reihenfolge stehen. Du kannst
sagen „der zweite Eintrag“ und jede weiß, was gemeint ist. Du
kannst unten etwas anhängen, etwas durchstreichen, oder zählen, wie viel
noch offen ist.

Genau dieses Blatt Papier ist eine *Liste*: ein Behälter, der beliebig
viele Werte in einer festen Reihenfolge unter *einem* Namen zusammenfasst.
Bisher hattest du für jeden Wert eine eigene Variable -- `x1`, `x2`, `x3`.
Das funktioniert für drei Werte. Bei den Temperaturmesswerten eines
ganzen Jahres wird es sehr schwierig, und spätestens dann, wenn du beim
Schreiben des Programms noch gar nicht weißt, wie viele Werte es sein
werden, geht es überhaupt nicht mehr. Die Liste löst genau dieses Problem:
Sie wächst und schrumpft, während dein Programm läuft.

In Python schreibst du eine Liste als Werte in eckigen Klammern, getrennt
durch Kommata:

```
einkaufsliste = ["Milch", "Brot", "Eier", "Kaese"]
```

Eine solche Liste ist mehr als die Summe ihrer Teile: Sie ist selbst ein
Wert, den du einer Variable zuweisen, an eine Funktion übergeben oder aus
einer Funktion zurückgeben kannst.

=== Auf einzelne Elemente zugreifen

Um an einen einzelnen Eintrag zu kommen, gibst du seine Position an --
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

`einkaufsliste[1]` ist also „Brot“, nicht „Milch“. Das wirkt zunächst
unnatürlich, hat aber einen praktischen Grund: Der Index beschreibt
eigentlich nicht die Nummer des Elements, sondern seinen *Abstand zum
Anfang* der Liste. Das erste Element hat vom Anfang aus gesehen den
Abstand null.

Daraus folgt unmittelbar die zweite Stolperfalle: Eine Liste mit vier
Einträgen hat die Indizes `0` bis `3`. Der Zugriff auf
`einkaufsliste[4]` bricht das Programm mit einem `IndexError` ab. Wie viele
Elemente eine Liste gerade enthält, verrät dir die Funktion `len()`
(kurz für „length“, also Länge) -- der größte gültige Index ist immer
`len(liste) - 1`. Praktisch ist auch, dass Python negative Indizes
versteht: `list[-1]` ist das letzte Element, ganz ohne vorher zu zählen.

#Code("12_listen/listen_basics.py")

=== Listen verändern

Anders als eine Zahl oder ein Text ist eine Liste *veränderbar*. Du musst
also keine neue Liste bauen, um etwas hinzuzufügen -- du veränderst die
bestehende. Die dafür nötigen Werkzeuge schreibt man mit einem Punkt
hinter den Listennamen; man nennt sie *Methoden*. Du kannst dir das
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
*ein* Element an. Schreibst du `list.append(["Apfel", "Banane"])`, so
landet die *ganze zweite Liste* als ein einziges Element in deiner Liste --
du hast dann eine Liste in einer Liste. Willst du stattdessen zwei Listen
aneinanderhängen, benutze `+` oder `list.extend(zusatz)`.

Ein zweiter, verwandter Stolperstein: `list.append("Milch")` verändert die
Liste und gibt selbst *nichts* zurück. Wer `liste = list.append("Milch")`
schreibt, überschreibt seine Liste mit `None` und wundert sich danach über
einen `TypeError`. Merke dir die Faustregel: Methoden, die eine Liste
verändern, schreibt man ohne Zuweisung.

=== Listen und Schleifen -- ein perfektes Paar

Der eigentliche Gewinn entsteht erst im Zusammenspiel mit dem, was du
schon kennst. Eine Liste ist *iterierbar*: Eine `for`-Schleife kann ihre
Elemente eines nach dem anderen durchgehen, ohne dass du dich um Indizes
kümmern musst.

```
for wert in temperaturen:
    print(wert)
```

Wenn du zusätzlich die *Position* brauchst -- etwa um „Tag 3“ auszugeben --
läufst du stattdessen über die Indizes: `range(len(temperaturen))` liefert
genau die Zahlen `0` bis `len - 1`, also exakt die gültigen Indizes.

#Code("12_listen/listen_schleife.py")

Achte auf das letzte Muster in diesem Beispiel: Wir starten mit einer
*leeren* Liste und füllen sie in der Schleife Schritt für Schritt mit
`append`. Dieses „Sammeln“ ist eines der meistgenutzten Muster überhaupt
und wird dir von jetzt an ständig begegnen.

=== Listen an Funktionen übergeben

Listen und Funktionen ergänzen sich hervorragend: Statt eine feste Anzahl
Parameter zu vereinbaren, übergibst du eine einzige Liste beliebiger Länge.
Dabei verhalten sich Listen allerdings anders als Zahlen, und das
überrascht fast alle beim ersten Mal.

Übergibst du eine Zahl, bekommt die Funktion eine *Kopie* des Wertes --
die Variable draußen bleibt unberührt. Übergibst du eine Liste, bekommt die
Funktion keine Kopie, sondern gewissermaßen die *Adresse* des Zettels.
Beide arbeiten am selben Blatt Papier: Was die Funktion streicht, ist auch
draußen gestrichen.

#Code("12_listen/listen_funktionen.py")

Das ist kein Fehler, sondern gewollt und ausgesprochen nützlich -- es
erlaubt einer Funktion, eine große Liste zu bearbeiten, ohne sie
kopieren zu müssen. Du solltest es nur bewusst tun. Willst du das Original
schützen, übergib mit `list[:]` eine echte Kopie.

Damit hast du deine erste *Datenstruktur* in der Hand: eine Art, mehrere
Werte so zu organisieren, dass ein Programm sinnvoll mit ihnen arbeiten
kann. Was du bisher an einzelnen Variablen mühsam von Hand verwaltet hast,
lässt sich ab jetzt in wenigen Zeilen ausdrücken.
]

#Praxis()[

+ Leg eine Liste `wochentage` mit den sieben Wochentagen an. Gib den
  ersten Tag, den letzten Tag (nutze dafür den Index `-1`) und die Länge
  der Liste aus.
+ Greif absichtlich auf `wochentage[7]` zu und lies die Fehlermeldung
  aufmerksam durch. Welcher Fehlertyp erscheint, und was sagt er dir
  über den größten gültigen Index?
+ Schreib ein Programm, das eine Liste mit fünf Zahlen anlegt und mit
  einer `for`-Schleife deren Summe und Durchschnitt berechnet -- ohne die
  eingebaute Funktion `sum()` zu benutzen.
+ Erweitere `listen_schleife.py` so, dass zusätzlich der *kälteste* Tag
  gefunden und ausgegeben wird.
+ Schreib eine Funktion `laengstes_wort(woerter)`, die eine Liste von
  Texten bekommt und das längste davon zurückgibt. (Tipp: `len()`
  funktioniert auch auf Texten.)

]

#Praxis()[

Wir bauen ein kleines, vollständiges Programm: eine Einkaufsliste, die
zur Laufzeit wächst und schrumpft. Es kombiniert alles, was du bisher
gelernt hast -- `while`, `if`, Funktionen, `input()` und nun Listen.

#Code("12_listen/listen_einkaufsliste.py")

+ Tipp das Programm ab und probier es aus. Was passiert, wenn du die
  Prüfung `if artikel in einkaufsliste:` entfernst und dann versuchst,
  einen Artikel zu streichen, der gar nicht auf der Liste steht?
+ Ergänze einen Befehl `[l]eeren`, der die gesamte Liste auf einmal löscht.
+ Ergänze einen Befehl `[a]nzahl`, der ausgibt, wie viele Artikel noch
  offen sind.
+ Sorge dafür, dass ein Artikel nicht doppelt auf die Liste kommt.

]

#Spiel()[

+ *Zahlen umdrehen:* Schreib eine Funktion `umdrehen(liste)`, die eine
  neue Liste mit den Elementen in umgekehrter Reihenfolge zurückgibt --
  von Hand mit einer Schleife, ohne `reverse()`. Vergleiche dein Ergebnis
  anschließend mit `list[::-1]`.
+ *Suchen:* Schreib eine Funktion `finde(liste, gesucht)`, die den Index
  des gesuchten Elements zurückgibt -- oder `-1`, wenn es nicht enthalten
  ist. Warum ist `-1` hier eine sinnvolle Wahl für „nicht gefunden“?
+ *Statistik:* Frag so lange Zahlen von der Nutzerin ab, bis sie eine
  leere Eingabe macht, sammle alle Zahlen in einer Liste und gib am
  Ende Anzahl, Summe, Durchschnitt, Minimum und Maximum aus.
+ *Verschachtelt:* Eine Liste darf selbst Listen enthalten. Leg ein
  Spielfeld `feld = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]`
  an und schreib `feld[1][1] = "X"`. Gib das Feld zeilenweise aus.
+ *Falle mit Ansage:* Führe `a = [1, 2, 3]`, dann `b = a`, dann
  `b.append(4)` aus und gib danach `a` aus. Erkläre deiner Sitznachbarin,
  warum `a` jetzt vier Elemente hat.
+ *Fortgeschritten:* Sortiere eine Liste von Zahlen: Suche immer
  das kleinste verbleibende Element und hänge es an eine neue Liste an.
  Wie viele Durchläufe brauchst du bei zehn Elementen?

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
  Du willst an `tiere = ["Hund"]` die Liste `["Katze", "Maus"]` anhängen,
  sodass am Ende `["Hund", "Katze", "Maus"]` herauskommt. Welche Zeile
  leistet das *nicht*?
  + `tiere = tiere + ["Katze", "Maus"]`
  + `tiere.extend(["Katze", "Maus"])`
  + `tiere.append("Katze")` gefolgt von `tiere.append("Maus")`
  + `tiere.append(["Katze", "Maus"])`
]
