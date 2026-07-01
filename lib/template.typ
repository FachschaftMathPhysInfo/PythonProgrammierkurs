#let Fachschaft = [InfoMathPhys]

#let conf(body) = {
    set page(paper: "a4")
    // Formatting 
show heading.where(level: 2) : set text(size: 22pt, style: "italic", weight: "light")
show heading.where(level: 2) : it => [ #counter(heading).step() #pagebreak()  Lektion #counter(heading).display(): #it.body #move(dy: -22pt, line(length: 100%)) #linebreak() ] 

show heading.where(level: 1) : set text(size: 22pt, style: "italic", weight: "light")
show heading.where(level: 1) : it => [   #pagebreak() #set align(center+ horizon)
    #text(size: 34pt, style: "italic", weight: "light")[Kapitel #counter(heading.where(level: 1)).display(): #it.body ] #counter(heading.where(level: 1)).step()
]

    body
}
