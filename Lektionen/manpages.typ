#import "../lib/helpers.typ": *
== Man Pages

In dieser Lektion findest du heraus, wie du dir selbst Wissen über die Shell aneignen kannst.


=== Die help flag
Die meisten Befehle haben die `--help` Flag. Sie sorgt dafür das der Befehl seine eigentliche Aufgabe nicht macht, sondern nützliche Informationen über sich ausgibt. Dort findest du meist eine Übersicht über die wichtigsten Flags und wie du den Befehl genau verwendest.


=== Man Pages
#Theorie(show-heading: false)[

    Falls du mal mehr Informationen brauchst oder dich in irgendwas viel tiefer einlesen musst, dann sind die _man pages_ dein bester Freund. `man` ist kurz für Manual, und das ist auch der Charakter dieses Befehls.
    
    Wir schauen uns das am Beispiel von `cp` an, wie so eine man page aufgabaut ist und wie man sie am besten liest.]

#Praxis()[


+ Öffne eine Konsole und gib `man cp` ein.

Die man page besteht aus mehreren _Sections_. Welche Sections es genau
gibt, hängt von der man page ab, aber meistens gibt es mindestens die folgenden:

#description(format: it => raw(it))[
/ NAME:
        Gibt dir den Namen des Befehls und eine einzeilige Beschreibung an


/ SYNOPSIS:      Gibt dir die generelle Benutzung des Befehls an. In diesem Fall gibt
     es drei mögliche Formen. Allen gemein ist, dass man zunächst
     `cp` eingibt, darauf folgen Optionen. Wie der Rest interpretiert
     wird, hängt dann vom diesem Rest ab. Werden zwei weitere Parameter angegeben,
     wird der erste als Quelle, der zweite als Ziel interpretiert (erste
     Form). Werden mehr Parameter angegeben, wird das letzte als
     Verzeichnis, in das man alle anderen kopieren will interpretiert
     (zweite Form). In der dritten Form (wenn `-t` angegeben wird)
     wird hingegen der _erste_ Parameter als das Zielverzeichnis
     interpretiert, in das alle anderen Dateien kopiert wird.
       
       Es gibt eine Vielzahl von Konventionen für diesen Bereich, eckige
       Klammern bedeuten z.B. dass dieser Teil auch weggelassen werden darf,
       drei Punkte bedeuten, dass hier mehrere solche Dinge stehen können.
       
       Dieser Bereich ist der, der am Interessantesten für dich ist, wenn du
       „einfach schnell wissen willst, wie es funktioniert“.

/ DESCRIPTION:   Hier wird ausführlicher beschrieben, was der Befehl tut. Hier werden
        auch alle möglichen Optionen beschrieben, die wir dem Befehl bei
        `[OPTION]` mitgeben können. Die wichtigen Informationen
        stehen meistens irgendwo in diesem Bereich.

/ AUTHOR, KNOWN BUGS, ...:             Hier stehen weitere Hintergrundinformationen, die meistens eher für Entwicklerinnen interessant sind.


/ SEE ALSO:
         Auch eine wichtige Section für dich: Wenn du die gewünschte
         Information nicht gefunden hast, oder du nicht den richtigen Befehl
         gefunden hast, stehen hier manchmal verwandte Befehle oder Quellen
         weiterer Informationen.


man pages sind häufig sehr umfangreich und enthalten viel mehr Informationen,
als du dir gerade wünschst. Es ist nicht immer einfach, die gerade relevanten
Informationen heraus zu filtern und es gibt nichts frustrierenderes, als einen
Befehl gerade dringend zu brauchen, aber nicht zu kennen und sich erst durch
eine lange man page lesen zu müssen.

Dennoch ist es eine sehr hilfreiche Fähigkeit  zu wissen, wie man man pages
liest und sich einfach in einem ruhigen Moment mal durch die ein oder andere
man page durch zu lesen. Häufig lernt man dabei neue Dinge und manchmal macht es
einem das Leben irgendwann sehr viel leichter, sie zu wissen.

Hab daher Geduld, wenn dir eine wirsche Linux-Expertin auf die Frage, wie
du unter Linux deinen Laptop in den Ruhemodus versetzt, ein schnelles „man
pm-suspend“ antwortet. Mit ein bisschen Übung wird dir das tatsächlich
hinreichend schnell zur richtigen Lösung verhelfen.

]
Und wenn du mal wirklich keine Zeit hast, die ganze page zu lesen, kannst du mit `/` auch nach Begriffen innerhalb der page suchen: Zum Beispiel `/close`
]
=== Praxis
+ Öffne die man page von `ls`. Finde die Optionen fürs lange
Listenformat (long listing format), für das sortieren nach Dateigröße
und um auch versteckte Dateien (unter Linux sind das alle, die mit
  `.` anfangen) anzuzeigen und probiere sie aus.
+ Was ist der Unterschied zwischen `ls -a` und `ls -A`?
      Probiere beides aus. Das ist auf den ersten Blick nicht so leicht zu sehen.
                        Frag uns einfach, wenn du es nicht findest.

=== Spiel
-  Wie über so gut wie jeden Befehl gibt es auch über `man` eine
              manpage. Schau sie dir mal an.
- Es gibt nicht nur für Shell-Befehle man pages. So findest du zum Beispiel allerlei nützliche Informationen in späteren Kapiteln. `man 7 path_resolution` zum Beispiel erklärt nochmal im Detail wie man von einem Pfad zu einer Datei kommt.
//TODO: Es gibt vielleicht einen besseren Weg die Quizzes zu gestalten (eventuell mit lösungen oder so)
// Rotierter Text unten drunter oder am Besten am ende von der Lektion oder dem ganzen Buch



#Quiz(answer: "wie man einen Befehl verwendet")[
Was findet man alles in einer Manpage?
+ nützliche Informationen
+ viel Text
+ wie man einen Befehl verwendet
+ warum der Befehl erfunden wurde
]

