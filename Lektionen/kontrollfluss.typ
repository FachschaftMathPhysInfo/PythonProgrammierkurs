#import "../lib/helpers.typ": *

== Der Kontrollfluss

In dieser Lektion lernen wir, wie unser Programm unterschiedliche dinge machen kann, je nachdem weile eingabe wir eingeben.


#Theorie[Jedes Programm hat einen sogenanten Kontrollfluss. Das ist die Reihenfolge in der Anweisungen abgeabreitet werden. Standardmäßig werden die Anweisungen von oben nach unten abgearbeitet. Es ist aber auch möglich, Anweisungen nur auszuführen, wenn wir bestimmte Voraussetzungen erfüllen. Das ganze nennen wir Verzweigung. Als erstes brauchen wir noch etwas Theorie:



    ==== Warheitswerte
    Warheitswerte geben an, ob etwas Wahr ist oder nicht. Das heißt sie nehmen entweder den wert ```python True```, wahr,  oder ```python False```, falsch, an. Variablen, die einen Wahrheitswert annehmen, nennen wir auch _Boolsche Variablen_

    ==== Boolsche Ausdrücke
    Ein Boolscher Ausdruck ist ein Ausdruck, der einen Wahrheitswert produziert. Das sieht man am besten an ein Paar Beispielen:
    - ```python print(1 < 2)```
    - ```python print(1 <= 1)```
    - ```python print(1 != 2)```
    - ```python print(1 == 2)```
    Ähnlich wie bei der Arithmetik können wir einfach die Vergleichsymbole aus der Schule nutzen um Zahlen zu vergleichen. Der Ausdruch "ist 1 kleiner als 2" kann in der Theorie zwei Werte annahmen, Ja, 1 ist kleiner 2, oder falsch, 1 ist nicht kleiner als 2 (wir wissen alle das nur eine der beiden Aussagen zutriff). Die Nützlichkeit davon steigt imens, wenn wir variablen miteinander vergleichen.

    Leider ist das ```python = ``` schon belegt, deswegen verwenden wir für Gleichheit einfach zwei.
    //TODO: Verneinung

    ==== Die if-verzweigung
    Wir können nun Optionale Anweisungen in unser Programm einbauen, indem wir sagen, dass sie nur ausgeführt werden sollen, wenn ein boolscher Ausdruck stimmt. Das ganze sieht so aus:

    #Code("08_kontrollfluss/if_example.py")

    Das ganze liest sich sehr gut: Falls (```python if ```) dieser Ausdruck gilt, dann machen folgendes. Damit python auch weiss was alles zu folgendem gehört, _rücken wir das ein_. Das heißt einfach vier Leerzeichen oder einmal Tab.



    
   
]


#Spiel[Erinnern wir uns zurück an die Mitternachtsformel. Manchmal kommt es vor, dass es nur eine Lösung gibt. Erweitert das Programm, so das in diesem Fall eine kleine Meldung kommt.]



=== Das Else
Oft haben wir den fall dass wir auch etwas tuen wollen wenn eine Kondition nicht gilt. Also wenn ja, mach dies, sonst, mach das. Dafür gibt es das sogenante Else, und das sieht so aus.

#Code("08_kontrollfluss/if_else_example.py")

Beachtet das das ```python else``` auf der selben Tiefe wie das if steht, zu dem es gehört. Sonst denkt python dass das ```python else``` eine Anweisung ist, die nur ausgeführt werden soll wenn die Voraussetzung wahr ist.



//<<<<<<< HEAD

#Praxis[
    Das Einrücken passiert Relativ. Das heißt dass wenn wir eine verzweigung in einer Verzweigung haben, weil natürlich geht das, haben wir eine doppelte Einrückung
=======
  === Warum die Leerzeichen zählen

  In vielen Programmiersprachen markiert man zusammengehörige Anweisungen mit geschweiften Klammern `{ ... }`. Die Einrückung ist dort nur Kosmetik für das menschliche Auge. Python geht einen anderen Weg: Hier *ist die Einrückung die Syntax*. Es gibt keine Klammern um Blöcke , stattdessen entscheidet allein die Position am Zeilenanfang, was zu einem Block gehört und was nicht.

  Das ist zunächst ungewohnt, aber die Idee dahinter ist angenehm: Code, der ordentlich eingerückt ist, *sieht* so aus, wie er *funktioniert*. Es gibt keine zwei Wahrheiten mehr , kein „sieht eingerückt aus, ist aber nicht drin“.

  *Analogie:* Denk an eine Gliederung mit Unterpunkten. Was unter einer Überschrift eingerückt steht, gehört zu ihr. Rückt ein Punkt wieder nach links aus, beginnt ein neuer, übergeordneter Abschnitt.

  Betrachte den Unterschied:

  ```python
  if alter >= 18:
      print("Du bist volljaehrig.")
      print("Du darfst waehlen.")
  print("Programmende.")
  ```

  Die ersten beiden `print`-Zeilen sind eingerückt , sie gehören zum `if` und werden nur bei `alter >= 18` ausgeführt. Die dritte Zeile steht wieder am linken Rand, *außerhalb* des `if`, und läuft deshalb immer.

  Verschiebt man nun die zweite Zeile an den Rand:

  ```python
  if alter >= 18:
      print("Du bist volljaehrig.")
  print("Du darfst waehlen.")
  ```

  … dann gehört `"Du darfst waehlen."` nicht mehr zum `if`. Jetzt bekommt auch eine 12-Jährige die Wahlberechtigung bescheinigt. Das Programm ist weiterhin gültig , es tut nur etwas anderes.

  *Die Regeln in Kurzform:*

  - Pro Einrückungsstufe verwendet man üblicherweise *vier Leerzeichen*.
  - Alle Zeilen eines Blocks müssen *gleich weit* eingerückt sein.
  - *Mische niemals Leerzeichen und Tabulatoren.* Für das Auge sehen beide gleich aus, für Python sind es verschiedene Zeichen. Die meisten Editoren (auch VSCode) wandeln einen Tastendruck auf `Tab` automatisch in Leerzeichen um , lass diese Einstellung an.
]

#Code("08_kontrollfluss/einrueckung_wichtig.py")

// #Praxis[
//   + Öffne `division_pruefen.py` und führe es zweimal aus: einmal mit einer `0` als zweiter Zahl, einmal mit einer anderen Zahl. Verfolge, welcher Block jeweils läuft.

//   + Ersetze in `division_pruefen.py` das `==` durch ein einfaches `=` (also `if zweite_zahl = 0:`). Führe das Programm aus und lies die Fehlermeldung. Mach die Änderung anschließend rückgängig.

//   + Entferne in `einrueckung_wichtig.py` die vier Leerzeichen vor der ersten `print`-Zeile im `if`-Block. Was meldet Python? In welcher Zeile?

//   + Schreibe ein Programm, das nach dem Alter fragt und `Zutritt erlaubt` ausgibt, wenn die Person mindestens 16 ist, sonst `Zutritt verweigert`.
// ]

// === Mehr als zwei Fälle

// #Theorie[
//   Nicht jede Entscheidung hat nur zwei Ausgänge. Eine Punktzahl in eine Note zu übersetzen heißt, zwischen mehreren Stufen zu unterscheiden. Dafür gibt es `elif` , eine Zusammenziehung von _else if_, „sonst falls“.

//   ```python
//   if punkte >= 90:
//       note = "sehr gut"
//   elif punkte >= 75:
//       note = "gut"
//   elif punkte >= 60:
//       note = "befriedigend"
//   else:
//       note = "nicht bestanden"
//   ```

//   Python arbeitet die Bedingungen *von oben nach unten* ab und nimmt den *ersten* Zweig, dessen Bedingung wahr ist. Alle weiteren werden dann nicht mehr geprüft. Der `else`-Zweig am Ende fängt alles ab, was durch keine der Bedingungen erfasst wurde.

//   Deshalb ist die *Reihenfolge* entscheidend. Bei `95` Punkten ist auch `punkte >= 75` wahr , aber Python hat den passenden Zweig `punkte >= 90` bereits genommen und überspringt den Rest. Würde man die Prüfungen in umgekehrter Reihenfolge notieren (die kleinste zuerst), bekäme *jede* bestandene Arbeit die Note „ausreichend“.

//   Ein `if` darf beliebig viele `elif`-Zweige haben, aber *höchstens ein* `else`, und das steht immer am Schluss.
// ]

// #Code("08_kontrollfluss/noten_kategorie.py")

// #Praxis[
//   + Führe `noten_kategorie.py` mit den Eingaben `95`, `60` und `30` aus und prüfe, ob die Note stimmt.

//   + Erweitere das Programm um eine Stufe `ausreichend` für `punkte >= 50`.

//   + Schreibe ein Programm, das eine Uhrzeit als ganze Stunde (`0`–`23`) einliest und `Guten Morgen`, `Guten Tag`, `Guten Abend` oder `Gute Nacht` ausgibt , je nach Tageszeit.

//   + Was passiert in `noten_kategorie.py`, wenn du `120` eingibst? Und bei `-5`? Überlege, ob das Programm das abfangen sollte.
// ]

// === Wahrheitswerte und verknüpfte Bedingungen

// #Theorie[
//   Jede Bedingung, die wir hinter ein `if` schreiben, ist im Kern eine Frage, die Python mit einem von genau zwei Werten beantwortet: `True` (wahr) oder `False` (falsch). Diese beiden bilden einen eigenen Datentyp, den *Wahrheitswert* , in Python `bool`, benannt nach dem Mathematiker George Boole.

//   Du kannst dir das direkt ansehen, indem du einen Vergleich einfach ausgibst:

//   ```python
//   print(5 > 3)     # True
//   print(2 == 10)   # False
//   ```

//   Manchmal soll eine Anweisung nur laufen, wenn *mehrere* Dinge gleichzeitig zutreffen , oder wenn *mindestens eines* von mehreren zutrifft. Dafür gibt es drei Wörter:

//   - `and` — wahr, wenn *beide* Seiten wahr sind
//   - `or` — wahr, wenn *mindestens eine* Seite wahr ist
//   - `not` — kehrt wahr und falsch um

//   ```python
//   if temperatur > 20 and sonnig:
//       print("Zeit fuer eine Pause draussen.")
//   ```

//   Gelesen: „Falls es wärmer als 20 Grad ist *und* die Sonne scheint …“. Ist auch nur eine der beiden Bedingungen falsch, wird der Block übersprungen.
// ]

// #Code("08_kontrollfluss/vergleiche_und_wahrheit.py")

// #Theorie[
//   Mit diesem Werkzeug können wir die Aufgabe aus der letzten Lektion sauber lösen: prüfen, ob eine Zahl eine andere teilt. Der Rest-Operator `%` verrät es uns , ist der Rest `0`, geht die Division glatt auf.
// ]

// #Code("09_schleifen/teilbarkeit.py")

// #Praxis[
//   + Schreibe ein Programm, das eine ganze Zahl einliest und ausgibt, ob sie gerade oder ungerade ist. (Tipp: `zahl % 2`.)

//   + Schreibe ein Programm, das prüft, ob eine eingegebene Jahreszahl ein Schaltjahr ist. Regel: durch 4 teilbar, aber nicht durch 100, es sei denn, auch durch 400. (Diese Aufgabe braucht `and`, `or` und `not`.)

//   + Frage nach einer Zahl und gib `im Bereich` aus, wenn sie zwischen `1` und `100` liegt (beide Grenzen eingeschlossen), sonst `ausserhalb`.
// ]

// #Spiel[
//   Das Programm `zahlenraten.py` denkt sich eine feste Zahl aus und sagt dir nach deinem Tipp, ob er zu groß, zu klein oder richtig war. Führe es ein paar Mal aus. Verändere anschließend `GESUCHTE_ZAHL` und den erlaubten Bereich im `input`-Text.

//   Weitere Dinge zum Ausprobieren:

//   + Was passiert, wenn du in `division_pruefen.py` den Doppelpunkt hinter `if zweite_zahl == 0` weglässt? Lies die Fehlermeldung genau.

//   + Baue in `zahlenraten.py` mit `and` eine zusätzliche Reaktion ein: Wenn der Tipp *kleiner als 1 oder größer als 10* ist, soll das Programm „Das war gar keine gültige Zahl!“ sagen.

//   + Schreibe ein Programm, das nach deinem Namen fragt. Tippt die Nutzerin den Namen deiner Tutorin ein, soll das Programm sich begeistert über die Namensgleichheit zeigen, sonst einfach freundlich grüßen.

//   + In Python gilt eine `0` in einer Bedingung als falsch und jede andere Zahl als wahr. Probier `if 3:` und `if 0:` aus. Merkwürdig? Für den Anfang: bleib bei echten Vergleichen, dann bist du auf der sicheren Seite.
// ]

// #Code("08_kontrollfluss/zahlenraten.py")

// #Quiz(answer: "b)")[
//   Was ist der Unterschied zwischen `=` und `==`?
//   + Es gibt keinen, beide vergleichen zwei Werte.
//   + `=` weist einen Wert zu, `==` prüft auf Gleichheit.
//   + `=` prüft auf Gleichheit, `==` weist einen Wert zu.
//   + `==` funktioniert nur mit Zahlen, `=` auch mit Text.
// ]

// #Quiz(answer: "c)")[
//   ```python
//   temperatur = 15
//   if temperatur >= 20:
//       print("warm")
//   print("fertig")
//   ```
//   Was gibt dieses Programm aus?
//   + `warm` und `fertig`
//   + nur `warm`
//   + nur `fertig`
//   + einen `IndentationError`
// ]

// #Quiz(answer: "b)")[
//   ```python
//   punkte = 82
//   if punkte >= 50:
//       note = "ausreichend"
//   elif punkte >= 75:
//       note = "gut"
//   elif punkte >= 90:
//       note = "sehr gut"
//   print(note)
//   ```
//   Welche Note wird ausgegeben?
//   + `gut`
//   + `ausreichend`
//   + `sehr gut`
//   + einen Fehler, weil mehrere Bedingungen zutreffen
// ]

// #Quiz(answer: "d)")[
//   Wodurch erkennt Python, welche Zeilen zu einem `if`-Block gehören?
//   + An geschweiften Klammern `{ }` um den Block.
//   + An einem `end`-Schlüsselwort am Blockende.
//   + An einem Strichpunkt `;` hinter jeder Zeile des Blocks.
//   + An der Einrückung der Zeilen.
// ]

// #Quiz(answer: "b), c)")[
//   Welche Aussagen über `and`, `or` und `not` sind korrekt?
//   + `a and b` ist wahr, wenn mindestens eine Seite wahr ist.
//   + `a or b` ist wahr, wenn mindestens eine Seite wahr ist.
//   + `not True` ergibt `False`.
//   + `and` verbindet nur Zahlen, nicht Wahrheitswerte.
// ]
//  ae42e6f (code organisiert nach den lektionen)


    //TODO: Hier ein Beispiel welches verschachtelte If's verwendet. Die studis sollen dann rausfinden was genau da passiert. Maybe soll das Programm eine Eingabe von mehreren Werten verarbeiten und dinge printen und die sollen rausfinden was geprinted wird.
//]







