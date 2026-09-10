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

#include "Lektionen/Terminal_Naviagation.typ"

#include "Lektionen/shell.typ"

#include "Lektionen/manpages.typ"

// Anatomie eines Shell befehls. Hilfe zur selbsthilge
// Shell crashkurs, cp, ls, mv, find, grep, whoami,...


#include "Lektionen/rechte.typ" // Erweitern auf chown chgrp












=  Python


// Hello World + erweitert mit einlesen
#include "Lektionen/helloworld.typ"

// Variablen und Arithmetik
#include "Lektionen/variablen_arithmetik.typ"

// Kontrollfluss
#include "Lektionen/kontrollfluss.typ"

// Schleifen

#include "Lektionen/schleifen.typ"

// Funktionen

// das Python repl

// list

// stl, Multifile programs

// Abschlussprojekt
