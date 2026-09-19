
#import "../lib/helpers.typ": *;
== Dateirechte

Von Linux hört man immer dass es einem viel mehr freiheiten gibt. Das stimmt. Wir können bereits mit den uns bekannten Mitteln viel über das System erfahren, was unter windows vielleicht nicht so einfach wäre

#Spiel[In der Datei `/etc/passwd` befindet sich eine Liste aller Nutzerinnen dieses Systems. Diese ist auch öffentlich lesbar. Neugierig geworden?
    //TODO: Check the apple file (if it even exists, not trusting chat)
    Zusätzlich gibt es noch die Datei `/etc/shadow`, bzw. auf Apple ist es `var/db/dslocal/nodes/Default/users`. Diese enthält Informationen über die Passwörter der Nutzerinnen. Wenn du jetzt aber neugierig bist, müssen wir dich leider enttäuschen. Du kannst diese Datei nicht lesen, deiner Nutzerin fehlen (hoffentlich) die Rechte dazu. Das alles war die Überleitung zum nächsten Thema.

]


#Theorie()[

Unter Windows bist du es wahrscheinlich gewohnt, dass der Dateiname festlegt,
wie mit der Datei umgegangen wird -- eine `.doc` wird in Word geöffnet,
eine `.zip` in einem installierten Packprogramm, eine `.bmp`
vermutlich in Windows Paint und eine `.exe` wird ausgeführt.

Das Konzept der Dateierweiterung hat es auch in die Linuxwelt geschafft, ist
hier aber deutlich weniger wichtig. Insbesondere gibt es keine Dateierweiterung
`.exe`. Stattdessen hat jede Datei einen bestimmten Modus. Eine Datei
kann ausführbar sein, oder nicht. Sie kann lesbar sein, oder nicht. Sie kann
schreibbar sein, oder nicht. Nicht nur das, jede Datei gehört auch einer
bestimmten Nutzerin und einer bestimmten Nutzerinnengruppe und Ausführbarkeit,
Lesbarkeit oder Schreibbarkeit ist getrennt eingestellt für die Besitzerin der
Datei, der Gruppe, der die Datei gehört und für alle anderen. Eine Datei kann
also z.B. lesbar sein, für alle Nutzerinnen, aber nur eine bestimmte Gruppe von
Nutzerinnen darf sie ausführen und nur eine einzige Nutzerin sie bearbeiten. All
dies wird in neun so genannten *Permission bits* festgehalten (ein
*Bit* ist die kleinste Einheit an Information, es kodiert genau „ja“ und
„nein“, oder „null“ und „eins“, oder „ein“ und „aus“).

Du kannst dir die Besitzerin, die Gruppe, und die permission bits einer Datei
mithilfe von `ls -l` anschauen. Der output von `ls -l` ist in
mehreren Spalten angeordnet:

+ In der ersten Spalte stehen die Dateiberechtigungen in Form eines 10
          Zeichen langen Strings. Jedes Zeichen steht dabei für ein permission
          bit kann dabei entweder ein `-`, oder ein Buchstabe sein, wobei
          `-` bedeutet, dass das entsprechende Bit nicht gesetzt ist. Die
          Bits bedeuten (von links nach rechts gelesen)

    -  #underline(`d`)`irectory`
    -  #underline(`r`)`eadable` für die Eigentümerin
    -  #underline(`w`)`ritable` für die Eigentümerin
    -  #underline(`x`)`ecutable` für die Eigentümerin
    -  #underline(`r`)`eadable` für die Gruppe
    -  #underline(`w`)`ritable` für die Gruppe
    -  #underline(`x`)`ecutable` für die Gruppe
    -  #underline(`r`)`eadable` für alle Nutzerinnen
    -  #underline(`w`)`ritable` für alle Nutzerinnen
    -  #underline(`x`)`ecutable` für alle Nutzerinnen

+   Nummer an hardlinks (das braucht dich nicht sonderlich interessieren)
+   Nutzername der Eigentümerin
+   Gruppe, der die Datei gehört
+   Dateigröße
+   Datum der letzten Änderung
+   Dateiname


Wenn du die Berechtigungen von Dateien ändern willst, kannst du dazu
`chmod` benutzen (wenn du wissen willst, wie man es benutzt: `man
    chmod`), dazu muss sie dir aber gehören. Wenn du die Eigentümerin einer Datei
ändern willst, kannst du dazu `chown` nutzen -- dazu musst du aus
    Sicherheitsgründen allerdings Administratorin sein. Für Gruppen gibt es den äquivalenten Befehl `chgrp`.
]

#Praxis()[
    + Erstelle eine Neue Datei mit `touch`. Welche Rechte hast du auf ihr?
    + Welche Rechte hast du auf den Shell commands?
    + Welche Rechte hast du denn auf der datei `/etc/shadow` (oder dem Apple Äquivalent)?

]

#Spiel()[


+  Versuche, `/etc/shadow` in einem Editor zu öffnen.
+  Lege (z.B. mit dem Texteditor) eine Datei (Es geht nicht um
    Kompilierung, also muss das keine `.cpp`-Datei sein. Gib der
    Datei am Besten die Erweiterung `.txt`) in deinem Homeverzeichnis
    an und mache sie dann mit `chmod a+w` world-writable
    (`a+w` heißt „füge das Recht Schreibbarkeit für alle Nutzerinnen
    hinzu“).  Lass deine Sitznachbarin die Datei an ihrem Rechner öffnen
    (du kannst mittels `pwd` herausfinden, in welchem Ordner sie
    suchen muss) und dir eine Nachricht hinein schreiben. Schau nach
    (indem du die Datei neu öffnest) ob du die Nachricht lesen kannst.



]

#Quiz(answer: "a), c), d)")[
    Welche Bit's existieren?
    + readable für Gruppe
    + Rechte dürfen nicht geändert werden
    + executable für alle Nutzerinnen
    + writable für Eigentümerin    

]
