#import "../lib/helpers.typ": *

== Lektion: Das REPL

#Theorie[
  // === Ein Brief oder ein Gespräch?

  // Stell dir vor, du willst jemandem eine Frage stellen. Du hast zwei
  // Möglichkeiten: Du schreibst einen Brief, steckst ihn in einen Umschlag,
  // frankierst ihn und wartest auf die Antwort  oder du rufst die Person an
  // und sprichst direkt mit ihr. Beides führt zum Ziel, aber für eine schnelle
  // Frage ("Wie spät ist es?") ist das Telefongespräch eindeutig praktischer.
  // Für eine ausführliche, gut überlegte Mitteilung eignet sich dagegen eher
  // der Brief.

  // Mit Python ist es ganz ähnlich. Als du in der Hello-World-Lektion
  // `helloworld.py` geschrieben und mit `python3 helloworld.py` ausgeführt
  // hast, hast du einen *Brief* geschrieben: Du hast deinen Code in eine Datei
  // gepackt, "abgeschickt", und der Interpreter hat ihn Zeile für Zeile
  // abgearbeitet. Das nennt man den *Skript-Modus*.

  // Es gibt aber auch die zweite Möglichkeit: das *Gespräch*. Du tippst eine
  // Zeile Python-Code direkt ein, drückst Enter, und Python antwortet dir
  // sofort. Keine Datei, kein Abspeichern, keine Wartezeit. Diesen
  // interaktiven Modus nennt man das *REPL*.

  // Dass das überhaupt möglich ist, liegt genau an der Eigenschaft von
  // Python, die du schon aus der Hello-World-Lektion kennst: Python ist eine
  // *interpretierte* Sprache. Ein Compiler (wie bei \Cpp oder Java) übersetzt
  // ein ganzes Programm erst vollständig, bevor irgendetwas läuft, dafür
  // braucht er die ganze Datei. Ein Interpreter dagegen kann eine einzelne
  // Zeile lesen, sofort ausführen, und auf die nächste warten. Genau das
    // macht das REPL möglich.

    Erinnert ihr euch noch an den Unterschied zwischen *Interpretierten* und *Compilierten* Programmiersprachen? Wir wollen uns jetzt mit einer nützlichen Konsequenz von Interpretierten Sprachen befassen.

    Die Interpretation erfolgt immer Zeile nach Zeile, Anweisung nach Anweisung. `python` fängt oben an und arbeitet das Programm ab. So habt ihr ja schon gesehen was passiert wenn wir eine Funktion aufrufen die erst später definiert wird.

    Die Konsequenz ist jetzt, das wir ja nicht von anfang an wissen müssen wie das ganze Programm aussieht. Wir können ja theoretisch immer neue Zeilen und Anweisungen unten anhängen, also das Programm dann schreiben wenn wir es ausführen, _interaktiv_. Das ganze passiert über ein sogenanntes *REPL*.

  === Was bedeutet REPL?

  REPL ist eine Abkürzung und beschreibt genau das, was bei jeder Zeile
  passiert, die ihr eintippt:

  + *Read* (Lesen) : Python liest die Zeile, die ihr eingegeben habt. Das
    kann eine einzelne Zeile sein, aber auch mehrere zusammengehörige
    Zeilen (dazu gleich mehr).
  + *Eval* (Auswerten) : Python wertet aus, was diese Zeile bedeutet (z. B.
    eine Rechnung wie ```python 2 + 2```).
  + *Print* (Ausgeben) : Python zeigt euch das Ergebnis direkt an.
  + *Loop* (Schleife) : Und dann fängt das Ganze von vorne an: Python
    wartet auf eure nächste Eingabe.

  Read, Eval, Print, Loop: REPL. Es ist also wörtlich eine Dauerschleife:
  lesen, auswerten, ausgeben, wieder lesen, wieder auswerten, wieder
  ausgeben … so lange, bis ihr das REPL beendet.

  Der große Vorteil: Das REPL ist Teil jeder Python-Installation. Ihr müsst
  nichts zusätzlich installieren, es ist immer sofort einsatzbereit. Es ist ideal, um schnell einen Codeschnipsel zu testen, ein neues Konzept auszuprobieren oder Zeile für Zeile nachzuvollziehen, warum etwas nicht funktioniert.

  === Das REPL starten

  Öffnet euer Terminal (die Shell, die ihr schon aus den vorherigen Lektionen
  kennt) und gebt ein:

  ```bash
  python3
  ```

  _Wichtig:_ Anders als bei `python3 helloworld.py` gebt ihr hier *keinen*
  Dateinamen an. Ohne Dateinamen weiß Python, dass ihr nicht vorhabt, eine
  Datei auszuführen, sondern direkt mit ihm "sprechen" wollt.

  Ihr solltet jetzt ungefähr so etwas sehen:

  ```
  Python 3.10.12 (main, ...)
  Type "help", "copyright", "credits" or "license" for more information.
  >>>
  ```

  Diese drei spitzen Klammern `>>>` sind der *Prompt* des REPL, das
  Gegenstück zum Prompt eurer Shell, den ihr schon kennt. Er sagt euch:
  "Ich bin bereit, gib mir eine Zeile Python-Code."

  === Das REPL wieder verlassen

  Um das REPL zu verlassen, habt ihr zwei gleichwertige Möglichkeiten:

  - Ihr tippt ```python exit()``` und drückt Enter.
  - Ihr drückt die Tastenkombination `Strg + D` (auf einer Zeile ohne
    Eingabe).

  Danach landet ihr wieder in eurer normalen Shell, es ist daran erkennbar , dass der Prompt sich wieder ändert (also kein `>>>` mehr).
]

#Praxis[
  *Aufgabe 1:*

  + Öffnet ein Terminal und startet das REPL mit `python3`.
  + Tippt die folgenden Zeilen einzeln ein, drückt nach *jeder* Zeile Enter
    und schaut, was passiert, bevor ihr weitermacht:

    ```
    3 + 4
    "Hallo"
    10 / 3
    ```
  + Verlasst das REPL wieder mit ```python exit()```.

  Ihr solltet bemerkt haben: Nach jeder Zeile erscheint sofort das
  Ergebnis, ganz ohne ```python print()```. Genau das ist der "Print"-Schritt aus
  Read-Eval-*Print*-Loop.
]

=== Skript vs. REPL: der entscheidende Unterschied

#Theorie[
  Im REPL zeigt Python euch automatisch das Ergebnis jeder Zeile an. In einem
  Skript passiert das *nicht*, dort müsst ihr explizit ```python print()``` verwenden,
  so wie ihr es aus der Hello-World-Lektion kennt.

  Der Grund dafür ergibt sich direkt aus dem Zweck der beiden Modi: Ein
  Skript soll ein fertiges Programm sein, das genau das ausgibt, was *ihr*
  festlegt, nicht mehr und nicht weniger. Wer euer Programm ausführt,
  will schließlich nicht bei jeder internen Zwischenrechnung eine Zeile
  Text sehen. Das REPL hingegen ist ein Werkzeug für *euch* zum
  Ausprobieren, und beim Ausprobieren wollt ihr bei jeder Zeile sofort das
  Ergebnis sehen, deshalb druckt Python es automatisch mit.

  Schaut euch das folgende Beispiel an. Es enthält bewusst sowohl Zeilen ohne
  `print()` als auch Zeilen mit `print()`.
]

#Code("repl_vs_skript.py")

#Praxis[
  *Aufgabe 2:*

  + Tippt die vier Zeilen aus `repl_vs_skript.py` einzeln ins REPL ein.
    Notiert euch (z. B. auf Papier oder im Kopf), was nach jeder Zeile
    ausgegeben wird.
  + Führt danach dieselbe Datei als Skript aus: `python3 repl_vs_skript.py`
  + Vergleicht: Welche Zeilen haben im Skript *keine* Ausgabe erzeugt,
    obwohl sie im REPL etwas angezeigt haben? Könnt ihr erklären, warum?
]

//=== Variablen und Zustand: Was das REPL sich merkt

#Theorie(title_sup: "Variablen und Zustand")[
  Ein zweiter wichtiger Aspekt des REPL: Es "merkt sich" alles, was ihr
  innerhalb *einer* laufenden Sitzung eingebt. Legt ihr eine Variable an,
  könnt ihr sie in der nächsten Zeile weiterverwenden, genau wie in einem
  Skript, nur eben Zeile für Zeile statt auf einmal.

  ```
  >>> alter = 19
  >>> alter + 1
  20
  ```

  Ein praktisches Detail dabei: Das REPL speichert automatisch das
  *letzte* berechnete Ergebnis in einer speziellen Variable namens `_`
  (ein einzelner Unterstrich). Damit könnt ihr weiterrechnen, ohne das
  Ergebnis erst selbst in eine Variable zu packen:

  ```
  >>> 10 * 2
  20
  >>> _ + 5
  25
  ```

  _Wichtig, und ein Punkt, an dem viele Anfängerinnen zunächst
  stolpern:_ Dieser Zustand existiert *nur*, solange das REPL läuft.
  Schließt ihr es (mit `exit()` oder `Strg + D`), sind alle Variablen
  unwiderruflich weg. Es gibt keine automatische Speicherung, anders als
  bei einer `.py`-Datei, die ihr auf der Festplatte gesichert habt und
  jederzeit wieder öffnen könnt.

  Das ist der Grund, warum ihr das REPL zum *Ausprobieren* und *Testen*
  benutzt, aber richtige Programme, die ihr wiederverwenden wollt, immer
  als Skript in einer Datei speichert.
]

#Code("repl_spielwiese.py")

#Praxis[
  *Aufgabe 3:*

  Öffnet das REPL und arbeitet `repl_spielwiese.py` Zeile für Zeile durch.
  Versucht bei jeder Zeile, *bevor* ihr sie eintippt, kurz vorherzusagen,
  was passieren wird, und prüft danach, ob eure Vorhersage gestimmt hat.
]

=== Besonderheiten

#Theorie[
    // Alles normales behaviour
  // Das REPL fühlt sich anfangs ungewohnt an, weil es sich anders verhält als
  // ein Editor oder eine Shell. Hier sind die typischsten Stellen, an denen
  // Anfänger:innen ins Straucheln geraten  und was dahintersteckt.

    // *Wie verlasse ich das REPL*
    // Es kann häufig vorkommen, das ihr solche fehler sieht.

  ```
  >>> python3 helloworld.py
  SyntaxError: invalid syntax
  ```

  // Das passiert, wenn man vergisst, dass man sich *bereits im REPL*
  //   befindet. Falls wir mit dem REPL fertig sind, können wir es durch den Befehl ```python exit()``` wieder verlassen.

    *Mehrzeilige Eingaben*

    Wie geben wir Anweisungen ein, die sich über mehrere Zeilen erstrecken? Müssen wir alles irgendwie in eine Zeile quetschen? Zum Glück nicht.

  Tippt ihr eine unvollständige Zeile ein, zum Beispiel eine offene
  Klammer, die noch nicht geschlossen wurde, wechselt der Prompt von
  `>>>` zu `...`:

  ```
  >>> print(
  ...
  ```

    Das bleibt solange bestehen, bis ihr die entsprechende Klammer schließt.
    Danach kommt ihr zu dem normalen Prompt zurück und Python interpretiert die Eingabe.

    Man kann so auch Einrückungen im Repl nutzen. Wenn ihr beispielsweise eine ```python for``` schleife anfängt gelangt ihr ebenfalls zu dem anderen Prompt. Ihr beendet diesem Modus wenn ihr eine Leerzeile eingebt.
  // Das ist kein Fehler und das REPL ist nicht "eingefroren". Es wartet nur
  // geduldig darauf, dass du die Eingabe vervollständigst. Du kannst die
  // Klammer einfach schließen und Enter drücken, oder mit `Strg + C`
  // abbrechen und neu anfangen.

  // *Stolperstein 3: Eine Variable wird versehentlich überschrieben*

  // Python beschwert sich nicht, wenn du einer bereits existierenden Variable
  // einen neuen Wert zuweist, der alte Wert ist danach einfach weg:

  // ```
  // >>> alter = 19
  // >>> alter = "Ups, jetzt ein Text"
  // >>> alter
  // 'Ups, jetzt ein Text'
  // ```

  // Gerade im REPL, wo man viel experimentiert, passiert das leicht mit
  // kurzen, oft verwendeten Namen. Ein guter Reflex: Bei überraschenden
  // Ergebnissen den Wert einer Variable noch einmal einzeln anzeigen lassen
    // (einfach ihren Namen eintippen), bevor du weiterrechnest.


    *Die help Funktion*

    Das REPL bietet uns eine Funktion an, die es in normalem Python so nicht gibt, die ```python help()``` Funktion. Wenn ihr sie einfach so aufruft, landet ihr in einer interaktiven Hilfe-Anwendung. Alternativ, wenn ihr wisst wonach ihr sucht, könnt ihr auch direkt Argumente an help geben.

    *Das REPL vergisst #strike("nicht")*

    Das REPL hat keine Speicherfunktion. Wenn ihr dort ein tolles Programm geschrieben habt, müsst ihr es per Hand rausschreiben, ansonsten geht es irgendwann verloren.


]

// #Spiel[
//   Zeit zum freien Erkunden. Öffne das REPL und probiere Folgendes aus:

//   - Python bringt eingebaute Hilfe mit: Tippe `help(print)` ein und lies,
//     was dir angezeigt wird. (Mit `help()` ganz ohne Klammerinhalt landest du
//     in einem interaktiven Hilfe-Modus, den du mit `quit` wieder verlässt.)
//   // - Tippe `type(5)`, `type("Hallo")` und `type(5.0)` ein. Was bekommst du
//     //   jeweils zurück? Kannst du dir denken, wofür `type()` gut sein könnte?
//     // type() wird schon in einer vorherigen Lecture benutzt.e
//   - Drücke im REPL einmal die Pfeiltaste nach oben (↑). Was passiert?
//     Probiere, eine frühere Eingabe so wiederzufinden, leicht abzuändern und
//     erneut auszuführen. // History sollte man eher im Terminal erklären und hier einen Hinweis darauf geben das dass auch ein REPL war.
//   - Finde heraus, was passiert, wenn du eine Variable benutzt, die es noch
//     gar nicht gibt, z. B. `nichtvorhanden + 1`. Welche Fehlermeldung siehst
//     du? Kommt sie dir bekannt vor? // Useless
//   - Zum Nachdenken: Warum, glaubst du, zeigt Python im REPL automatisch
//     jedes Ergebnis an, aber in einem Skript nicht? Formuliere deine Antwort
//     in einem Satz, bevor du weiterliest, du hast die Antwort in dieser
//     Lektion bereits gelesen. // Das wurde doch schon erklärt.
// ]

#Spiel[
    Probiert mal aus eine der letzten Aufgaben im REPL zu lösen. Ist das einfacher oder schwieriger?
]


#Quiz(answer: "Das Ergebnis 7 wird direkt angezeigt")[
  Was passiert, wenn ihr im REPL `10 - 3` eingebt und Enter drückt?
  + Das Ergebnis 7 wird direkt angezeigt
  + Es passiert gar nichts
  + Es gibt einen SyntaxError
  + Ihr müsst zuerst `print()` davor schreiben
]

#Quiz(answer: "Sie gehen verloren")[
  Was passiert mit euren Variablen, wenn ihr das REPL mit `exit()`
  verlasst?
  + Sie werden automatisch in einer Datei gespeichert
  + Sie bleiben im Hintergrund weiter aktiv
  + Sie gehen verloren
  + Sie werden zu globalen Variablen des Betriebssystems
]

#Quiz(answer: "Ein Skript (eine .py-Datei), weil es dauerhaft gespeichert wird")[
  Ihr wollt denselben Code später noch einmal ausführen können, ohne ihn
  neu einzutippen. Was ist dafür die bessere Wahl?
  + Das REPL, weil es schneller ist
  + Ein Skript (eine .py-Datei), weil es dauerhaft gespeichert wird
  + Es spielt keine Rolle, beides ist gleich gut geeignet
  + Keins von beidem funktioniert dauerhaft
]

Das REPL ist extrem nützlich um kurz dinge auszuprobieren. REPL's gibt es nicht nur in Python, nahezu jede interpretierbare Sprache liefert ein REPL. Wir haben sogar schon eins benutzt. Das was in unserem Terminal passiert ist auch ein REPL, nur nicht in `python`, sondern in der Sprache `bash`. Das bedeutet auch das ihr im Terminal Variablen, Schleifen, Funktionen und dergleichen nutzen könnt.
// Damit hast du ein zweites Werkzeug in der Hand: Neben dem Skript-Modus aus
// der Hello-World-Lektion kannst du jetzt auch das REPL nutzen, um Ideen
// schnell auszuprobieren, bevor du sie in ein richtiges Programm packst. Genau
// das werden wir in den kommenden Lektionen immer wieder tun, dort, wo es
// etwas Neues zu entdecken gibt, probieren wir es zuerst gemeinsam im REPL
// aus.
