#import "lib/template.typ": conf
#import "lib/stringformat.typ": stringstyle
#import "lib/helpers.typ": Quiz_answers_table, Code
#import "@preview/zebraw:0.6.3": *
#import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary
#show: make-glossary

#import "Glossary/content.typ" : entry-list

#register-glossary(entry-list)

#let authors = {

    let raw = read("./authors.txt")

    raw.split("\n").slice(0, -1)
}

#set document(author: authors, description: "Python Programmierkurs der Fachschaft MathPhysInfo", title: "Programmiervorkurs Skript")
#let title = "Programmiervorkurs"
#let subtitle = "Fachschaft MathPhysInfo"

#show: conf
#show: zebraw
#show: stringstyle 



//TITLEPAGE
#[
    #set align(center)
    #image("Assets/SadEmoji.jpg")  //TODO: Platzhalter entfernen
    

    #text(size: 36pt, weight: "bold")[#title]

#v(2cm)

    #text(size: 24pt, style: "italic")[#subtitle]
    #v(1fr)
    #datetime.today().display("[month repr:long] [day], [year]")

    //    Written by #authors.join( ",", last: " and ") //TODO: Uncomment when the authors list ist not that sad. Maybe even scratch it here and add the authors at the back
]

#pagebreak()

#include "vorwort.typ"


= Intro

== Vorbereitung eigener Computer


=  Unix artige Betriebssysteme


#include "Lektionen/shell.typ"


#include "Lektionen/manpages.typ"

#include "Lektionen/rechte.typ"

== NixOs Package management



== Tiling Window Manager


= Python

== Numpy



#let codesnippet(path, name) = {
    [#set align(center)
        #text(gray, style: "italic")[
            #name]]
    
    rect(stroke: gray, width: 100%)[
        #raw(lang: "Python", read(path), block: true)]
}
//TODO: Remove demonstration for Code includes
#Code("helloworld.py")  




= Glossary
#pagebreak()




#print-glossary(entry-list,  show-all: true )


