#import "lib/template.typ": conf
#import "lib/stringformat.typ": stringstyle
#import "lib/helpers.typ": Quiz_answers_table, Code
#import "@preview/zebraw:0.6.3": *

 #set document(author: "Xenia Herr", description: "Python Programmierkurs der Fachschaft MathPhysInfo " )
#let title = "Programmiervorkurs"
#let subtitle = "Fachschaft MathPhysInfo" 

#show: conf
#show: zebraw
#show: stringstyle 



//TITLEPAGE
#[
    #set align(center)
    #image("Assets/SadEmoji.jpg")  //TODO: Platzhalter entfernen
    
//#set align(center)
    #text(size: 36pt, weight: "bold")[#title]

#v(2cm)

    #text(size: 24pt, style: "italic")[#subtitle]
    #v(1fr)
    #datetime.today().display("[month repr:long] [day], [year]")
]

#pagebreak()

#include "vorwort.typ"


= Intro

#include "Lektionen/vorbereitung.typ"

=  Unix artige Betriebssysteme


#include "Lektionen/shell.typ"


#include "Lektionen/manpages.typ"

#include "Lektionen/rechte.typ"

== NixOs Package management



== Tiling Window Manager


=  Python

#include "Lektionen/helloworld.typ"

#include "Lektionen/variablen_aritmetik.typ"

== Numpy



