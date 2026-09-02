#import "@preview/zebraw:0.6.3": *

#let description( format : it => emph(it), body) = {
    set terms(hanging-indent: 2.5em)
set terms(indent: 0em)

show terms: it => {

    let content-to-text(x) = {
        if type(x) == str {
            x
        }
        else if type(x) == content {
            if x.has("text") {
                x.text}
                else if x.has("children") {
                    x.children.map(i => content-to-text(i)).join("")}
        }}

    
  pad(
    left: it.indent + it.hanging-indent,
    stack(
      ..it.children.map(item => {
          h(-it.hanging-indent)

          let c = content-to-text(item.term)

        // Term styling:
          text(weight: "light")[#format(c)]

        it.separator
        item.description
      }),
      spacing: if it.tight {
        par.leading
      } else if it.spacing == auto {
        1.2em
      } else {
        it.spacing
      },
    ),
  )
}
body

}

#let Code(path, basename: "../Code/") = {
let content = {
    let raw_c = read(basename + path)
    // Remove trailing newline
     if (raw_c.last() == "\n") {
        str.slice(raw_c, 0, -1)
        
        
    }
    else {raw_c}
}


zebraw(raw(lang: "Python", content, block: true))
}



#let Quiz_answers = state("Quiz_answers", ())

// Quiz is  abit more complicated than the other environments 
#let Quiz(answer: "", body) = {
     context {
    let number =   counter(heading).get().at(0)
     Quiz_answers.update(s => s + ((number, answer),))
    
    [=== Quiz #number ]
    set enum(numbering: "a)")
    body
     }
}

#let Quiz_answers_table() = {

    [ Wir haben #context Quiz_answers.final().len() Aswers]

    context    grid(columns: (1fr, 1fr), row-gutter: 1em,
        [Quiz], [Antwort], grid.hline(), ..Quiz_answers.final().map(((n, a)) => ( [#n],
        [#a])).flatten()

    )

    

    
}


#let MakeSetting(title: "", show-heading: true, body) = {

    if show-heading {
        show heading: set text(size: 16pt)
        heading(level: 3)[#title]}
    body
} 





#let Praxis = MakeSetting.with(title: "Praxis")
#let Spiel = MakeSetting.with(title: "Spiel")
#let Theorie = MakeSetting.with(title: "Theorie")
