#import "../lib/helpers.typ": *

== Die Shell



#dev[
    - Hier muss etwas tiefer angefangen werden, z.b mit was ist das Terminal. Darf dann auch gerne etwas größer werden.
]

#Theorie(show-heading: false )[
Wenn ihr bisher nur mit Windows oder Mac gearbeitet habt, habt ihr
wahrscheinlich in der letzten Lektion nebenbei etwas neues Kennen gelernt: Die
Shell.

Auch wenn sich unter Linux zunehmend Desktopumgebungen, wie man sie von
kommerziellen Betriebssystemen kennt verbreiten, bleibt die Shell immer noch das
Mittel der Wahl, wenn man sich mit dem System auseinander setzen, oder auch
allgemein arbeiten will. Wir erachten zumindest die Shell als wichtig genug, um
euch direkt zu Beginn damit zu konfrontieren.

Wann immer ihr über die Anwendungen ein Terminal startet, wird dort drin
automatisch auch eine Shell gestartet. Die beiden Konzepte sind tatsächlich so
eng miteinander verknüpft, dass ihr euch um die Unterschiede erst einmal keine
Gedanken machen müsst - wann immer ihr Shell oder Terminal hört, denkt einfach
an das schwarze Fenster mit dem Text. Das ist auch das wesentliche Merkmal der
Shell, sie ist ein Textbasiertes interface zu eurem Computer. Ihr gebt Befehle
ein, sie gibt euch Text zurück und auf diese Weise könnt ihr eigentlich alles
machen, was ihr sonst gewohnterweise mit der Maus und grafischen Oberflächen
tun würdet.

Wenn die Shell auf eure Befehle wartet, zeigt sie euch den so genannten
_Prompt_ an. Er enthält unter anderem euren Nutzernamen und das aktuelle
Verzeichnis (#sym.tilde steht dabei für euer Nutzerverzeichnis, ein spezieller
Ordner, der eurem Account zugeordnet ist und in dem ihr alle Rechte besitzt,
dieser wird auch _home_ genannt).

Wenn ihr in ein anderes Verzeichnis wechseln wollt, könnt ihr das (wie ihr
bereits in der ersten Lektion gelernt habt) mit dem Befehl `cd` tun,
gefolgt von dem Namen des Verzeichnis. Um zurück zu gehen, könnt ihr das
spezielle Verzeichnis `..` (also zwei Punkte) angeben, welches für das
nächst höher liegende Verzeichnis steht. Wenn ihr euch den Inhalt des
Verzeichnisses anschauen wollt, könnt ihr dafür den Befehl `ls`
benutzen. Um herauszufinden, in welchem Verzeichnis ihr euch befindet, könnt
nihr  `pwd` nutzen, zum Kompilieren von \Cpp-Programmen habt ihr den Befehl
`g++` kennengelernt. Solltet ihr Hilfe zu irgendeinem Befehl benötigen,
könnt ihr den Befehl `man` (für „Manual“) geben, gefolgt von dem Befehl,
zu dem ihr Hilfe braucht (über `man` werden wir später noch
ausführlicher reden).
]

#pagebreak()
#Praxis()[

+ Öffnet ein Terminal und gebt die folgenden Befehle ein
+ [Insert file]
]
#Spiel()[

+ Versucht selbst durch euer Nutzerverzeichnis (_home_) zu navigieren.
              Wie viele Lektionen hat der Vorkurs in diesem Verzeichnis?
    + Was passiert, wenn ihr euer Homeverzeichnis verlasst (`cd ..`
      während ihr darin seid)?
    + Versucht in der manpage von ls (`man ls`)  zu stöbern und die
      verschiedenen Parameter, mit denen ihr das Verhalten steuern könnt zu
      erforschen. Findet ihr heraus, wie ihr den Verzeichnisinhalt in einem
      langen Listenformat (long listing format) anzeigen lassen könnt (in dem
      unter anderem auch die Dateigröße zu jeder Datei steht). 
      Hinweis: mit `/Suchbegriff` kann innerhalb von `man` gesucht werden.
+ Um schnell mit der Shell zu arbeiten gibt es einige Tricks. 

  Damit lange Dateinamen nicht immer komplett eingegeben werden müssen, gibt es die sogenannte `tap completion`. 
        Um bereits eingegebene Befehle nochmals auszuführen die `history`. Finde heraus wie diese funktionieren!
]


Falls euch das alles verwirrt, fragt entweder direkt nach oder wartet auf
Lektion 6, da geht es zu Manpages noch mal ins Detail.

Ihr findet unter #link("https://blog.ezelo.de/basic-linux-befehle/") auch noch mal
die wichtigsten Befehle zusammengefasst.


#Quiz(answer: "Ihr bleibt im gleichen Verzeichnis")[
    Was passiert wenn ihr `cd . ` ausführt?
    + Ihr geht in ein zufälliges Unterverzeichnis
    + Ihr bleibt im gleichen Verzeichnis
    + Ihr verlasst euer aktuelles Verzeichnis
    + Ihr geht direkt in euer Homeverzeichnis

]


