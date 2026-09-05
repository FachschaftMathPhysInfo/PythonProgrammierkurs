#import "../lib/helpers.typ": *
#import "@preview/fletcher:0.5.7" as fletcher: diagram, node, edge

// --- Darstellung der Abbildungen in dieser Lektion ---

#let Abbildung(body, caption: []) = block(width: 100%, breakable: false, above: 1.3em, below: 1.5em)[
  #align(center)[
    #body
    #v(0.5em)
    #block(width: 85%)[
      #set align(center)
      #text(size: 9pt, style: "italic", fill: luma(70))[#caption]
    ]
  ]
]

// Einheitliches Aussehen der Flussdiagramme
#let flow = (
  spacing: (13mm, 9mm),
  node-stroke: 0.7pt,
  node-inset: 7pt,
  edge-stroke: 0.7pt,
)

// Ein Kaestchen fuer den Zahlenstrahl: gefuellt = gehoert dazu
#let rangebox(inhalt, dabei: true) = box(
  width: 9mm,
  height: 9mm,
  radius: 2pt,
  stroke: if dabei { 0.8pt + black } else { (thickness: 0.8pt, paint: luma(160), dash: "dashed") },
  fill: if dabei { luma(232) } else { none },
  align(center + horizon, text(size: 9pt, fill: if dabei { black } else { luma(140) }, inhalt)),
)

== Schleifen

In der letzten Lektion hat unser Programm gelernt, an einer Weggabelung den passenden Weg zu wählen. Eine Sache blieb dabei unbefriedigend: Das Ratespiel gewährt genau *einen* Versuch. Und eine unsinnige Eingabe können wir zwar erkennen, aber nicht noch einmal erfragen – wir können nur höflich abbrechen. Was fehlt, ist die Fähigkeit, etwas zu *wiederholen*. Genau darum geht es in dieser Lektion. Das Werkzeug dafür heißt *Schleife*.

#Theorie[
  === Solange noch etwas zu tun ist

  Stell dir vor, du schälst Kartoffeln für ein Abendessen. Niemand sagt dir vorher: „Schäle genau vierzehn Kartoffeln.“ Die Anweisung lautet vielmehr: *Solange noch ungeschälte Kartoffeln im Korb liegen, nimm eine heraus und schäle sie.* Vor jedem Griff in den Korb schaust du kurz nach, ob es noch weitergeht. Irgendwann ist der Korb leer, und du hörst auf.

  Dieses Muster gibt es in Python wörtlich. Es heißt `while` (englisch für „solange“):

  ```python
  while sekunden > 0:
      print(sekunden)
      sekunden = sekunden - 1
  ```

  Gelesen: „*Solange* `sekunden` größer als `0` ist, gib den Wert aus und ziehe eins ab.“

  Der Aufbau ist derselbe wie beim `if` aus der letzten Lektion, und das ist kein Zufall:

  1. Das Schlüsselwort `while`, gefolgt von einer *Bedingung*.
  2. Ein *Doppelpunkt* `:` am Zeilenende.
  3. Der *eingerückte Block* darunter – er heißt *Schleifenrumpf*.

  Der Unterschied zum `if` liegt allein im Verhalten danach: Ein `if` führt seinen Block *höchstens einmal* aus und geht dann weiter. Ein `while` springt nach dem letzten Befehl des Rumpfes *zurück nach oben* und prüft die Bedingung erneut. Erst wenn sie falsch ist, läuft das Programm unterhalb der Schleife weiter.

  Einen einzelnen solchen Durchlauf nennt man eine *Iteration* (von lateinisch _iterare_, „wiederholen“).
]

#Abbildung(caption: [Beide Diagramme sind bis auf einen einzigen Pfeil gleich. Dieser Rücksprung – die _Rückwärtskante_ – ist alles, was eine Schleife von einer Verzweigung unterscheidet.])[
  #text(size: 8.5pt)[
    #grid(
      columns: (1fr, 1fr),
      align: center + top,
      column-gutter: 6mm,

      [
        #text(size: 10pt, weight: "bold")[`if` – höchstens einmal]
        #v(6pt)
        #diagram(
          ..flow,
          node((0, 0), [Bedingung?], shape: fletcher.shapes.diamond),
          edge("-|>", [wahr], label-side: left),
          node((0, 1), [Block]),
          edge("-|>"),
          node((0, 2), [weiter im\ Programm]),
          edge((0, 0), (1.4, 0), (1.4, 2), (0, 2), "-|>", [falsch], label-pos: 0.2),
        )
      ],

      [
        #text(size: 10pt, weight: "bold")[`while` – immer wieder]
        #v(6pt)
        #diagram(
          ..flow,
          node((0, 0), [Bedingung?], shape: fletcher.shapes.diamond),
          edge("-|>", [wahr], label-side: left),
          node((0, 1), [Rumpf]),
          node((0, 2), [weiter im\ Programm]),
          edge((0, 0), (1.4, 0), (1.4, 2), (0, 2), "-|>", [falsch], label-pos: 0.2),
          edge((0, 1), (-1.4, 1), (-1.4, 0), (0, 0), "-|>", [zurück], label-pos: 0.5),
        )
      ],
    )
  ]
]

#Code("09_schleifen/countdown.py")

#Abbildung(caption: [Was `countdown.py` Schritt für Schritt tut. Solche Tabellen von Hand aufzuschreiben ist die wirksamste Methode, um eine Schleife zu verstehen, die sich nicht so verhält wie erwartet.])[
  #text(size: 9pt)[
    #table(
      columns: 4,
      align: (center, center, center, center),
      stroke: 0.5pt + luma(180),
      inset: 6pt,
      table.header(
        [*Durchlauf*], [`sekunden` vorher], [`sekunden > 0`], [*Ausgabe*],
      ),
      [1], [`5`], [wahr], [`5`],
      [2], [`4`], [wahr], [`4`],
      [3], [`3`], [wahr], [`3`],
      [4], [`2`], [wahr], [`2`],
      [5], [`1`], [wahr], [`1`],
      [–], [`0`], [falsch], [Schleife endet],
    )
  ]
]

#Theorie[
  === Der wichtigste Stolperstein: die Endlosschleife

  Schau dir in `countdown.py` die Zeile `sekunden = sekunden - 1` genau an. Sie sieht nebensächlich aus, ist aber das Herzstück der Schleife. Lässt man sie weg, verändert sich `sekunden` nie. Die Bedingung `sekunden > 0` bleibt damit für immer wahr, und das Programm gibt bis in alle Ewigkeit `5` aus.

  Das nennt man eine *Endlosschleife*. Sie ist kein Fehler, den Python melden könnte – syntaktisch ist alles korrekt, das Programm tut ja genau das, was dort steht. Deshalb erscheint keine Fehlermeldung; das Programm hängt einfach.

  Daraus folgt die zentrale Regel für jede `while`-Schleife:

  #align(center)[*Im Rumpf muss sich etwas ändern, das in der Bedingung vorkommt.*]

  Beim Schreiben einer Schleife lohnt sich deshalb jedes Mal die Frage: _Wodurch wird diese Bedingung irgendwann falsch?_ Findest du keine Antwort, läuft die Schleife ewig.

  *Und wenn es doch passiert?* Das wird es, und zwar jedem. Ein hängendes Programm brichst du im Terminal mit `Strg` + `C` ab (auf macOS ebenfalls `Ctrl` + `C`, nicht `Cmd`). Das ist kein Absturz, sondern der reguläre Weg, ein laufendes Programm zu beenden.

  === Ein Muster: sammeln

  Sehr oft dient eine Schleife dazu, ein Ergebnis Stück für Stück *aufzusammeln*. Dafür legt man vor der Schleife eine Variable als „Sammelbehälter“ an und füllt sie im Rumpf immer weiter auf. Entscheidend ist die Reihenfolge: Der Behälter wird *vor* der Schleife auf einen Startwert gesetzt, nicht darin. Stünde `summe = 0` im Rumpf, würde die Summe bei jedem Durchlauf wieder geleert.
]

#Code("09_schleifen/summe_sammeln.py")

#Praxis[
  + Führe `countdown.py` aus. Lösche anschließend die Zeile `sekunden = sekunden - 1` und starte erneut. Beende das Programm mit `Strg` + `C`. Stelle die Zeile danach wieder her.

  + Ändere `countdown.py` so, dass von `10` heruntergezählt wird und immer zwei Schritte auf einmal gemacht werden (`10`, `8`, `6`, …).

  + Schreibe ein Programm, das die Zahlen von `1` bis `20` ausgibt, aber nur die geraden. (Tipp: `zahl % 2 == 0` aus der letzten Lektion.)

  + Verschiebe in `summe_sammeln.py` die Zeile `summe = 0` versuchsweise in den Schleifenrumpf. Welches Ergebnis kommt heraus, und warum?
]

=== Eingaben absichern

#Theorie[
  Jetzt können wir das Problem lösen, an dem wir in der letzten Lektion gescheitert sind: eine Nutzerin so lange fragen, bis die Eingabe brauchbar ist.

  Die Bedingung formuliert dabei den *unerwünschten* Zustand: „Solange die Eingabe noch unsinnig ist, frage weiter.“ Das fühlt sich beim ersten Lesen verdreht an, ist aber genau richtig – die Schleife läuft, *solange etwas nicht stimmt*.

  Ein wenig unschön ist daran der künstliche Startwert (`alter = -1`), den man nur setzt, damit die Bedingung beim ersten Mal überhaupt zutrifft. Für diesen Fall gibt es eine elegantere Schreibweise mit zwei neuen Bausteinen:

  - `while True:` startet eine Schleife, deren Bedingung *immer* wahr ist – also absichtlich eine Endlosschleife.
  - `break` verlässt die Schleife sofort, mitten im Rumpf, und springt hinter sie.

  Beides zusammen ergibt: „Wiederhole für immer – bis die Eingabe stimmt, dann raus hier.“ Das ist unter Programmiererinnen ein gängiges und gut lesbares Muster.

  Ein Verwandter von `break` ist `continue`. Es bricht nicht die ganze Schleife ab, sondern nur den aktuellen Durchlauf und springt sofort zur nächsten Iteration – nützlich, um einzelne Fälle zu überspringen.
]

#Code("09_schleifen/eingabe_pruefen.py")

#Praxis[
  + Führe `eingabe_pruefen.py` aus und gib absichtlich erst `-3`, dann `500` und schließlich `20` ein.

  + Schreibe ein Programm, das nach einem Passwort fragt und so lange weiterfragt, bis `"heureka"` eingegeben wurde.

  + Erweitere es: Nach drei Fehlversuchen soll das Programm mit `Zu viele Versuche.` aufgeben. (Du brauchst einen Zähler *und* `and` in der Bedingung.)
]

=== Wenn die Anzahl feststeht: `for`

#Theorie[
  Bei den Kartoffeln wusstest du nicht im Voraus, wie viele es sind – du hast vor jedem Griff nachgesehen. Nun stell dir eine andere Aufgabe vor: Du sollst zehn Briefumschläge beschriften. Hier steht die Anzahl von Anfang an fest. Niemand prüft nach jedem Umschlag, ob noch welche da sind; man arbeitet einfach den Stapel ab.

  Für genau diesen Fall gibt es die zweite Schleifenart, die `for`-Schleife. Sie läuft nicht, *solange etwas gilt*, sondern *einmal für jedes Element* einer vorgegebenen Folge:

  ```python
  for i in range(5):
      print(i)
  ```

  Gelesen: „Für jede Zahl `i` aus `range(5)`: gib `i` aus.“ Die Variable `i` heißt *Schleifenvariable*. Sie wird bei jedem Durchlauf automatisch auf den nächsten Wert gesetzt – hier musst du also nichts selbst hochzählen, und eine Endlosschleife kann gar nicht erst entstehen.
]

#Abbildung(caption: [Die Folge steht schon fest, bevor die Schleife beginnt. Aus ihr wird bei jedem Durchlauf der nächste Wert in die Schleifenvariable `zahl` gelegt, und der Rumpf läuft damit einmal durch. Sind alle Werte aufgebraucht, endet die Schleife von selbst.])[
  #text(size: 8.5pt)[
    #diagram(
      ..flow,
      spacing: (10mm, 9mm),

      node((-1.6, 0), text(size: 9pt)[`for zahl in range(1, 4):`], stroke: none),
      node((0, 0), [`1`]),
      node((1, 0), [`2`]),
      node((2, 0), [`3`]),

      edge((0, 0), (1, 1), "-|>"),
      edge((1, 0), (1, 1), "-|>"),
      edge((2, 0), (1, 1), "-|>"),

      node((1, 1), [Schleifenvariable `zahl`], fill: luma(235)),
      edge("-|>"),
      node((1, 2), [Rumpf: `print(zahl)`]),

      edge((1, 2), (2.9, 2), (2.9, 1), (1, 1), "-|>", [nächster Wert], label-pos: 0.5),
    )
  ]
]

#Theorie(show-heading: false)[
  `range()` erzeugt dabei eine Folge ganzer Zahlen. Es gibt sie in drei Ausführungen:

  - `range(5)` – die Zahlen `0`, `1`, `2`, `3`, `4`
  - `range(1, 6)` – die Zahlen `1`, `2`, `3`, `4`, `5`
  - `range(0, 21, 5)` – die Zahlen `0`, `5`, `10`, `15`, `20`

  *Zwei Eigenheiten, über die anfangs fast alle stolpern:*

  1. Gibt man nur eine Zahl an, beginnt die Zählung bei *`0`*, nicht bei `1`. Das ist in der Informatik durchgehend so und wird dir noch häufig begegnen.

  2. Die *obere Grenze gehört nicht dazu*. `range(1, 6)` endet bei `5`. Merkhilfe: Die zweite Zahl ist nicht das letzte Element, sondern die Stelle, an der abgebrochen wird. Praktisch daran ist, dass `range(5)` genau fünf Werte liefert – die Zahl in den Klammern ist immer die Anzahl der Durchläufe.
]

#Abbildung(caption: [Gefüllt heißt „gehört dazu“. Die zweite Zahl in `range()` ist nicht das letzte Element, sondern die Stelle, an der abgebrochen wird – sie bleibt selbst außen vor. Beide Zeilen liefern deshalb genau fünf Werte.])[
  #grid(
    columns: (auto, auto),
    column-gutter: 7mm,
    row-gutter: 5mm,
    align: (right + horizon, left + horizon),

    text(size: 10pt)[`range(5)`],
    stack(
      dir: ltr,
      spacing: 3pt,
      rangebox[0], rangebox[1], rangebox[2], rangebox[3], rangebox[4],
      rangebox(dabei: false)[5], rangebox(dabei: false)[6],
    ),

    text(size: 10pt)[`range(1, 6)`],
    stack(
      dir: ltr,
      spacing: 3pt,
      rangebox(dabei: false)[0],
      rangebox[1], rangebox[2], rangebox[3], rangebox[4], rangebox[5],
      rangebox(dabei: false)[6],
    ),
  )
]

#Code("09_schleifen/for_range.py")

#Theorie[
  === Nicht nur Zahlen

  Eine `for`-Schleife kann über alles laufen, was aus mehreren Teilen besteht – Fachwort: über alles *Iterierbare*. Eine Zeichenkette ist so ein Fall, denn sie besteht aus einzelnen Zeichen. `for zeichen in "Python":` liefert nacheinander `P`, `y`, `t`, `h`, `o`, `n`.

  Damit lassen sich Texte untersuchen, ohne über Positionen und Zählerstände nachdenken zu müssen. In Lektion 11 wirst du die *Liste* kennenlernen, und diese Schreibweise wird dort unverändert weiterfunktionieren.
]

#Code("09_schleifen/for_zeichenkette.py")

#Theorie[
  === `while` oder `for`?

  Beide Schleifen können im Prinzip dasselbe – `summe_sammeln.py` und der letzte Abschnitt von `for_range.py` berechnen exakt dieselbe Summe. Die Wahl ist deshalb keine Frage von richtig und falsch, sondern eine der Lesbarkeit. Eine einfache Faustregel:

  - Steht die Anzahl der Durchläufe *vorher fest* oder läuft man eine Folge ab: `for`.
  - Hängt das Ende von etwas ab, das sich *erst während des Laufens* zeigt (eine Eingabe, ein erreichtes Ziel): `while`.

  Wer die Anzahl kennt und trotzdem `while` verwendet, muss den Zähler selbst anlegen, selbst erhöhen und die Grenze selbst prüfen – drei Stellen, an denen sich Fehler einnisten können. Die `for`-Schleife erledigt alle drei auf einmal.
]

#Abbildung(caption: [Die `for`-Schleife hat dieselbe Gestalt wie die `while`-Schleife – nur übernimmt Python den grau hinterlegten Schritt selbst. Genau deshalb kann eine `for`-Schleife nicht endlos laufen: Das Weiterschalten kann man nicht vergessen.])[
  #text(size: 8.5pt)[
    #diagram(
      ..flow,
      node((0, 0), [noch ein\ Wert übrig?], shape: fletcher.shapes.diamond),
      edge("-|>", [ja], label-side: left),
      node((0, 1), [`zahl` = nächster Wert], fill: luma(235)),
      edge("-|>"),
      node((0, 2), [Rumpf]),
      node((0, 3), [weiter im Programm]),
      edge((0, 0), (1.8, 0), (1.8, 3), (0, 3), "-|>", [nein], label-pos: 0.15),
      edge((0, 2), (-1.8, 2), (-1.8, 0), (0, 0), "-|>", [zurück], label-pos: 0.5),
    )
  ]
]

#Praxis[
  + Gib mit einer `for`-Schleife die Quadratzahlen von `1` bis `10` aus (`1`, `4`, `9`, …).

  + Schreibe das Programm aus der ersten Praxis-Aufgabe (gerade Zahlen von 1 bis 20) mit `for` statt `while`. Welche Fassung liest sich besser?

  + Lass ein Programm die Buchstaben deines Namens einzeln untereinander ausgeben.

  + Was gibt `for i in range(10, 1):` aus? Überlege erst, probiere dann.
]

=== Schleifen in Schleifen

#Theorie[
  Der Rumpf einer Schleife ist ein ganz normaler Block – dort darf also alles stehen, was sonst auch erlaubt ist, einschließlich einer weiteren Schleife. Man spricht dann von *verschachtelten Schleifen*.

  Das Bild dazu ist ein Zeigersystem: Die äußere Schleife ist der Stundenzeiger, die innere der Minutenzeiger. Für *jeden* Schritt des Stundenzeigers dreht der Minutenzeiger eine komplette Runde. Bei zehn äußeren und zehn inneren Durchläufen kommt der Rumpf also hundertmal an die Reihe.

  Entscheidend ist wieder die Einrückung: Sie allein legt fest, was zur inneren und was noch zur äußeren Schleife gehört.
]

#Abbildung(caption: [Die innere Schleife beginnt bei jedem Schritt der äußeren wieder von vorn. Zehn äußere Durchläufe mit je zehn inneren ergeben $10 dot 10 = 100$ Ausführungen des Rumpfes – die vollständige Einmaleins-Tabelle.])[
  #text(size: 9pt)[
    #table(
      columns: 3,
      stroke: none,
      align: (right + horizon, center + horizon, left + horizon),
      inset: (x: 7pt, y: 5pt),
      fill: (x, y) => if x == 2 and y > 0 { luma(238) },

      table.header(
        [*äußere Schleife*], [], [*innere Schleife*],
      ),
      [`reihe = 1`], [$arrow.r$], [`faktor = 1 2 3 4 5 6 7 8 9 10`],
      [`reihe = 2`], [$arrow.r$], [`faktor = 1 2 3 4 5 6 7 8 9 10`],
      [`reihe = 3`], [$arrow.r$], [`faktor = 1 2 3 4 5 6 7 8 9 10`],
      [$dots.v$], [], [$dots.v$],
      [`reihe = 10`], [$arrow.r$], [`faktor = 1 2 3 4 5 6 7 8 9 10`],
    )
  ]
]

#Code("09_schleifen/einmaleins.py")

#Praxis[
  + Lass `einmaleins.py` laufen. Ändere die innere Schleife auf `range(1, 6)` – was passiert mit der Tabelle?

  + Gib ein Dreieck aus Sternchen aus, das in jeder Zeile ein Sternchen mehr hat (fünf Zeilen). Tipp: `print("*" * anzahl)` wiederholt einen Text.

  + Rücke in `einmaleins.py` das abschließende leere `print()` um vier Leerzeichen weiter ein, sodass es zur inneren Schleife gehört. Erkläre die Ausgabe.
]

#Spiel[
  Das Ratespiel aus der letzten Lektion gibt jetzt mehrere Versuche – `zahlenraten_schleife.py` zeigt, wie. Beachte, dass die Schleife aus *zwei* Gründen enden kann: Die Versuche sind aufgebraucht, oder die Zahl wurde erraten. Beides steht in der Bedingung, verbunden mit `and`.

  Zum Ausprobieren:

  + Erhöhe `MAX_VERSUCHE` und beobachte, wie sich das Spiel anfühlt. Wie viele Versuche sind fair für Zahlen von 1 bis 10?

  + Schreibe das Programm mit `while True` und `break` um, statt die Hilfsvariable `geraten` zu verwenden. Welche Fassung findest du klarer?

  + Baue es andersherum: *Du* denkst dir eine Zahl aus, und das Programm rät. Nach jedem Tipp gibst du „zu klein“, „zu groß“ oder „richtig“ ein.

  + Lass ein Programm die Zahlen von 1 bis 100 durchlaufen und dabei nur die ausgeben, die sowohl durch 3 als auch durch 5 teilbar sind.
]

#Code("09_schleifen/zahlenraten_schleife.py")

#Quiz(answer: "c)")[
  ```python
  zahl = 3
  while zahl > 0:
      print("hallo")
  ```
  Was tut dieses Programm?
  + Es gibt `hallo` dreimal aus.
  + Es gibt `hallo` einmal aus.
  + Es gibt endlos `hallo` aus, weil sich `zahl` nie ändert.
  + Es meldet einen `IndentationError`.
]

#Quiz(answer: "b)")[
  Welche Zahlen gibt `for i in range(1, 5): print(i)` aus?
  + `1 2 3 4 5`
  + `1 2 3 4`
  + `0 1 2 3 4`
  + `0 1 2 3`
]

#Quiz(answer: "d)")[
  Welche Zahlen liefert `range(0, 10, 3)`?
  + `0 1 2 3`
  + `3 6 9`
  + `0 3 6 9 10`
  + `0 3 6 9`
]

#Quiz(answer: "a)")[
  Du möchtest so lange nach einer Zahl fragen, bis die Eingabe positiv ist. Welche Schleife passt?
  + `while`, weil das Ende von der Eingabe abhängt und vorher nicht feststeht.
  + `for`, weil jede Eingabe ein Element einer Folge ist.
  + `for` mit `range(3)`, weil drei Versuche üblich sind.
  + Beide sind hier gleich gut geeignet.
]

#Quiz(answer: "b)")[
  Was ist der Unterschied zwischen `break` und `continue`?
  + `break` überspringt einen Durchlauf, `continue` beendet die Schleife.
  + `break` beendet die Schleife, `continue` überspringt den Rest des aktuellen Durchlaufs.
  + Beide beenden die Schleife, `continue` gibt zusätzlich eine Meldung aus.
  + `break` funktioniert nur in `while`, `continue` nur in `for`.
]

=== Häufige Fehler und ihre Ursachen

#Theorie[
  *Das Programm hängt und gibt endlos dasselbe aus*

  Eine Endlosschleife. Im Rumpf ändert sich nichts, was in der Bedingung vorkommt – meist wurde das Hochzählen vergessen. Mit `Strg` + `C` abbrechen und prüfen: _Wodurch soll diese Bedingung jemals falsch werden?_

  *Die Schleife läuft überhaupt nicht*

  Die Bedingung war schon beim ersten Prüfen falsch. Ein `while` prüft *vor* dem ersten Durchlauf, nicht danach. Bei `for` liegt es oft an einem leeren `range()`: `range(10, 1)` zählt aufwärts, kommt von `10` aber nie bei `1` an und liefert deshalb gar nichts. Für rückwärts braucht es eine negative Schrittweite: `range(10, 1, -1)`.

  *Ein Durchlauf zu viel oder zu wenig*

  Der klassische „Zaunpfahlfehler“ (englisch _off-by-one error_). Fast immer ist die obere Grenze von `range()` gemeint: Für die Zahlen `1` bis `10` schreibt man `range(1, 11)`, nicht `range(1, 10)`.

  *`TypeError: 'int' object is not iterable`*

  In der `for`-Zeile steht eine einzelne Zahl statt einer Folge: `for i in 5:`. Eine einzelne Zahl kann man nicht durchlaufen. Richtig ist `for i in range(5):`.

  *`IndentationError: expected an indented block after 'while' statement`*

  Nach dem Doppelpunkt fehlt der eingerückte Rumpf. Jede Schleife braucht mindestens eine Anweisung darunter.

  *Das Ergebnis wird bei jedem Durchlauf zurückgesetzt*

  Kein Absturz, nur ein falsches Ergebnis: Die Sammelvariable (`summe = 0`) steht versehentlich *im* Rumpf statt davor. Sie muss vor der Schleife angelegt werden, sonst beginnt sie jede Iteration von vorn.

  *`ValueError` mitten in der Schleife*

  `int(input(...))` bricht ab, sobald jemand etwas eingibt, das keine Zahl ist. Die Schleife schützt nur vor Werten im falschen *Bereich*, nicht vor der falschen *Art* von Eingabe. Wie man auch das abfängt, lernst du später.
]

#Theorie[
  === Ausblick

  Dein Programm kann jetzt entscheiden *und* wiederholen. Damit hast du alle Bausteine beisammen, um im Prinzip jede Berechnung zu formulieren, die ein Computer ausführen kann – das ist eine bemerkenswerte Grenze, die du gerade überschritten hast.

  Praktisch fehlt aber noch etwas: Bislang wächst jedes Programm als ein einziger langer Block von oben nach unten. Willst du dieselbe Prüfung an drei Stellen durchführen, musst du sie dreimal hinschreiben. In der nächsten Lektion lernst du *Funktionen* – die Möglichkeit, einem Stück Code einen Namen zu geben und es von überall aufzurufen. Ab da baust du Programme aus wiederverwendbaren Bausteinen statt aus einer durchgehenden Textwand.
]
