#import "../lib/helpers.typ": *

== Der Kontrollfluss

In dieser Lektion lernen wir, wie unser Programm unterschiedliche dinge machen kann, je nachdem weile eingabe wir eingeben.


#Theorie[Jedes Programm hat einen sogenanten Kontrollfluss. Das ist die Reihenfolge in der Anweisungen abgeabreitet werden. Standardmäßig werden die Anweisungen von oben nach unten abgearbeitet. Es ist aber auch möglich, Anweisungen nur auszuführen, wenn wir bestimmte Voraussetzungen erfüllen. Das ganze nennen wir Verzweigung. Als erstes brauchen wir noch etwas Theorie:



    ==== Warheitswerte
    Warheitswerte geben an, ob etwas Wahr ist oder nicht. Das heißt sie nehmen entweder den wert ```python True```, wahr,  oder ```python False```, falsch, an. Variablen, die einen Wahrheitswert annehmen, nennen wir auch _Boolsche Variablen_

    ==== Boolsche Ausdrücke
    Ein Boolscher Ausdruck ist ein Ausdruck, der einen Wahrheitswert produziert. Das sieht man am besten an ein Paar Beispielen:
    - ```python print(1 < 2)```
    - ```python print(1 <= 1)```
    - ```python print(1 != 2)```
    - ```python print(1 == 2)```
    Ähnlich wie bei der Arithmetik können wir einfach die Vergleichsymbole aus der Schule nutzen um Zahlen zu vergleichen. Der Ausdruch "ist 1 kleiner als 2" kann in der Theorie zwei Werte annahmen, Ja, 1 ist kleiner 2, oder falsch, 1 ist nicht kleiner als 2 (wir wissen alle das nur eine der beiden Aussagen zutriff). Die Nützlichkeit davon steigt imens, wenn wir variablen miteinander vergleichen.

    Leider ist das ```python = ``` schon belegt, deswegen verwenden wir für Gleichheit einfach zwei.
    //TODO: Verneinung

    ==== Die if-verzweigung
    Wir können nun Optionale Anweisungen in unser Programm einbauen, indem wir sagen, dass sie nur ausgeführt werden sollen, wenn ein boolscher Ausdruck stimmt. Das ganze sieht so aus:

    #Code("08_kontrollfluss/if_example.py")

    Das ganze liest sich sehr gut: Falls (```python if ```) dieser Ausdruck gilt, dann machen folgendes. Damit python auch weiss was alles zu folgendem gehört, _rücken wir das ein_. Das heißt einfach vier Leerzeichen oder einmal Tab.



    
   
]


#Spiel[Erinnern wir uns zurück an die Mitternachtsformel. Manchmal kommt es vor, dass es nur eine Lösung gibt. Erweitert das Programm, so das in diesem Fall eine kleine Meldung kommt.]



=== Das Else
Oft haben wir den fall dass wir auch etwas tuen wollen wenn eine Kondition nicht gilt. Also wenn ja, mach dies, sonst, mach das. Dafür gibt es das sogenante Else, und das sieht so aus.

#Code("08_kontrollfluss/if_else_example.py")

Beachtet das das ```python else``` auf der selben Tiefe wie das if steht, zu dem es gehört. Sonst denkt python dass das ```python else``` eine Anweisung ist, die nur ausgeführt werden soll wenn die Voraussetzung wahr ist.


#Praxis[
    Das Einrücken passiert Relativ. Das heißt dass wenn wir eine verzweigung in einer Verzweigung haben, weil natürlich geht das, haben wir eine doppelte Einrückung
=======
  === Warum die Leerzeichen zählen

  In vielen Programmiersprachen markiert man zusammengehörige Anweisungen mit geschweiften Klammern `{ ... }`. Die Einrückung ist dort nur Kosmetik für das menschliche Auge. Python geht einen anderen Weg: Hier *ist die Einrückung die Syntax*. Es gibt keine Klammern um Blöcke , stattdessen entscheidet allein die Position am Zeilenanfang, was zu einem Block gehört und was nicht.

  Das ist zunächst ungewohnt, aber die Idee dahinter ist angenehm: Code, der ordentlich eingerückt ist, *sieht* so aus, wie er *funktioniert*. Es gibt keine zwei Wahrheiten mehr , kein „sieht eingerückt aus, ist aber nicht drin“.

  *Analogie:* Denk an eine Gliederung mit Unterpunkten. Was unter einer Überschrift eingerückt steht, gehört zu ihr. Rückt ein Punkt wieder nach links aus, beginnt ein neuer, übergeordneter Abschnitt.

  Betrachte den Unterschied:

  ```python
  if alter >= 18:
      print("Du bist volljaehrig.")
      print("Du darfst waehlen.")
  print("Programmende.")
  ```

  Die ersten beiden `print`-Zeilen sind eingerückt , sie gehören zum `if` und werden nur bei `alter >= 18` ausgeführt. Die dritte Zeile steht wieder am linken Rand, *außerhalb* des `if`, und läuft deshalb immer.

  Verschiebt man nun die zweite Zeile an den Rand:

  ```python
  if alter >= 18:
      print("Du bist volljaehrig.")
  print("Du darfst waehlen.")
  ```

  … dann gehört `"Du darfst waehlen."` nicht mehr zum `if`. Jetzt bekommt auch eine 12-Jährige die Wahlberechtigung bescheinigt. Das Programm ist weiterhin gültig , es tut nur etwas anderes.

  *Die Regeln in Kurzform:*

  - Pro Einrückungsstufe verwendet man üblicherweise *vier Leerzeichen*.
  - Alle Zeilen eines Blocks müssen *gleich weit* eingerückt sein.
  - *Mische niemals Leerzeichen und Tabulatoren.* Für das Auge sehen beide gleich aus, für Python sind es verschiedene Zeichen. Die meisten Editoren (auch VSCode) wandeln einen Tastendruck auf `Tab` automatisch in Leerzeichen um , lass diese Einstellung an.
]

#Code("08_kontrollfluss/einrueckung_wichtig.py")
