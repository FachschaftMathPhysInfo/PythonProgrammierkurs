#import "../lib/helpers.typ": *

== Hello World

In dieser Lektion wollen wir uns als erstes nochmal mit dem `Hello World` Programm vom Anfang befassen. Doch davor erstmal etwas Theorie, sorry.


  === Was ist eine Programmiersprache?

  Ein Computer versteht eigentlich nur Maschinencode – eine Abfolge von 0en und 1en. Das ist das `Binär`, von dem du vielleicht schon einmal gehört hast. Für den Computer ist Binär ganz toll. Es gibt nur 2 Werte: 0 und 1, wahr und falsch, Strom oder kein Strom. Er kann damit sehr effizient und sehr schnell arbeiten. Für den Menschen ist Binär aber sehr unleserlich. Deswegen nutzen wir Programmiersprachen als Abstraktion. Eine Programmiersprache ist eine Sprache, sie hat wie Deutsch oder Englisch eine bestimmte Syntax, also Regeln um gültige Sätze zu bilden, und Semantik, also eine Interpretation was diese Sätze dann bedeuten. Die Sätze nennen wir bei uns Anweisungen. Sie sind elementare Befehle die wir dem Computer geben. Das Hello World Programm von vorhin:
  #Code("06_helloworld/helloworld.py")
  besteht zum Beispiel aus genau einer Anweisung: Gebe die Buchstaben "Hello World" aus. In python haben wir meistens eine Anweisung pro Zeile.

  Damit der Computer das jetzt aber auch versteht, müssen wir das erst in Maschinensprache übersetzen. Das macht der Befehl `python3` für uns. Bei der Übersetzung gibt es zwei verschiedene Strategien



  / Compilieren: Der Code wird einmal übersetzt und der Maschinencode wird gespeichert. Das hat den Vorteil, dass er danach direkt vorhanden ist, musss aber teilweise für verschiedene Computer erneut gemacht werden.
  / Interpretieren: Der Code wird dynamisch dann übersetzt, wenn er benötigt wird. Das ist langsamer als die Compilation, aber um einiges handhabbarer

  Python verwendet dabei letzteres. Unser Interpreter ist dabei einfach Python.

//   === Warum Python?

//   Python ist vermutlich die Programmiersprache, die am häufigsten als Anfängersprache empfohlen wird. Das hat ganz viele Gründe. Für uns interessant ist aber nur einer. Du wirst es brauchen.

//   Python ist in der Wissenschaft sehr verbreitet. Viele Programme sind in Python geschrieben oder liegen als sogenannte Bibliotheken (libraries, dazu später mehr) vor. So wirst du sehr wahrscheinlich in der Einführung in die Numerik mit Python arbeiten, und in der IPI sowieso.


=== Das “Hello World”-Ritual

Jetzt aber endlich zurück zu etwas prakischem. Du hast dich vielleicht gefragt warum wir ausgerechnet "Hello World" gedruckt haben. Das hat traditionelle Gründe. Es ist ein Ritual der Informatikerinnen, dass das erste was man in einer neuen Programmiersprache macht, ist, einmal Hello World auszugeben.

=== Der Print Befehl

#Theorie[

    Die Semantik von ```python print("Hello World")``` haben wir gerade kennengelernt. Schauen wir uns einmal die Syntax an.

1. ```python print```: Das ist der Name des Befehls den wir nutzen wollen. Der ist Python bekannt und kann einfach so benutzt werden.
2. (...): Die Klammern haben zwei Bedeutungen. Zum einen sagen sie Python das es irgendeine Handlung machen soll, zum anderen beinhalten sie die Argumente. Das sind Dinge, mit denen der Befehl arbeiten soll. 
3. ```python "Hello World"```: Das ist unser Argument. Wir wollen das, was wir reinschreiben, auch genau so wieder ausgegeben haben. Deshalb packen wir das ganze in Anführungszeichen.

Das ganze nennt sich Funktionsaufruf. Das erinnert stark an die (Schul-) Mathe mit $f(x)$.


]

#Spiel[
    Eine beliebte Übung ist es herauszufinden, was alles kaputt gehen kann. Bau mal Fehler in dein Programm ein:
    - Vertipp dich bei Hello oder World.
    - Lass die Anführungszeichen weg
    - Schließ die Klammern nicht
    - Vertipp dich bei Print.

    Was passiert alles? Worüber beschwert sich Python?
]

Eine weitere tolle Eigenschaft von `print` ist es das es mehrere Argumente nimmt. Versuch mal mehrere Dinge auszugeben. *TIPP*, Argumente trennst du mit einem Komma voneinander.



=== Eingabe (der input Befehl)

Bis jetzt ist die Kommunikation recht einseitig. Das Programm redet mit dir, du aber nicht mit ihm. Lass uns das ändern.


    Wir wissen ja bereits, dass wir die Worte in ```python "Hello World"``` mithilfe eines Kommas trennen können. Ersetz nun mal das "World" in ```python print("Hello", "World")``` durch ```python input()``` Was passiert?
    - Das Terminal hat nun einen blinkenden Cursor. Gib mal deinen Namen ein und drück Enter.

Das funktioniert schonmal ganz gut, aber nicht jede, merkt wann man etwas eingeben muss. Zum Glück akzeptiert `input` auch Argumente. Kannst du das Problem dadurch lösen? Probier es aus.



#Spiel[
    1. Wie weit können wir das auf die Spitze treiben? Schreib ein Programm, das die Nutzerin nach ihrem Namen, ihrem Alter und ihrem Studienfach fragt und das ganze ausgibt.
    2. Unsere Programme bestehen bis jetzt nur aus einer Anweisung. Schreib mal ein Programm mit mehreren Anweisungen.

]


#Quiz(answer: "b)")[
    Was passiert, wenn du die Anführungszeichen weglässt, also ```python print(Hello World)``` schreibt?
    + Python druckt einfach "Hello World" wie gewohnt
    + Es gibt einen `SyntaxError`, weil Python nicht weiß, was `Hello` und `World` sein sollen
    + Python druckt "Hello" und "World" jeweils in eine neue Zeile
    + Das Programm läuft, gibt aber nichts aus
]

#Quiz(answer: "c)")[
    Du schreibst ```python print("Hallo", "Welt")``` mit einem Komma statt eines einzelnen Strings. Was gibt Python aus?
    + `HalloWelt` (ohne Leerzeichen)
    + Einen `TypeError`, weil `print` nur ein Argument akzeptiert
    + `Hallo Welt` (Python fügt automatisch ein Leerzeichen zwischen den Argumenten ein)
    + Nur `Hallo`, das zweite Argument wird ignoriert
]

// #Spiel[
//   Du kannst nun versuchen, den Quellcode selbst zu verändern und damit ein wenig herumzuspielen. Öffne dazu einen Editor und öffne die Datei. Denk daran, nach jeder Änderung die Datei zu speichern und im Terminal neu auszuführen.

//   Dinge, die du ausprobieren könntest sind zum Beispiel:

//   - Was passiert, wenn du „Hello world!" in etwas anderes änderst?
//   - Was passiert, wenn du die Anführungszeichen löschst?
//   - Was passiert, wenn du zwei `print()`-Befehle hintereinander schreibst?
//   - Wie könnte man mehrere Sätze in einer Zeile ausgeben?

//   Experimentier! Das Schöne an Python ist, dass du sofort Feedback bekommst, wenn etwas schiefläuf
// ]
// #Quiz(answer: "Das andere wird ausgegeben" )[Was passiert, wenn du Hello world durch etwas anderes ersetzt?
// + Das andere wird ausgegeben
// + Es gibt einen Fehler
// + Das Programm tut garnichts mehr
// + Das Programm gibt trotzdem Hello world aus
// ]

// === Häufige Fehler und ihre Ursachen

// #Theorie[
//   Wenn dein Programm nicht läuft, liegt es an einer dieser Syntaxfehler:

//   *Fehler 1: Fehlende oder falsche Anführungszeichen*
//   ```python
//   print(Hallo Welt!)    # SyntaxError – kein String definiert
//   print(“Hallo Welt!”)  # Korrekt
//   ```

//   *Fehler 2: Falsche Großschreibung*
//   ```python
//   Print(“Hallo Welt!”)  # NameError – Python kennt Print nicht
//   print(“Hallo Welt!”)  # Korrekt
//   ```

//   *Fehler 3: Falsche Klammer-Typen*
//   ```python
//   print[“Hallo Welt!”]  # SyntaxError – eckige Klammern sind für Listen
//   print(“Hallo Welt!”)  # Korrekt – runde Klammern für Funktionen
//   ```

//   Diese Fehler sind typisch – sie passieren jedem. Der Schlüssel ist, die Fehlermeldung zu lesen. Python teilt dir präzise mit, was schiefgelaufen ist.
// ]
