#import "../lib/helpers.typ": *

#import "@preview/cetz:0.5.2"

== Terminal und Navigation

In dieser Lektion werden wir ein wichtiges Konzept kennenlernen, was uns diesen gesamten Kurs begleiten wird. Das Terminal und die Shell.


=== Das Terminal
Das Terminal an sich ist erstmal nur ein Anwendung wie VSCode oder Firefox. Es zeigt standartmäßig nur reinen Text an, also erwartet keine Bilder. Und anstatt ins Internet zu gehen, erlaubt uns das Terminal eine _SHELL_ zu nutzen. Das ganze passiert indem wir Befehle in das Terminal schreiben. Schicken wir diese danach ab mit `Enter`, führt die Shell diese aus und schreibt das ergebniss ebenfalls in das Terminal.

==== Die Prompt
Vor deinem Cursor stehen als immer ein paar Statusinfos, die sogenante Prompt. Bei dir ist das dein Nutzername `@` Name der Maschine und dann das Working Directory.


==== Das working Directory
Das Terminal befindet sich immer in einem Ordner, dem sogenannten _Working Directory_. Das sind die selben Ordner (In Unix nennen wir Ordner _Directory_ ) die wir sehen wenn wir den Fileexploer öffnen. Alle Befehle die wir ausführen werden standartmäßig im Working Directory ausgeführt. 

Ein paar wichtige Fakten zu Dateipfaden:
- `~` ist das Directory deiner Benutzerin. Fast alles was du machst, findet in diesem Directory statt.
- Pfade nutzen `/` zum Trennen. `mein/pfad/zur/datei.txt` bedeutet das die Datei `datei.txt` im Directory `zur` liegt, was wiederum im Directory `pfad` und das schließlich `mein` liegt. 
- `..` ist ein besonderes Directory. Es existiert in jedem Directory und stellt das Elter directory dar. In `zur` ist es `mein/pfad`, und in `pfad` ist es nur `mein`.
- Wir unterscheiden zwischen relativen und absoluten Pfaden. Relative Pfade beginnen von aktuellen Directory, absolute Pfade von der sogenannten Wurzel `/`. Beginnt ein Pfad mit `/`, dann ist es immer ein absoluter Pfad. `~` zum Beispiel ist der absolute Pfad zu deinem Home Directory.





=== Naivigation

Mit das wichtigste was wir in der Shell machen ist uns auf der Directorystruktur hin und herzubewegen. Das machen wir mit ein paar befehelen.

==== cd
`cd` steht für _change directory_ und macht auch genau das was man erwartet. Wir geben `cd` den Namen eines Directorys und es wechselt in das.


```bash
cd mydir # Wechsle in das Directory mydir
```

Das Argument von cd ist ein _Pfad_. Lass uns damit mal etwas rumspielen.


#columns(2)[


#Spiel[
    + Öffne ein neues Terminal. Du solltest in `~` sein.
    + Nutz `cd` mit dem Pfad `mein/weg/zur`, um zur Datei `Datei.txt` zu gelangen.
    + Wie kommst du zurück ins Home Directory?
        + Was bedeutet `..` nochmal?
        + Kannst du absolute Pfade angeben?
        + Was passiert wenn du `cd` ohne Argument nutzt?

]

    #colbreak()

    //TODO: Diese Ordnerstruktur muss erstellt werden und irgendwie auf die Rechner der Erstis kopiert werden (maybe als zip oder als skript). Das root muss weg, weil das nur auf unseren Rechnern sinn macht..
    #cetz.canvas({
    import cetz.draw: *


    set-style(line: ( stroke: (.2pt + black)))

    content((0,0), "/", name: "root")
    content((-1,-1), "home", name: "home")
    content((-2,-2), "mathphys", name: "mathp")
    content((-2, -3), "mein", name: "mein" )
    content((-2, -4), "pfad", name: "pfad")
    content((-2, -5), "zur", name: "zur")
    content((-2, -6), "Datei.txt", name: "datei")
    
    content((0, -4), "anderer", name: "anderer")
    content((0, -5), "pfad", name: "pfad2")
    content((0, -6), "zur", name: "zur2")
    content((0, -7), "Datei2.txt", name: "datei2")

    content((0,-1), "lib", name: "lib")
    content((1,-1), "usr", name: "usr")

    line("root", "usr")
    line("root", "lib")

    line("root", "home")
    line("home", "mathp")
    line("mathp", "mein")
    line("mein", "pfad")
    line("mein", "anderer")
    line("pfad", "zur")
    line("zur", "datei")

    line("anderer", "pfad2")
    line("pfad2", "zur2")
    line("zur2", "datei2")
    
})


]


==== pwd
Falls du dich mal völlig verloren hast, gibt es den Befehll `pwd`. Das steht für _path towards directory_ und gibt dir den Absoluten Pfad zum Working Directory.



==== ls
Meistens hast du nicht den Luxus das du ein Diagram zu deiner Directorystruktur bekommst. Wie finde ich aber nun raus wo ich mit cd überall hinkomme? Dafür gibt es den `ls` Befehl. Das steht für 'list' und gibt an was alles in einem Directory ist. Man kann entweder ein pfad angeben, dann bekommt man alles was sich dort befindet, oder man gibt nichts an, dann bekommt man den Inhalt des working directories.

#Spiel[Das Diagramm von oben war nicht ganz ehrlich. Da sind noch ein paar Dateien ausgelasssen. Find raus wie sie heissen, ohne dabei `cd` zu verwenden.]
