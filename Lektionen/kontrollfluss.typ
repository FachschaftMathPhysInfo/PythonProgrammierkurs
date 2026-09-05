#import "../lib/helpers.typ": *

== Lektion: Kontrollfluss

Bisher lief jedes unserer Programme stur von oben nach unten durch , jede Zeile genau einmal, immer in derselben Reihenfolge. Am Ende der letzten Lektion ist uns dabei etwas Unangenehmes passiert: Gibt die Nutzerin als Divisor eine `0` ein, stürzt das Programm mit einem `ZeroDivisionError` ab. In dieser Lektion geben wir dem Programm die Fähigkeit, *abhängig von seinen Daten unterschiedliche Wege einzuschlagen* , und solche Abstürze höflich abzufangen. Diese Abhängigkeit des Programmablaufs von den Werten, mit denen es arbeitet, nennen wir *Kontrollfluss*.

#Theorie[
  === Eine Weggabelung im Programm

  Stell dir vor, du kochst nach einem Rezept. Die meisten Schritte machst du einfach der Reihe nach. An einer Stelle steht aber: „Falls du keine frische Milch hast, nimm Hafermilch , sonst nimm die frische Milch.“ Ab hier hängt dein nächster Handgriff von einer Bedingung ab. Du prüfst etwas, und je nach Antwort tust du das eine *oder* das andere, aber nie beides.

  Genau dieses Muster gibt es in Python. Es heißt *bedingte Anweisung* oder kurz *if-Anweisung* (von englisch _if_, „falls“):

  ```python
  if zweite_zahl == 0:
      print("Fehler: Durch 0 darf nicht geteilt werden.")
  else:
      print(erste_zahl / zweite_zahl)
  ```

  Wörtlich gelesen: „*Falls* `zweite_zahl` gleich `0` ist, gib die Fehlermeldung aus. *Andernfalls* (`else`) gib das Ergebnis der Division aus.“ Python prüft die Bedingung hinter `if`. Trifft sie zu, wird der erste Block ausgeführt und der `else`-Block übersprungen. Trifft sie nicht zu, ist es umgekehrt.

  Drei Bestandteile sind syntaktisch verpflichtend:

  1. Das Schlüsselwort `if`, gefolgt von einer *Bedingung* , einem Ausdruck, der entweder wahr oder falsch ist.
  2. Ein *Doppelpunkt* `:` am Zeilenende. Er kündigt an: „Jetzt kommt ein Block, der zu diesem `if` gehört.“
  3. Der *eingerückte Block* darunter: die Anweisungen, die nur in diesem Fall ausgeführt werden.

  Der `else`-Zweig ist optional. Oft will man nur etwas tun, *wenn* eine Bedingung zutrifft, und sonst nichts , dann lässt man `else` einfach weg.
]

#Code("08_kontrollfluss/division_pruefen.py")

#Theorie[
  === Der Doppelgänger: `=` und `==`

  In der letzten Lektion war das einfache Gleichheitszeichen eine *Zuweisung*: `x = 5` bedeutet „lege den Wert `5` unter dem Namen `x` ab“. Zum *Vergleichen* braucht Python ein anderes Zeichen, nämlich das *doppelte* Gleichheitszeichen `==`. Der Ausdruck `x == 5` stellt eine Frage: „Ist der Wert von `x` gleich `5`?“ , und die Antwort ist wahr oder falsch.

  Diese Verwechslung ist ein klassischer Stolperstein. Merkhilfe: `=` *macht* gleich, `==` *fragt*, ob gleich.

  Neben `==` gibt es weitere *Vergleichsoperatoren*, die du aus dem Matheunterricht kennst:

  - `==` — gleich
  - `!=` — ungleich
  - `<` — kleiner als
  - `>` — größer als
  - `<=` — kleiner oder gleich
  - `>=` — größer oder gleich

  Alle vergleichen zwei Werte und liefern als Ergebnis wahr oder falsch. Das funktioniert übrigens nicht nur mit Zahlen: `name == "Xenia"` prüft, ob in `name` genau diese Zeichenkette steht.

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

#Praxis[
  + Öffne `division_pruefen.py` und führe es zweimal aus: einmal mit einer `0` als zweiter Zahl, einmal mit einer anderen Zahl. Verfolge, welcher Block jeweils läuft.

  + Ersetze in `division_pruefen.py` das `==` durch ein einfaches `=` (also `if zweite_zahl = 0:`). Führe das Programm aus und lies die Fehlermeldung. Mach die Änderung anschließend rückgängig.

  + Entferne in `einrueckung_wichtig.py` die vier Leerzeichen vor der ersten `print`-Zeile im `if`-Block. Was meldet Python? In welcher Zeile?

  + Schreibe ein Programm, das nach dem Alter fragt und `Zutritt erlaubt` ausgibt, wenn die Person mindestens 16 ist, sonst `Zutritt verweigert`.
]

=== Mehr als zwei Fälle

#Theorie[
  Nicht jede Entscheidung hat nur zwei Ausgänge. Eine Punktzahl in eine Note zu übersetzen heißt, zwischen mehreren Stufen zu unterscheiden. Dafür gibt es `elif` , eine Zusammenziehung von _else if_, „sonst falls“.

  ```python
  if punkte >= 90:
      note = "sehr gut"
  elif punkte >= 75:
      note = "gut"
  elif punkte >= 60:
      note = "befriedigend"
  else:
      note = "nicht bestanden"
  ```

  Python arbeitet die Bedingungen *von oben nach unten* ab und nimmt den *ersten* Zweig, dessen Bedingung wahr ist. Alle weiteren werden dann nicht mehr geprüft. Der `else`-Zweig am Ende fängt alles ab, was durch keine der Bedingungen erfasst wurde.

  Deshalb ist die *Reihenfolge* entscheidend. Bei `95` Punkten ist auch `punkte >= 75` wahr , aber Python hat den passenden Zweig `punkte >= 90` bereits genommen und überspringt den Rest. Würde man die Prüfungen in umgekehrter Reihenfolge notieren (die kleinste zuerst), bekäme *jede* bestandene Arbeit die Note „ausreichend“.

  Ein `if` darf beliebig viele `elif`-Zweige haben, aber *höchstens ein* `else`, und das steht immer am Schluss.
]

#Code("08_kontrollfluss/noten_kategorie.py")

#Praxis[
  + Führe `noten_kategorie.py` mit den Eingaben `95`, `60` und `30` aus und prüfe, ob die Note stimmt.

  + Erweitere das Programm um eine Stufe `ausreichend` für `punkte >= 50`.

  + Schreibe ein Programm, das eine Uhrzeit als ganze Stunde (`0`–`23`) einliest und `Guten Morgen`, `Guten Tag`, `Guten Abend` oder `Gute Nacht` ausgibt , je nach Tageszeit.

  + Was passiert in `noten_kategorie.py`, wenn du `120` eingibst? Und bei `-5`? Überlege, ob das Programm das abfangen sollte.
]

=== Wahrheitswerte und verknüpfte Bedingungen

#Theorie[
  Jede Bedingung, die wir hinter ein `if` schreiben, ist im Kern eine Frage, die Python mit einem von genau zwei Werten beantwortet: `True` (wahr) oder `False` (falsch). Diese beiden bilden einen eigenen Datentyp, den *Wahrheitswert* , in Python `bool`, benannt nach dem Mathematiker George Boole.

  Du kannst dir das direkt ansehen, indem du einen Vergleich einfach ausgibst:

  ```python
  print(5 > 3)     # True
  print(2 == 10)   # False
  ```

  Manchmal soll eine Anweisung nur laufen, wenn *mehrere* Dinge gleichzeitig zutreffen , oder wenn *mindestens eines* von mehreren zutrifft. Dafür gibt es drei Wörter:

  - `and` — wahr, wenn *beide* Seiten wahr sind
  - `or` — wahr, wenn *mindestens eine* Seite wahr ist
  - `not` — kehrt wahr und falsch um

  ```python
  if temperatur > 20 and sonnig:
      print("Zeit fuer eine Pause draussen.")
  ```

  Gelesen: „Falls es wärmer als 20 Grad ist *und* die Sonne scheint …“. Ist auch nur eine der beiden Bedingungen falsch, wird der Block übersprungen.
]

#Code("08_kontrollfluss/vergleiche_und_wahrheit.py")

#Theorie[
  Mit diesem Werkzeug können wir die Aufgabe aus der letzten Lektion sauber lösen: prüfen, ob eine Zahl eine andere teilt. Der Rest-Operator `%` verrät es uns , ist der Rest `0`, geht die Division glatt auf.
]

#Code("09_schleifen/teilbarkeit.py")

#Praxis[
  + Schreibe ein Programm, das eine ganze Zahl einliest und ausgibt, ob sie gerade oder ungerade ist. (Tipp: `zahl % 2`.)

  + Schreibe ein Programm, das prüft, ob eine eingegebene Jahreszahl ein Schaltjahr ist. Regel: durch 4 teilbar, aber nicht durch 100, es sei denn, auch durch 400. (Diese Aufgabe braucht `and`, `or` und `not`.)

  + Frage nach einer Zahl und gib `im Bereich` aus, wenn sie zwischen `1` und `100` liegt (beide Grenzen eingeschlossen), sonst `ausserhalb`.
]

#Spiel[
  Das Programm `zahlenraten.py` denkt sich eine feste Zahl aus und sagt dir nach deinem Tipp, ob er zu groß, zu klein oder richtig war. Führe es ein paar Mal aus. Verändere anschließend `GESUCHTE_ZAHL` und den erlaubten Bereich im `input`-Text.

  Weitere Dinge zum Ausprobieren:

  + Was passiert, wenn du in `division_pruefen.py` den Doppelpunkt hinter `if zweite_zahl == 0` weglässt? Lies die Fehlermeldung genau.

  + Baue in `zahlenraten.py` mit `and` eine zusätzliche Reaktion ein: Wenn der Tipp *kleiner als 1 oder größer als 10* ist, soll das Programm „Das war gar keine gültige Zahl!“ sagen.

  + Schreibe ein Programm, das nach deinem Namen fragt. Tippt die Nutzerin den Namen deiner Tutorin ein, soll das Programm sich begeistert über die Namensgleichheit zeigen, sonst einfach freundlich grüßen.

  + In Python gilt eine `0` in einer Bedingung als falsch und jede andere Zahl als wahr. Probier `if 3:` und `if 0:` aus. Merkwürdig? Für den Anfang: bleib bei echten Vergleichen, dann bist du auf der sicheren Seite.
]

#Code("08_kontrollfluss/zahlenraten.py")

#Quiz(answer: "b)")[
  Was ist der Unterschied zwischen `=` und `==`?
  + Es gibt keinen, beide vergleichen zwei Werte.
  + `=` weist einen Wert zu, `==` prüft auf Gleichheit.
  + `=` prüft auf Gleichheit, `==` weist einen Wert zu.
  + `==` funktioniert nur mit Zahlen, `=` auch mit Text.
]

#Quiz(answer: "c)")[
  ```python
  temperatur = 15
  if temperatur >= 20:
      print("warm")
  print("fertig")
  ```
  Was gibt dieses Programm aus?
  + `warm` und `fertig`
  + nur `warm`
  + nur `fertig`
  + einen `IndentationError`
]

#Quiz(answer: "b)")[
  ```python
  punkte = 82
  if punkte >= 50:
      note = "ausreichend"
  elif punkte >= 75:
      note = "gut"
  elif punkte >= 90:
      note = "sehr gut"
  print(note)
  ```
  Welche Note wird ausgegeben?
  + `gut`
  + `ausreichend`
  + `sehr gut`
  + einen Fehler, weil mehrere Bedingungen zutreffen
]

#Quiz(answer: "d)")[
  Wodurch erkennt Python, welche Zeilen zu einem `if`-Block gehören?
  + An geschweiften Klammern `{ }` um den Block.
  + An einem `end`-Schlüsselwort am Blockende.
  + An einem Strichpunkt `;` hinter jeder Zeile des Blocks.
  + An der Einrückung der Zeilen.
]

#Quiz(answer: "b), c)")[
  Welche Aussagen über `and`, `or` und `not` sind korrekt?
  + `a and b` ist wahr, wenn mindestens eine Seite wahr ist.
  + `a or b` ist wahr, wenn mindestens eine Seite wahr ist.
  + `not True` ergibt `False`.
  + `and` verbindet nur Zahlen, nicht Wahrheitswerte.
]


=== Häufige Fehler und ihre Ursachen

#Theorie[
  *`IndentationError: expected an indented block after 'if' statement`*

  Nach einem `if:` (oder `elif:`, `else:`) fehlt der eingerückte Block. Jede bedingte Anweisung braucht mindestens eine Zeile darunter, und die muss eingerückt sein.

  *`IndentationError: unexpected indent`*

  Eine Zeile ist eingerückt, obwohl davor kein `:` einen Block eröffnet hat. Häufig ein versehentliches Leerzeichen am Zeilenanfang.

  *`TabError: inconsistent use of tabs and spaces in indentation`*

  Innerhalb desselben Blocks wurden Tabulatoren und Leerzeichen gemischt. Optisch nicht zu sehen. Lösung: im Editor „Tabs in Leerzeichen umwandeln“ aktivieren und die betroffenen Zeilen neu einrücken.

  *`SyntaxError: expected ':'`*

  Der Doppelpunkt am Ende der `if`-, `elif`- oder `else`-Zeile fehlt.

  *`SyntaxError: invalid syntax` bei `if x = 5:`*

  Hier steht eine Zuweisung, wo eine Bedingung hingehört. Gemeint war der Vergleich `if x == 5:`.

  *Das Programm läuft, entscheidet aber falsch*

  Kein Absturz, keine Fehlermeldung , trotzdem stimmt das Ergebnis nicht. Fast immer liegt es an der *Reihenfolge* der `elif`-Zweige oder an einer verrutschten Einrückung. Hilfreich: an den entscheidenden Stellen ein `print()` einbauen und den Wert der geprüften Variable ausgeben lassen.
]



#Theorie[
  === Ausblick

  Mit bedingten Anweisungen kann dein Programm jetzt an einer Stelle *einen* von mehreren Wegen wählen. Was es noch nicht kann: eine Aufgabe *wiederholen*, bis etwas erledigt ist, etwa so lange nach einer Zahl fragen, bis die Eingabe gültig ist, oder alle Teiler einer Zahl durchprobieren. Genau das leisten *Schleifen*, das Thema der nächsten Lektion. Du wirst dabei feststellen, dass die Einrückung dort dieselbe Rolle spielt wie hier.
]

