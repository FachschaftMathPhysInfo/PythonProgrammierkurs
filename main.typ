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

// Anatomie eines Shell befehls. Hilfe zur selbsthilge
// Shell crashkurs, cp, ls, mv, find, grep, whoami,...


#include "Lektionen/rechte.typ" // Erweitern auf chown chgrp












=  Python


// Hello World + erweitert mit einlesen

// Variablen und Arithmetik

// Kontrollfluss

// Schleifen

// Funktionen

// das Python repl

// list

// stl, Multifile programs

// Abschlussprojekt


#let codesnippet(path, name) = {
    [#set align(center)
        #text(gray, style: "italic")[
            #name]]
    
    rect(stroke: gray, width: 100%)[
        #raw(lang: "Python", read(path), block: true)]
}


//#zebraw(raw(lang: "Python", code, block: true))


#Code("helloworld.py")



