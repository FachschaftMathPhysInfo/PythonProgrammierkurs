#import "../lib/helpers.typ": *

== Der Kontrollfluss

In dieser Lektion lernen wir, wie unser Programm unterschiedliche Dinge machen kann, jenachdem welche Eingabe wir tätigen.


#Theorie[Jedes Programm hat einen sogenanten Kontrollfluss. Das ist die Reihenfolge in der Anweisungen abgeabreitet werden. Standardmäßig werden die Anweisungen von oben nach unten abgearbeitet. Es ist aber auch möglich, Anweisungen nur auszuführen, wenn wir bestimmte Voraussetzungen erfüllen. Das ganze nennen wir Verzweigung. Als erstes brauchen wir noch etwas Theorie:



    ==== Warheitswerte
    Warheitswerte geben an, ob etwas Wahr ist oder nicht. Das heißt sie nehmen entweder den wert ```python True```, wahr,  oder ```python False```, falsch, an. Variablen, die einen Wahrheitswert annehmen, nennen wir auch _Boolsche Variablen_

    ==== Boolsche Ausdrücke
    Ein Boolscher Ausdruck ist ein Ausdruck, der einen Wahrheitswert produziert. Das sieht man am besten an ein paar Beispielen:
    - ```python print(1 < 2)```
    - ```python print(1 <= 1)```
    - ```python print(1 != 2)```
    - ```python print(1 == 2)```
    Ähnlich wie bei der Arithmetik können wir einfach die Vergleichsymbole aus der Schule nutzen um Zahlen zu vergleichen. Der Ausdruck "ist 1 kleiner als 2" kann in der Theorie zwei Werte annahmen, Ja, 1 ist kleiner 2, oder Nein, 1 ist nicht kleiner als 2 (wir wissen alle das nur eine der beiden Aussagen zutriff). Die Nützlichkeit davon steigt immens, wenn wir Variablen miteinander vergleichen.

    Leider ist das ```python =``` schon belegt, deswegen verwenden wir für Gleichheit einfach zwei.
    //TODO: Verneinung

    ==== Die if-Verzweigung
    Wir können nun optionale Anweisungen in unser Programm einbauen, indem wir sagen, dass sie nur ausgeführt werden sollen, wenn ein boolscher Ausdruck stimmt. Das ganze sieht so aus:

    #Code("08_kontrollfluss/if_example.py")

    Das ganze liest sich sehr gut: Falls (```python if```) dieser Ausdruck gilt, dann mache folgendes. Damit python auch weiss, was alles zu folgendem gehört, _rücken wir das ein_. Das heißt einfach vier Leerzeichen oder einmal Tab.



    
   
]

#Spiel[Erinnern wir uns zurück an die Mitternachtsformel. Manchmal kommt es vor, dass es nur eine Lösung gibt. Erweitere das Programm, sodass in diesem Fall eine kleine Meldung kommt.]


==== Das Else
Oft haben wir den Fall, dass wir auch etwas tun wollen, wenn eine Kondition nicht gilt. Also wenn ja, mach dies, sonst, mach das. Dafür gibt es das sogenante _else_, und das sieht so aus.

#Code("08_kontrollfluss/if_else_example.py")

Beachte, dass das ```python else``` auf der selben Tiefe wie das if steht, zu dem es gehört. Sonst denkt python, dass das ```python else``` eine Anweisung ist, die nur ausgeführt werden soll wenn die Voraussetzung wahr ist.




#Praxis[
    Das Einrücken passiert relativ. Das heißt, dass wenn wir eine Verzweigung in einer Verzweigung haben, weil natürlich geht das, haben wir eine doppelte Einrückung


    //TODO: Hier ein Beispiel welches verschachtelte If's verwendet. Die studis sollen dann rausfinden was genau da passiert. Maybe soll das Programm eine Eingabe von mehreren Werten verarbeiten und dinge printen und die sollen rausfinden was geprinted wird.
]
