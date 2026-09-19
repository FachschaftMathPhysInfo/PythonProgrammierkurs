#import "../lib/helpers.typ": *



== Shell Befehle

In dieser Lektion wollen wir uns einige weitere wichtige Anschauen. Das gibt es so einige, schnall dich also an.



#Theorie(title_sup: "Anatomie eines Befehls")[
    Ein Shell Command ist immer gleich aufgebaut:
    / Der Eigentliche Command: Das erste Wort das du eingibst ist der Command.
    / Argumete: Alles nach dem Command sind Argumente. Sie werden untereinander durch Leerzeichen getrennt. Geben an auf was der Befehl operieren soll.
    / Flaggen: Auch das sind Argumente, sind aber meistens optional und beeinflussen das Verhalten des Commands. Flags beginnen immer mit einem `-`, wenn sie nur aus einem Buchstaben bestehen, oder `--` wenn sie länger sind.

    Damit wir uns Sinvoll unterhalten können brauchen wir noch etwas Notation.
    - Argumente kennzeichnen wir mit `[]`.
    // - Falls wir optional weiter Argumente angeben können schreiben wir `[]...`
    
]




=== The essentials
// touch, mkdir, rm, cp, mv, cat

Die folgenden Befehle sind sehr essentiell. Falls du irgendwann mal komplett auf das Terminal umsteigst wirst du sie täglich nutzen.
==== touch
`touch [Datei]` erstellt eine neue, leere Datei.


==== mkdir
`mkdir [Verzeichnis]` Erstellt ein neues Verzeichnis, falls es schon existiert meckert er.



==== cp

`cp` steht für Copy und ist ein tick komplizierer. In der einfachsten Version nutzen wir es so

```bash
cp [Quelldatei] [Zieldatei]
```
Und copiert den Inhalt von `Quelldatei` nach `Zieldatei`. `Zieldatei` muss dabei noch gar nicht existieren.

Alternativ können wir anstatt einer Zieldatei auch ein Verzeichnis angeben. In diesem Fall hat die Neue Datei den gleichen Namen wie die alte und wir können sogar mehrere Dateien gleichzeitig kopieren, der Befehl sieht dann also so aus:
```bash
cp [Quelldatei1] [Quelldatei2] [Quelldatei3] ...  [Zielverzeichniss]
```

#Spiel[ //Eine Ordnerstruktur erstellen, rausfinden warum man -r braucht

    + Erstell einen Ordner Namens `Mein_Verzeichniss`
    + Erstell in diesem Ordner die Dateien `datei1`, `datei2` und `datei3`
    + Erstell einen Ordner `Mein_Verzeichniss2` im Ordner `Mein_Verzeichniss`
    + Kopier `datei` in `Mein_Verzeichniss2`
    + Kopier `Mein_Verzeichniss` nach `Mein_Verzeichniss3`


    Das letzte hat nicht funktioniert. `cp` funktioniert standartmäßig nicht mit ganzen Verzeichnissen. Dafür brauchen wir unsere erste Flag, `-r`, was für rekursiv steht. Probiere es mal mit der Flag.
]



==== mv

`mv` (move) verhält sich fast identisch zu `cp` mit einem kleinen aber feinen Unterschied. Die Ursprüngliche Datei wird gelöscht. Damit haben wir ein tolles Tool um Dinge umzubennen.


==== rm
Zum schluss wollen wir Dateien und Verzeichnisse auch löschen wollen. Das geht mit `rm` (remove). *Warnung:* Es gibt hier keinen Papierkorb. Wenn du etwas löschst dann ist es wirklich weg. Genauso wie bei `cp` brauchen wir `-r` für Verzeichnisse.


==== cat
Bevor wir dateien Löschen wollen wäre es vielleicht sinvoll rauszufinden, ob da noch was wichtiges drinn steht. Dafür gibt es den `cat` Befehl. Diese Druckt einfach den Inhalt einer Datei in das Terminal. Der Name kommt von `concatenate`, was zusammenfügen bedeutet und ist ein Hinweis darauf, dass man damit auch Dateien auch zusammenfügen kann. Das macht aber (fast) niemand damit.


#Spiel[
    Was steht eigentlich in den Dateien drin die du vorhin gefunden hast? Macht es einen Unterschied ob die Datein in `.txt` oder `.py` endet? Was passiert wenn du `cat` auf dieser PDF ausführst? Oder auf dem `png`? //TODO: Secret Image einfügen, z.b. XKCD oder Fachschaftler
]



=== Etwas komplizertere
Der nächste Befehl ist etwas komplizierter, dafür aber umso mächtiger.


==== grep

Oft interessiert uns nur ein kleiner Teil einer Datei, vielleicht ist sie eine Liste und wir wollen nur einen eintrag Wissen, oder wir wollen erfahren wie oft etwas in einem Text genannt wird. Dafür gibt es den `grep` Befehl. Er nimmt mind. zwei Argumente, als erstes ein Muster, nach dem Gesucht werden soll, und dann Dateien, in denen Gesucht werden soll. Für unsere Zwecke reicht es aus, wenn wir als Muster einfach ein (Teil eines) Wortes nehmen. Das ganze sieht man an einem Beispiel am Besten.


```bash
grep "Passswort: " meine_datei
```

gibt alle Zeilen der Datei aus, in denen "Passswort: " vorkommt.

`grep` hat sehr viele nützliche Flaggen. Hier mal eine kleine Auswahl, damit du dich von der mächtigkeit dieses tool überzeugen lassen kannst.

- `-c` Gibt nur die Anzahl an gefundenen Zeilen aus
- `-n` Gibt zusätzlich noch die Zeilennummer des Treffers aus
- `-i` Ignoriere Groß und Kleinschreibung
- `-A, -B, -C` Gebe zusätzlich auch Zeilen die danach (`-A`), davor (-B) oder drum herum (`-C`) sind. Diese Flaggen unterscheiden sich von anderen, da diese selber ein Argument benötigen, nämlich wie viele extra Zeilen ausgegeben werden sollen. Argumente von Flaggen kommen immer direkt nach diesen.

In diesem Beispiel suchen wir erneut nach "Passwort: ", geben jetzt aber zu jedem Treffer zusätzlich die zwei Zeilen davor und danach aus.


```bash
grep -C 2 "Passswort: " meine_datei 
```





#Spiel[
    Die folgenden Befehle sind auch recht nützlich aber auch recht selbst erklärend. Versuch mal selber herauszufinden was sie machen. *Tipp:* Um einen befehl abzubrechen, drück STRG+C.

```bash
which [Befehl] 
whoami
hostname
date
yes

```

]
