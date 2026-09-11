
#import "../lib/helpers.typ": *;
== Dateirechte

Von Linux hört man immer dass es einem viel mehr freiheiten gibt. Das stimmt. Wir können bereits mit den uns bekannten Mitteln viel über das System erfahren, was unter windows vielleicht nicht so einfach wäre

#Spiel[In der Datei `/etc/passwd` befindet sich eine Liste aller Nutzer dieses Systems. Diese ist auch öffentlich lesbar. Neugierig geworden?
    //TODO: Check the apple file (if it even exists, not trusting chat)
    Zusätzlich gibt es noch die datei `/etc/shadow`, bzw. auf Apple ist es `private/var/db/dslocal`. Diese enthält Informationen über die Passwörter der Nutzter. Wenn ihr jetzt aber neugirig seid, müssen wir euch leider enttäuschen. Ihr könnt diese Datei nicht lesen, eurem Nutzer fehlen (hoffentlich) die Rechte dazu. Das alles war die Überleitung zum nächsten Thema.

]


#Theorie()[

Unter Windows seid ihr es wahrscheinlich gewohnt, dass der Dateiname festlegt,
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

Ihr könnt euch die Besitzerin, die Gruppe, und die permission bits einer Datei
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

+   Nummer an hardlinks (das braucht euch nicht sonderlich interessieren)
+   Nutzername der Eigentümerin
+   Gruppe, der die Datei gehört
+   Dateigröße
+   Datum der letzten Änderung
+   Dateiname


Wenn ihr die Berechtigungen von Dateien ändern wollt, könnt ihr dazu
`chmod` benutzen (wenn ihr wissen wollt, wie man es benutzt: `man
    chmod`), dazu muss sie euch aber gehören. Wenn ihr die Eigentümerin einer Datei
ändern wollt, könnt ihr dazu `chown` nutzen -- dazu müsst ihr aus
    Sicherheitsgründen allerdings Administratorin sein. Für Gruppen gibt es den äquivalenten Befehl `chgrp`.
]

#Praxis()[
    + Erstellt eine Neue Datei mit `touch`. Welche rechte habt ihr auf ihr?
    + Welche Rechte habt ihr auf den Shell commands?
    + Welche Rechte habt ihr denn auf der datei `/etc/shadow` (oder dem Apple Äquivalent)?
  
]

#Spiel()[


+  Versucht, `/etc/shadow` in einem Editor zu öffnen.
+  Legt (z.B. mit dem Texteditor) eine Datei (Es geht nicht um
    Kompilierung, also muss das keine `.cpp`-Datei sein. Gebt der
    Datei am Besten die Erweiterung `.txt`) in Eurem Homeverzeichnis
    an und macht sie dann mit `chmod a+w` world-writable
    (`a+w` heißt „füge das Recht Schreibbarkeit für alle Nutzerinnen
    hinzu“).  Lasst eure Sitznachbarin die Datei an ihrem Rechner öffnen
    (ihr könnt mittels `pwd` herausfinden, in welchem Ordner sie
    suchen muss) und euch eine Nachricht hinein schreiben. Schaut nach
    (indem ihr die Datei neu öffnet) ob ihr die Nachricht lesen könnt.



]

#Quiz(answer: "a), c), d)")[
    Welche Bit's existieren?
    + readable für Gruppe
    + Rechte dürfen nicht geändert werden
    + executable für alle Nutzerinnen
    + writable für Eigentümerin    

]
