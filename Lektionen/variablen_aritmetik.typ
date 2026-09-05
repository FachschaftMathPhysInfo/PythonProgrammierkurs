#import "../lib/helpers.typ": *

== Variablen und Arithmetik

Bisher haben unsere Programme immer exakt das Gleiche getan. Wir haben Text ausgegeben, und dieser Text stand fest im Quellcode. In dieser Lektion geben wir unseren Programmen ein Gedächtnis: Wir lernen, Werte unter einem Namen zu speichern, sie später wieder abzurufen und mit ihnen zu rechnen. Damit ist der Schritt von einer starren Ausgabe zu einem Programm getan, das auf Eingaben reagiert und etwas ausrechnet.

#Theorie[
  === Was ist eine Variable?

  Stell dir ein beschriftetes Schließfach vor. Auf dem Schild steht ein Name, im Fach liegt ein Inhalt. Wenn du den Namen nennst, meinst du eigentlich den Inhalt. Genau das ist eine *Variable*: ein Name, unter dem ein Wert abgelegt ist.

  Die Ablage geschieht durch ein Gleichheitszeichen. Der Name steht links, der Wert rechts:

  ```python
  beschreibung = "wundervoll"
  ```

  Ab dieser Zeile ist es im Programm so, als stünde überall dort, wo `beschreibung` geschrieben wird, das Wort `"wundervoll"`. Das ist praktisch, wenn derselbe Wert an mehreren Stellen gebraucht wird – ändern wir ihn an einer Stelle, ändert er sich überall.

  Das folgende Programm erzählt von seinem Tag. Führe es aus und schau dir die Ausgabe an.
]

#Code("07_variablen_arithmetik/variablen.py")

#Theorie[
  === Das Gleichheitszeichen ist keine Gleichung

  In der Mathematik bedeutet `=` „beide Seiten sind gleich“. In Python bedeutet `=` etwas anderes: *„Der Name auf der linken Seite soll ab jetzt den Wert der rechten Seite tragen.“* Es ist eine *Zuweisung*, kein Vergleich.

  Der Unterschied wird bei einer Zeile wie dieser deutlich:

  ```python
  zaehler = zaehler + 1
  ```

  Als Gleichung gelesen ist das Unsinn. Als Anweisung gelesen ist es klar: Nimm den aktuellen Wert von `zaehler`, addiere 1 dazu, und speichere das Ergebnis wieder unter dem Namen `zaehler`.

  Das liegt daran, dass ein Programm eine *Folge von Anweisungen* ist, die von oben nach unten abgearbeitet wird – keine Sammlung von Aussagen, die alle gleichzeitig gelten. Der Wert einer Variable kann sich im Laufe des Programms also ändern.

  === Datentypen

  Jeder Wert hat einen *Datentyp* – eine Art von Wert. `"wundervoll"` ist ein Text (in Python `str`, von _string_, „Zeichenkette“). `42` ist eine ganze Zahl (`int`, von _integer_). `3.5` ist eine Kommazahl (`float`). Der Typ ist wichtig, weil Python mit verschiedenen Typen unterschiedlich umgeht: Zwei Zahlen kann man multiplizieren, zwei Texte nicht sinnvoll.

  Anders als in vielen anderen Sprachen musst du den Typ in Python *nicht* vorab hinschreiben. Python erkennt ihn automatisch am Wert. Mit der Funktion `type()` kannst du nachfragen, welchen Typ ein Wert gerade hat.
]

#Code("07_variablen_arithmetik/variablen_aendern.py")

#Praxis[
  + Weise `beschreibung` in `variablen.py` ein anderes Wort zu und führe das Programm erneut aus. Was ändert sich in der Ausgabe?

  + Definiere in `variablen.py` eine zweite Variable (zum Beispiel `wetter = "sonnig"`) und schreibe mit ihr einen weiteren `print()`-Satz.

  + Schreibe ein Programm, das eine Variable `alter` auf einen Wert setzt, sie dann in mehreren Schritten verändert (`alter = alter + 1`) und nach jedem Schritt ausgibt.
]

=== Eingaben von der Nutzerin

#Theorie[
  Ein Programm wird erst dann wirklich nützlich, wenn es mit einer Nutzerin interagiert. Ausgaben kennen wir schon: `print()`. Für Eingaben gibt es die Funktion `input()`.

  ```python
  name = input("Wie heißt du? ")
  ```

  `input()` hält das Programm an, zeigt den Text in den Klammern an und wartet, bis die Nutzerin etwas eintippt und Enter drückt. Das Eingetippte wird dann unter dem Namen links vom `=` gespeichert.

  *Der wichtigste Stolperstein dieser Lektion:* `input()` liefert das Eingegebene *immer als Text* (`str`) zurück – auch dann, wenn die Nutzerin eine Zahl eingetippt hat. Der Text `"12"` und die Zahl `12` sind für Python zwei verschiedene Dinge.

  Warum ist das ein Problem? Das `+`-Zeichen bedeutet für zwei Texte „hänge sie aneinander“. Die Eingaben `"12"` und `"3"` ergeben mit `+` also `"123"`, nicht `15`.

  Um mit einer Eingabe zu rechnen, musst du sie erst umwandeln:

  - `int("12")` macht aus dem Text die ganze Zahl `12`
  - `float("3.5")` macht aus dem Text die Kommazahl `3.5`
]

#Code("07_variablen_arithmetik/eingabe_zahlen.py")

#Praxis[
  + Schreibe ein Programm, das nach dem Namen fragt und anschließend `Hallo, <Name>!` ausgibt.

  + Erweitere es: Frage zusätzlich nach dem Geburtsjahr, wandle die Eingabe mit `int()` um und gib aus, wie alt die Person dieses Jahr wird.

  + Was passiert, wenn du bei der Umwandlung mit `int()` keinen Zahlentext, sondern `"hallo"` eingibst? Lies die Fehlermeldung.
]

=== Rechnen: Arithmetik

#Theorie[
  Mit Zahlen können wir rechnen. Python versteht die Rechenausdrücke, die du aus der Schule kennst:

  - `+` — Addition
  - `-` — Subtraktion
  - `*` — Multiplikation
  - `/` — Division
  - `//` — Ganzzahl-Division (schneidet den Rest ab)
  - `%` — Rest der Division („modulo“)
  - `**` — Potenz (`a ** b` ist „a hoch b“)

  „Punkt vor Strich“ gilt wie gewohnt, und mit Klammern kannst du die Reihenfolge steuern: `(2 + 3) * 4` ergibt `20`.

  *Zwei Besonderheiten, an denen viele ins Straucheln geraten:*

  1. `/` liefert in Python *immer* eine Kommazahl. `10 / 2` ergibt nicht `5`, sondern `5.0` (Typ `float`). Wenn du ein ganzzahliges Ergebnis willst, nutze `//`: `10 // 3` ergibt `3`.

  2. `%` gibt den Rest an. `18 % 5` ist `3`, weil $18 = 3 dot 5 + 3$. Das ist überraschend nützlich, etwa um zu prüfen, ob eine Zahl gerade ist (`zahl % 2 == 0`).

  Eine angenehme Eigenschaft: Ganze Zahlen (`int`) haben in Python *keine Obergrenze*. `2 ** 200` rechnet Python ohne zu murren exakt aus. In vielen anderen Sprachen würde eine so große Zahl „überlaufen“.
]

#Code("07_variablen_arithmetik/rechnen.py")

#Theorie[
  Genauso können wir mit Zahlen rechnen, die die Nutzerin eingibt – vorausgesetzt, wir wandeln die Eingabe vorher mit `int()` um.
]

#Code("07_variablen_arithmetik/rechner_eingabe.py")

#Praxis[
  + Schreibe ein Programm, das zwei ganze Zahlen entgegennimmt und Summe, Differenz, Produkt *und* Quotient ausgibt.

  + Was fällt auf, wenn du `19` und `7` eingibst? Schau dir den Quotienten genau an.

  + Erweitere das Programm um Ganzzahl-Division (`//`) und Rest (`%`).

  + Was passiert, wenn du als zweite Zahl eine `0` eingibst? Lies die Fehlermeldung – wie heißt der Fehler?
]

#Spiel[
  + Wie groß ist die größte Zahl, die du in Python speichern kannst? Probier `2 ** 1000` aus. Vergleiche das mit dem, was du vielleicht über andere Programmiersprachen gehört hast.

  + Gib `0.1 + 0.2` aus. Kommt `0.3` heraus? Kommazahlen werden im Computer nur *näherungsweise* gespeichert – das ist normal und begegnet dir in jeder Programmiersprache.

  + Was passiert, wenn du dich im Namen einer Variable vertippst, etwa `print(beschreibnug)` statt `print(beschreibung)`?

  + Texte kann man „addieren“ und sogar „multiplizieren“: Probier `"ha" * 3` und `"Hallo " + "Welt"` aus. Was passiert bei `"Hallo" + 3`?

  + Statt `zaehler = zaehler + 1` gibt es die Kurzschreibweise `zaehler += 1`. Es gibt auch `-=`, `*=` und `/=`. Probier sie aus.
]

=== Häufige Fehler und ihre Ursachen

#Theorie[
  *`NameError: name 'x' is not defined`*

  Python kennt den Namen nicht. Meist ein Tippfehler im Variablennamen, oder die Variable wurde erst *nach* ihrer Verwendung zugewiesen. Groß- und Kleinschreibung zählt: `Alter` und `alter` sind zwei verschiedene Namen.

  *`TypeError: can only concatenate str (not "int") to str`*

  Du versuchst, einen Text und eine Zahl mit `+` zu verbinden. Häufig, weil eine `input()`-Eingabe noch Text ist. Lösung: die Zahl mit `int()` umwandeln, oder im `print()` ein Komma statt `+` verwenden, oder einen f-string nutzen: `print(f"Alter: {alter}")`.

  *`ZeroDivisionError: division by zero`*

  Du hast durch `0` geteilt. Durch null zu teilen ist mathematisch nicht definiert, deshalb bricht das Programm ab. In der nächsten Lektion lernst du, solche Fälle vorher abzufangen.

  *`ValueError: invalid literal for int() with base 10: 'hallo'`*

  Du hast `int()` einen Text gegeben, der keine Zahl ist.

  *Verwechslung von `=` und `==`*

  `=` weist zu, `==` vergleicht („sind diese beiden gleich?“). Diese Unterscheidung wird in der nächsten Lektion wichtig.
]

#Quiz(answer: "a ist 8")[
  Was steht am Ende in `a`?
  ```python
  a = 5
  a = a + 3
  ```
  + a ist 8
  + a ist 5
  + Es gibt einen Fehler, weil `a = a + 3` keine gültige Gleichung ist
  + a ist 53
]

#Quiz(answer: "5.0 (eine Kommazahl)")[
  Was gibt `print(10 / 2)` in Python aus?
  + 5.0 (eine Kommazahl)
  + 5 (eine ganze Zahl)
  + 2.5
  + Einen Fehler
]

#Quiz(answer: "Immer einen Text (str)")[
  Welchen Datentyp liefert `input()` zurück?
  + Immer einen Text (str)
  + Eine ganze Zahl, wenn eine Zahl eingegeben wurde
  + Den Typ, der zum Eingegebenen passt
  + Eine Kommazahl (float)
]

#Quiz(answer: "b), c)")[
  Welche Aussagen über `%` (modulo) sind korrekt?
  + `10 % 3` ergibt `3.33`
  + `10 % 2 == 0` prüft, ob `10` gerade ist
  + `18 % 5` ergibt `3`
  + `%` funktioniert nur mit Kommazahlen
]

#Theorie[
  === Ausblick

  Du kannst jetzt Werte speichern, Eingaben entgegennehmen und rechnen. Aufgefallen ist dir vielleicht, dass ein Programm bei einer Eingabe wie `0` als Divisor einfach abstürzt. In der nächsten Lektion, *Kontrollfluss*, lernst du, wie ein Programm abhängig von seinen Eingaben unterschiedliche Wege einschlägt – und solche Abstürze höflich abfängt.
]
