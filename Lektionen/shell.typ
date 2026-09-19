// #import "../lib/helpers.typ": *

// #import "@preview/cetz:0.5.2"

// == Die Shell

// In dieser Lektion werden wir ein wichtiges Konzept kennenlernen, was uns diesen gesamten Kurs begleiten wird. Das Terminal und die Shell.


// === Das Terminal
// Das Terminal an sich ist erstmal nur ein Anwendung wie VSCode oder Firefox. Es zeigt standartmäßig nur reinen Text an, also erwartet keine Bilder. Und anstatt ins Internet zu gehen, erlaubt uns das Terminal eine _SHELL_ zu nutzen. Das ganze passiert indem wir Befehle in das Terminal schreiben. Schicken wir diese danach ab mit `Enter`, führt die Shell diese aus und schreibt das ergebniss ebenfalls in das Terminal.

// ==== Die Prompt
// Vor deinem Cursor stehen als immer ein paar Statusinfos, die sogenante Prompt. Bei dir ist das dein Nutzername `@` Name der Maschine und dann das Working Directory.


// ==== Das working Directory
// Das Terminal befindet sich immer in einem Ordner, dem sogenannten _Working Directory_. Das sind die selben Ordner (In Unix nennen wir Ordner _Directory_ ) die wir sehen wenn wir den Fileexploer öffnen. Alle Befehle die wir ausführen werden standartmäßig im Working Directory ausgeführt.

// Ein paar wichtige Fakten zu Dateipfaden:
// - `~` ist das Directory deines Benutzers. Fast alles was du machst findet in diesem Directory statt.
// - Pfade nutzen `/` zum Trennen. `mein/pfad/zur/datei.txt` bedeutet das die Datei `datei.txt` im Directory `zur` liegt, was wiederum im Directory `pfad` und das schließlich `mein` liegt.
// - `..` ist ein besonderes Directory. Es existiert in jedem Directory und stellt das Elter directory dar. In `zur` ist es `mein/pfad`, und in `pfad` ist es nur `mein`.
// - Wir unterscheiden zwischen relativen und absoluten Pfaden. Relative Pfade beginnen von aktuellen Directory, absolute Pfade von der sogenannten Wurzel `/`. Beginnt ein Pfad mit `/`, dann ist es immer ein absoluter Pfad. `~` zum Beispiel ist der absolute Pfad zu deinem Home Directory.


// #cetz.canvas({
//     import cetz.draw: *


//     set-style(line: ( stroke: (.2pt + black)))

//     content((0,0), "/", name: "root")
//     content((-1,-1), "home", name: "home")
//     content((-2,-2), "mathphys", name: "mathp")
//     content((-2, -3), "mein", name: "mein" )
//     content((-2, -4), "pfad", name: "pfad")
//     content((-2, -5), "zur", name: "zur")
//     content((-2, -6), "Datei.txt", name: "datei")

//     content((0, -4), "anderer", name: "anderer")
//     content((0, -5), "pfad", name: "pfad2")
//     content((0, -6), "zur", name: "zur2")
//     content((0, -7), "Datei.txt", name: "datei2")

//     content((0,-1), "lib", name: "lib")
//     content((1,-1), "usr", name: "usr")

//     line("root", "usr")
//     line("root", "lib")

//     line("root", "home")
//     line("home", "mathp")
//     line("mathp", "mein")
//     line("mein", "pfad")
//     line("mein", "anderer")
//     line("pfad", "zur")
//     line("zur", "datei")

//     line("anderer", "pfad2")
//     line("pfad2", "zur2")
//     line("zur2", "datei2")

// })

// === Was ist jetzt eine Shell

// === Naivigation

// Mit das wichtigste was wir in der Shell machen ist uns auf der Directorystruktur hin und herzubewegen. Das machen wir mit ein paar befehelen.

// ==== cd
// `cd` steht für _change directory_ und macht auch genau das was man erwartet. Wir geben `cd` den Namen eines Directorys und es wechselt in das.


// ```bash
// cd mydir # Wechsle in das Directory mydir
// ```

// Das Argument von cd ist ein _Pfad_. Lass uns damit mal etwas rumspielen.


// #Spiel[
//     + Öffne ein neues Terminal. Du solltest in `~` sein.
//     + Nutz `cd` mit dem Pfad `mein/weg/zur`, um zur Datei `Datei.txt` zu gelangen.
//     + Wie kommen wir zurück ins Home Directory?
//         + Was bedeutet `..` nochmal?
//         + Können wir absolute Pfade angeben?
//         + Was passiert wenn wir `cd` ohne Argument nutzen?

// ]



// ==== pwd
// Falls du dich mal völlig verloren hast, gibt es den Befehll `pwd`. Das steht für _path towards directory_ und gibt dir den Absoluten Pfad zum Working Directory.



// ==== ls
// Meistens hast du nicht den Luxus das du ein Diagram zu deiner Directorystruktur bekommst. Wie finde ich aber nun raus wo ich mit cd überall hinkomme? Dafür gibt es den `ls` Befehl. Das steht für 'list' und gibt an was alles in einem Directory ist. Man kann entweder ein pfad angeben, dann bekommt man alles was sich dort befindet, oder man gibt nichts an, dann bekommt man den Inhalt des working directories.









// #dev[
//     - Hier muss etwas tiefer angefangen werden, z.b mit was ist das Terminal. Darf dann auch gerne etwas größer werden.
// ]

// #Theorie(show-heading: false )[
// Wenn du bisher nur mit Windows oder Mac gearbeitet hast, hast du
// wahrscheinlich in der letzten Lektion nebenbei etwas neues Kennen gelernt: Die
// Shell.

// Auch wenn sich unter Linux zunehmend Desktopumgebungen, wie man sie von
// kommerziellen Betriebssystemen kennt verbreiten, bleibt die Shell immer noch das
// Mittel der Wahl, wenn man sich mit dem System auseinander setzen, oder auch
// allgemein arbeiten will. Wir erachten zumindest die Shell als wichtig genug, um
// dich direkt zu Beginn damit zu konfrontieren.

// Wann immer du über die Anwendungen ein Terminal startest, wird dort drin
// automatisch auch eine Shell gestartet. Die beiden Konzepte sind tatsächlich so
// eng miteinander verknüpft, dass du dir um die Unterschiede erst einmal keine
// Gedanken machen musst - wann immer du Shell oder Terminal hörst, denk einfach
// an das schwarze Fenster mit dem Text. Das ist auch das wesentliche Merkmal der
// Shell, sie ist ein Textbasiertes interface zu deinem Computer. Du gibst Befehle
// ein, sie gibt dir Text zurück und auf diese Weise kannst du eigentlich alles
// machen, was du sonst gewohnterweise mit der Maus und grafischen Oberflächen
// tun würdest.

// Wenn die Shell auf deine Befehle wartet, zeigt sie dir den so genannten
// _Prompt_ an. Er enthält unter anderem deinen Nutzernamen und das aktuelle
// Verzeichnis (#sym.tilde steht dabei für dein Nutzerverzeichnis, ein spezieller
// Ordner, der deinem Account zugeordnet ist und in dem du alle Rechte besitzt,
// dieser wird auch _home_ genannt).

// Wenn du in ein anderes Verzeichnis wechseln willst, kannst du das (wie du
// bereits in der ersten Lektion gelernt hast) mit dem Befehl `cd` tun,
// gefolgt von dem Namen des Verzeichnis. Um zurück zu gehen, kannst du das
// spezielle Verzeichnis `..` (also zwei Punkte) angeben, welches für das
// nächst höher liegende Verzeichnis steht. Wenn du dir den Inhalt des
// Verzeichnisses anschauen willst, kannst du dafür den Befehl `ls`
// benutzen. Um herauszufinden, in welchem Verzeichnis du dich befindest, kannst
// du `pwd` nutzen, zum Kompilieren von \Cpp-Programmen hast du den Befehl
// `g++` kennengelernt. Solltest du Hilfe zu irgendeinem Befehl benötigen,
// kannst du den Befehl `man` (für „Manual“) geben, gefolgt von dem Befehl,
// zu dem du Hilfe brauchst (über `man` werden wir später noch
// ausführlicher reden).
// ]

// #pagebreak()
// #Praxis()[

// + Öffne ein Terminal und gib die folgenden Befehle ein
// + [Insert file]
// ]
// #Spiel()[

// + Versuch selbst durch dein Nutzerverzeichnis (_home_) zu navigieren.
//               Wie viele Lektionen hat der Vorkurs in diesem Verzeichnis?
//     + Was passiert, wenn du dein Homeverzeichnis verlässt (`cd ..`
//       während du darin bist)?
//     + Versuch in der manpage von ls (`man ls`)  zu stöbern und die
//       verschiedenen Parameter, mit denen du das Verhalten steuern kannst zu
//       erforschen. Findest du heraus, wie du den Verzeichnisinhalt in einem
//       langen Listenformat (long listing format) anzeigen lassen kannst (in dem
//       unter anderem auch die Dateigröße zu jeder Datei steht).
//       Hinweis: mit `/Suchbegriff` kann innerhalb von `man` gesucht werden.
// + Um schnell mit der Shell zu arbeiten gibt es einige Tricks.

//   Damit lange Dateinamen nicht immer komplett eingegeben werden müssen, gibt es die sogenannte `tap completion`.
//         Um bereits eingegebene Befehle nochmals auszuführen die `history`. Finde heraus wie diese funktionieren!
// ]


// Falls dich das alles verwirrt, frag entweder direkt nach oder warte auf
// Lektion 6, da geht es zu Manpages noch mal ins Detail.

// Du findest unter #link("https://blog.ezelo.de/basic-linux-befehle/") auch noch mal
// die wichtigsten Befehle zusammengefasst.


// #Quiz(answer: "Du bleibst im gleichen Verzeichnis")[
//     Was passiert wenn du `cd . ` ausführst?
//     + Du gehst in ein zufälliges Unterverzeichnis
//     + Du bleibst im gleichen Verzeichnis
//     + Du verlässt dein aktuelles Verzeichnis
//     + Du gehst direkt in dein Homeverzeichnis

// ]


