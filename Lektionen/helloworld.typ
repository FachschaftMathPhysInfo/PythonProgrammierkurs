#import "../lib/helpers.typ": *

== Lektion 1: Hello World

#Theorie[
  === Was ist eine Programmiersprache?

  Ein Computer versteht eigentlich nur Maschinencode – eine Abfolge von 0en und 1en. Eine Programmiersprache ist eine formale Sprache, die es Menschen ermöglicht, Anweisungen so zu schreiben, dass ein Computer sie verstehen _kann_. Sie ist ein Übersetzungssystem: Du schreibst in einer für Menschen lesbaren Syntax auf, was der Computer tun soll, und ein Programm (der Interpreter oder Compiler) übersetzt deine Anweisungen in Maschinencode.

  === Warum Python?

  Es gibt Hunderte von Programmiersprachen. Python hat sich für Anfänger als ideal erwiesen, weil:

  1. *Lesbarkeit:* Python-Code sieht dem Englischen ähnlich. `print(“Hallo”)` ist selbsterklärend, anders als etwa #Code("helloworld.cpp") oder #Code("HelloWorld.java") .

  2. *Minimalistische Syntax:* Python erzwingt saubere Formatierung durch Einrückungen. Das führt zu besseren Gewohnheiten.

  3. *Unmittelbare Feedback-Schleife:* Du kannst Code schreiben und ihn sofort ausführen. Keine langen Kompilierungsschritte.

  4. *Breite Anwendung:* Datenanalyse, KI, Web-Backend, Automatisierung – Python ist überall.

  === Ausführung: Quellcode → Interpretation

  Wenn du eine Python-Datei ausführst, passiert folgendes:

  1. *Quellcode:* Du schreibst lesbare Befehle in `helloworld.py`. Das ist _Text_ – noch keine Anweisung für die CPU.

  2. *Interpreter:* Python liest deine Datei zeilenweise. Für jede Zeile:
     - Prüft Python die Syntax (ist die Syntax korrekt?)
     - Übersetzt Python den Befehl in interne Anweisungen
     - Führt Python den Befehl aus

  3. *Ausführung:* Wenn Python `print(“Hallo Welt!”)` liest, sagt es der Konsole: “Gib diesen Text aus.” Die Konsole druckt es.

  4. *Output:* Du siehst das Ergebnis.

  _Wichtig:_ Python ist eine *interpretierte* Sprache. Das bedeutet: Jedes Mal, wenn du das Programm startest, wird es neu interpretiert. (Das unterscheidet sich von *kompilierten* Sprachen wie C++, die einmal übersetzt werden und dann direkt laufen.)

  === Das “Hello World”-Ritual

  “Hello World” ist die Tradition in der Informatik. Es ist nicht wegen der Aufgabe wichtig, sondern weil es das Fundamental-Konzept demonstriert: *Du kannst dem Computer befehlen, etwas zu tun, und er tut es.*

  Das ist der Kern des Programmierens.
]

#Praxis[
  Erstelle eine neue Datei namens `helloworld.py` und schreibe folgende Zeile:

  ```python
  print(“Hello World!”)
  ```

  Speichere und führe das Programm aus. Die Ausgabe sollte sein: `Hello World!`
]

#Code("helloworld.py")

=== Anatomie des Befehls

#Theorie[
  Der `print()`-Befehl zerlegt sich in drei Teile:

  1. *Funktionsname:* `print` – der Name der Funktion, die wir aufrufen. Funktionen sind wiederverwendbare Bausteine, die eine spezifische Aufgabe erfüllen. Hier: Text in die Konsole schreiben.

  2. *Klammern:* `()` – sie umschließen die _Argumente_ (die Eingaben für die Funktion). `print()` ohne Argumente würde eine leere Zeile drucken.

  3. *Argument:* `”Hello World!”` – der String (Zeichenkette), den wir ausgeben möchten. Die Anführungszeichen sind syntaktisch erforderlich; sie teilen Python mit, dass es sich um Text handelt, nicht um Code.

  _Grundregel:_ Python unterscheidet Groß- und Kleinschreibung. `print` ist korrekt, `Print` führt zu einem Fehler.
]


#Spiel[
  Ihr könnt nun versuchen, den Quellcode selbst zu verändern und damit ein wenig herumzuspielen. Öffnet dazu einen Editor und öffnet die Datei. Denkt daran, nach jeder Änderung die Datei zu speichern und im Terminal neu auszuführen.

  Dinge, die ihr ausprobieren könntet sind zum Beispiel:

  - Was passiert, wenn ihr „Hello world!" in etwas anderes ändert?
  - Was passiert, wenn ihr die Anführungszeichen löscht?
  - Was passiert, wenn ihr zwei `print()`-Befehle hintereinander schreibt?
  - Wie könnte man mehrere Sätze in einer Zeile ausgeben?

  Experimentiert! Das Schöne an Python ist, dass ihr sofort Feedback bekommt, wenn etwas schiefläuf
]
#Quiz(answer: "Das andere wird ausgegeben" )[Was passiert, wenn ihr Hello world durch etwas anderes ersetzt?
+ Das andere wird ausgegeben
+ Es gibt einen Fehler
+ Das Programm tut garnichts mehr
+ Das Programm gibt trotzdem Hello world aus
]

=== Häufige Fehler und ihre Ursachen

#Theorie[
  Wenn dein Programm nicht läuft, liegt es an einer dieser Syntaxfehler:

  *Fehler 1: Fehlende oder falsche Anführungszeichen*
  ```python
  print(Hallo Welt!)    # SyntaxError – kein String definiert
  print(“Hallo Welt!”)  # Korrekt
  ```

  *Fehler 2: Falsche Großschreibung*
  ```python
  Print(“Hallo Welt!”)  # NameError – Python kennt Print nicht
  print(“Hallo Welt!”)  # Korrekt
  ```

  *Fehler 3: Falsche Klammer-Typen*
  ```python
  print[“Hallo Welt!”]  # SyntaxError – eckige Klammern sind für Listen
  print(“Hallo Welt!”)  # Korrekt – runde Klammern für Funktionen
  ```

  Diese Fehler sind typisch – sie passieren jedem. Der Schlüssel ist, die Fehlermeldung zu lesen. Python teilt dir präzise mit, was schiefgelaufen ist.
]
