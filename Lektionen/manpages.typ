#import "../lib/helpers.typ": *
== Manpages

In dieser Lektion findet ihr heraus, wie ihr euch selbst Wissen über die Shell aneignen könnt.


=== Die help flag
Die meisten Befehle haben die `--help` flag. Sie sorgt dafür das der Befehl seine eigentliche Aufgabe nicht macht, sondern Nützliche Informationen über sich ausgibt. Dort findet ihr meist eine Übersicht über die wichtigsten Flags und wie ihr den Befehl genau verwendet.


=== Man Pages
#Theorie(show-heading: false)[

    Falls ihr mal mehr Informationen braucht oder euch in irgendwas viel tiefer einlesen müsst, dann sind die Manpages euer bester freund. `man` ist kurz für Manual, und das ist auch der Character dieses Befehls. 
    
    Wir schauen uns das am Beispiel von `cp` an, wie so eine _Manpage_ aufgabaut ist und wie man sie am besten liest.]

#Praxis()[


+ Öffnet eine Konsole und gebt `man cp` ein.

Die man page besteht aus mehreren _Sections_. Welche sections genau es
gibt, hängt von der man page ab, aber meistens gibt es mindestens die folgenden
sections:






#description(format: it => raw(it))[
/ NAME:
        Gibt euch den Namen des Befehls und eine Einzeilige Beschreibung an

    
/ SYNOPSIS:      Gibt euch die generelle Benutzung des Befehls an. In diesem Fall gibt
     es drei mögliche Formen. Allen gemein ist, dass man zunächst
     \texttt{cp} eingibt, darauf folgen Optionen. Wie der Rest interpretiert
     wird, hängt dann vom Rest ab. Werden zwei weitere Parameter angegeben,
     wird der erste als Quelle, der zweite als Ziel interpretiert (erste
     Form). Werden mehr Parameter angegeben, wird das letzte als
     Verzeichnis, in das man alle anderen kopieren will interpretiert
     (zweite Form). In der dritten Form (wenn `-t` angegeben wird)
     wird hingegen der _erste_ Parameter als das Zielverzeichnis
     interpretiert, in das alle anderen Dateien kopiert wird.
       
       Es gibt eine Vielzahl von Konventionen für diesen Bereich, eckige
       Klammern bedeuten z.B. dass dieser Teil auch weggelassen werden darf,
       drei Punkte bedeuten, dass hier mehrere solche Dinge stehen können.
       
       Dieser Bereich ist der, der am Interessantesten für euch ist, wenn ihr
       „einfach schnell wissen wollt, wie es funktioniert“.

/ DESCRIPTION:   Hier wird ausführlicher beschrieben, was der Befehl tut. Hier werden
        auch alle möglichen Optionen beschrieben, die wir dem Befehl bei
        `[OPTION]` mitgeben können. Die wichtigen Informationen
        stehen meistens irgendwo in diesem Bereich.

/ AUTHOR, KNOWN BUGS, ...:             Hier stehen weitere Hintergrundinformationen, die meistens eher für
    Entwicklerinnen interessant sind.


/ SEE ALSO: 
         Auch eine wichtige section für euch: Wenn ihr die gewünschte
         Information nicht gefunden habt, oder ihr nicht den richtigen Befehl
         gefunden habt, stehen hier manchmal verwandte Befehle oder Quellen
         weiterer Informationen.
      
      
          Man pages sind häufig sehr umfangreich und enthalten viel mehr Informationen,
          als ihr euch gerade wünscht. Es ist nicht immer einfach, die gerade relevanten
          Informationen heraus zu filtern und es gibt nichts frustrierenderes, als einen
          Befehl gerade dringend zu brauchen, aber nicht zu kennen und sich erst durch
          eine lange man page lesen zu müssen.
      
          Dennoch ist es eine sehr hilfreiche Fähigkeit, zu wissen, wie man man pages
          liest und sich einfach in einem ruhigen Moment mal durch die ein oder andere
          man page durch zu lesen. Häufig lernt man dabei neue Dinge, manchmal macht es
          einem das Leben irgendwann sehr viel leichter, sie zu wissen.
      
          Habt von daher Geduld, wenn euch eine wirsche Linux-Expertin auf die Frage, wie
          ihr unter Linux euren Laptop in den Ruhemodus versetzt ein schnelles „man
          pm-suspend“ antwortet. Mit ein bisschen Übung wird euch das tatsächlich
        hinreichend schnell zur richtigen Lösung verhelfen. 

]
Und wenn ihr mal wirklich keine Zeit habt, die ganze page zu lesen, könnt ihr mit `/` auch nach Begriffen innerhalb der page suchen: Zum Beispiel `/close`
]
=== Praxis
+ Öffnet die man page von `ls`. Findet die Optionen fürs Lange
                              Listenformat (long listing format), zum Sortieren nach Dateigröße
                              und um auch versteckte Dateien (unter Linux sind das alle, die mit
  `.` anfangen) anzuzeigen und probiert sie aus.
+ Was ist der Unterschied zwischen `ls -a` und `ls -A`?
      Probiert beides aus. Das ist auf den ersten Blick nicht so leicht zu sehen
                        Fragt uns im einfach wenn ihr es nicht findest.

=== Spiel
-  Wie über so gut wie jeden Befehl gibt es auch über `man` eine
              manpage. Schaut euch mal `man` an.
- Es gibt nicht nur für Shell Befehle man pages. So findet ihr zum Beispiel allerlei nützliche informationen in hinteren Kapiteln. `man 7 path_resolution` zum beispiel erklärt nochmal im Detail wie man von einem Pfad zu einer Datei kommt.
//TODO: Es gibt vielleicht einen besseren Weg die Quizzes zu gestalten (eventuell mit lösungen oder so)
// Rotierter Text unten drunter oder am Besten am ende von der Lektion oder dem ganzen Buch



#Quiz(answer: "wie man einen Befehl verwendet")[
Was findet man alles in einer Manpage?
+ nützliche Informationen
+ viel Text
+ wie man einen Befehl verwendet
+ warum der Befehl erfunden wurde
]

