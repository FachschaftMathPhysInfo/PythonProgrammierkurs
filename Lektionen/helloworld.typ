#import "../lib/helpers.typ": *

== Hello World

In dieser Lektion wollen wir uns als erstes nochmal mit dem `Hello World` Programm vom Anfang befassen. Doch davor erstmal etwas Theorie, sorry.


  === Was ist eine Programmiersprache?

  Ein Computer versteht eigentlich nur Maschinencode – eine Abfolge von 0en und 1en. Das ist das `Binär`, von dem du vielleicht schon einmal gehört hast. Für den Computer ist Binär ganz toll. Es gibt nur 2 Werte: 0 und 1, wahr und falsch, Strom oder kein Strom. Er kann damit sehr effizient und sehr schnell Arbeiten. Für den Menschen ist Binär aber sehr unleserlich. Deswegen nutzen wir Programmiersprachen. Eine Programmiersprache ist eine Sprache, sie hat wie Deutsch oder Englisch eine bestimmte Syntax, also Regeln um gültige Sätze zu bilden, und Semantik, also eine Interpretation was diese Sätze auch bedeuten. Die Sätze nennen wir bei uns Anweisungen. Sie sind Elementare Befehle die wir dem Computer stellen. Das Hello World Programm von vorhin:
  #Code("helloworld.py")
  besteht zum Beispiel aus genau einer Anweisung: Drucke die Buchstaben "Hello World" aus. In python haben wir meistens eine Anweisung pro Zeile.

  Damit der Computer das jetzt aber auch versteht, müssen wir das erst in Maschinensprache übersetzen. Das macht der Befehlt `python3` für uns. Bei der Übersetzung gibt es zwei verschiedene Strategien



  / Compilieren: Der Code wird einmal Übersetzt und der Maschinencode wird gespeichert. Das hat den Vorteil das er danach direkt vorhanden ist, musss aber teilweise für verschiedene Computer erneut gemacht werden.
  / Interpretieren: Der Code wird dynamisch dann übersetzt wenn er benötigt wird. Das ist langsamer als die Compilation, aber um einiges handhabbarer

  Python verwendet dabei letzteres. Unser Interpreter ist dabei einfach Python.
  
  //TODO: Warum ist das hier???
// === Warum Python?

// Python ist die vermutlich die Programmiersprache, die am häufigstem als Anfängersprache empfohlen wird. Das hat ganz viele Gründe. Für uns interressant ist aber nur einer. Ihr werdet es brauchen.

// Python ist in der Wissenschaft sehr verbreitet. Viele Programme sind in Python geschrieben oder liegen als sogenannte Bibilotheken (libraries, dazu später mehr) vor. So werdet ihr sehr Wahrscheinlich in der Einführung in die Numerik mit Python arbeiten, und in der IPI sowieso.


=== Das “Hello World”-Ritual

Jetzt aber endlich zurück zu etwas Prakischem. Ihr habt vielleicht gefragt warum wir ausgerechnet "Hello World" gedruckt haben. Das hat traditionelle Gründe. Es ist ein Ritual der Informatikerinnen, dass das erste was man in einer Neuen Programmiersprache macht, ist, einmal Hello World auszugeben.

    



=== Der Print Befehl

#Theorie[

    Die Semantik von ```python print("Hello World")``` haben wir gerade kennengelernt. Schauen wir uns einmal die Syntax an.

1. ```python print```: Das ist der Name des Befehls den Wir nutzen wollen. Der ist Python bekannt und kann einfach so benutzt werden.
2. (...): Die Klammern haben zwei Bedeutungen. Zum einen sagen sie Python das es irgendeine Handlung machen soll, zum anderen beinhalten sie die Argumente. Das sind dinge, mit denen der Befehltarbeiten soll. 
3. ```python "Hello World"```: Das ist unser Argument. Wir wollen das, was wir reinschreiben, auch genau so wieder ausgegeben haben. Deshalb packen wir das ganze in Anführungszeichen.

Das ganze nennt sich Funktionsaufruf. Das erinnert stark an die (Schul-) Mathe mit $f(x)$.


]

#Spiel[
    Eine beliebte Übung ist es herauszufinden, was alles kaputt gehen kann. Baut mal fehler in euer Programm ein:
    - Vertippt euch bei Hello oder World.
    - Lasst die Anführungszeichen weg
    - Schließt die Klammern nicht
    - Vertippt euch bei Print.

    Was passiert alles? Worüber beschwert sich Python?
]

Eine weitere tolle Eigenschaft von `print` ist es das es mehrere Argumente nimmt. Versucht mal mehrere Dinge auszugeben. *TIPP*, Argumente trennt ihr mit einem Komma voneinander.



=== Eingabe (der input Befehl)

Bis jetzt ist die Kommunikation recht einseitig. Das Programm redet mit uns, wir aber nicht mit ihm. Lasst uns das ändern.


    Wir wissen ja bereits, dass wir die Worte in ```python "Hello World"``` mithilfe eines Kommas trennen können. Ersetzt nun mal das "World" in ```python print("Hello", "World")``` durch ```python input()``` Was passiert?
    - Das Terminal hat nun einen blinkenden Cursor. Gebt mal euren Namen ein und drückt Enter.

Das funktioniert schonmal ganz gut, aber nicht jede merkt wann man was eingeben muss. Zum Glück akzeptiert `input` auch Argumente. Können wir das Problem dadurch lösen? Probiert es aus.



#Spiel[
    1. Wie weit können wir das auf die Spitze treiben? Schreibt ein Programm, das die Nutzerin nach ihrem Namen, ihrem Alter und Ihrem Studienfach fragt und das ganze ausgibt.
    2. Unsere Programme bestehen bis jetzt nur aus einer Anweisung. Schreibt mal ein Programm mit mehreren Anweisungen.

]


#Quiz(answer: "")[
    - Das Quizz ist Scheiße //TODO: Fixen
]

// #Spiel[
//   Ihr könnt nun versuchen, den Quellcode selbst zu verändern und damit ein wenig herumzuspielen. Öffnet dazu einen Editor und öffnet die Datei. Denkt daran, nach jeder Änderung die Datei zu speichern und im Terminal neu auszuführen.

//   Dinge, die ihr ausprobieren könntet sind zum Beispiel:

//   - Was passiert, wenn ihr „Hello world!" in etwas anderes ändert?
//   - Was passiert, wenn ihr die Anführungszeichen löscht?
//   - Was passiert, wenn ihr zwei `print()`-Befehle hintereinander schreibt?
//   - Wie könnte man mehrere Sätze in einer Zeile ausgeben?

//   Experimentiert! Das Schöne an Python ist, dass ihr sofort Feedback bekommt, wenn etwas schiefläuf
// ]
// #Quiz(answer: "Das andere wird ausgegeben" )[Was passiert, wenn ihr Hello world durch etwas anderes ersetzt?
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
