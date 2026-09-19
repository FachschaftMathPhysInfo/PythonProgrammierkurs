#import "../lib/helpers.typ": *


== Variablen und Arithmetik

In diese Lektion lernen wir, was Variablen sind rechnen ein bisschen.



=== Variablen

#Theorie[
    Den Begriff _Variable_ kennst du vermutlich schon aus der Mathematik. Zum Beispiel haben wir funktionen so geschrieben
    $ f(x) = x^2 + 1 $
    Hier ist $x$ eine Variable.

    Variablen in der Informatik verhalten sich änlich. Sie stellen das "Gedächtnis" des Programms dar. Eine Variable ist ein stück Speicher, dem wir einen Namen geben. Wir können dann Werte in einer Variable speichern und später wieder verwenden. Machen wir das mal an unserem Hello World beispiel.
    #Code("07_variablen_arithmetik/helloworld_variables.py")
    Was genau passiert hier?
    - ```python text = "Hello World"```: Das hier nennt sich Variablenzuweisung. Wir weisen der Variable `text` den Wert `"Hello World"` zu.
    - ```python print(text)```: Hier verwenden wir die Variable. Beachte, dass wir keine Anführungszeichen verwenden. Das sagt python, dass wir nicht den Wert `text`, sondern eine Variable meinen. Python ersetz dann `text` durch den Wert, den wir vorhin gespeichert haben.
    
]

#Spiel[
    Das Programm, das du in der letzten Lektion am Ende geschrieben hast, war schon sehr unübersichtlich. Schreib das mal neu und verwende Variablen. //TODO: Wissen sie das input einen wert zurückgibt? Meiner Meinung nach sollten sie den Transfer hinbekommen. Zu not sollen sie nachfragen.
]


#Praxis[
    Variablen in der Informatik haben eine Eigenschaft die deren Geschwister aus der Mathe oft nicht haben. Wir können sie wiederverwenden. Betrachte zum Beispiel folgendes Programm.

    #Code("07_variablen_arithmetik/reuse_variables.py")
]


=== Etwas Quality of Life: Der Formatstring
Wir haben jetzt zwei verschiedene Arten von Argumenten für `print` kennengelernt. Einmal die in Anführugnszeichen, die übrigens _Strings_ (auf Deutsch Zeichenkette) heißen, falls wir den genauen wortlaut ausgeben wollen,und einmal ohne, falls wir eine Variable benutzen wollen. Es gibt aber auch eine möglichkeit diese beiden zu kombinieren, der sogenannte _formatstring_.

```python
variable=42
print(f"Die Antwort auf alles ist {variable}")
```

Ein _formatstring_ ist ebenfalls ein String, aber wir schreiben `f`, wie _format_ davor. Das erlaubt es uns Variablen zu nutzen, indem wir sie in geschweifte Klammern packen.



=== Arithmetik

Natürlich kann python auch Mathe. Zumindest rechnen kann python ganz ordentlich. Da es ganz umstäntlich wäre, Arithmetik wie in und output über Befehle zu machen, können wir hierfür einfach symbole benutzen



#Theorie[
    Um Arithmetik zu betreiben brauchen wir erstmal Zahlen. Zum Glück ist das ganz einfach. Wir schreiben die Zahlen einfach direkt in das Programm. Einzige besonderheit: Wir verwenden bei Kommazahlen einen Punkt, wie man es im Englischen auch macht.

]

#Praxis[ Die folgenden Zeilen stellen die Arithmetik in Python vor. Überprüfe mal, ob das so alles Sinn ergibt:

    - ```python print(1 + 1)```
    - ```python print(42 - 2)```
    - ```python print(3 * 3)```
    - ```python print(64 / 3)```
    - ```python print(12 - 4 * 4 )```

Wie wir sehen kennt Python die uns bekannte Reihenfolge der Operatoren nicht. Das heißt wir müssen mit klammern nachhelfen. 
]


#Spiel[
    Neben den uns bekannten Symbolen gibt es noch ein paar weitere, die wir so nicht direkt kennen.
    Das sind
    - ```python **```
    - ```python //```
    - ```python %```
    Deine Aufgabe ist herauszufinden, was diese machen. *Ein kleiner Tipp:* Der Letzte Operator macht nur bei ganzen Zahlen Sinn.
    
    
]

#Spiel[ Jetzt kombinieren wir mal alles was wir in diese Lektion gelernt haben.

    Schreib ein Programm, das die Mitternachtsformel
    $ x_(1,2) = (-b plus.minus sqrt(b^2 - 4a c))/(2a) $

    berechnet.
    Das Programm soll die Nutzerin nach $a,b$ und $c$ fragen und $x_1$ und $x_2$ ausgeben.

]



//TODO: Quizz fehlt (brauchen überhaupt eins, so generell??)
