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

let ext-to-lang(ext) = {
  let mapping = (
    "py": "Python",
    "cpp": "C++",
    "java": "Java",
    "js": "JavaScript",
    "ts": "TypeScript",
    "rs": "Rust",
    "go": "Go",
    "rb": "Ruby",
    "php": "PHP",
    "c": "C",
    "h": "C",
    "hpp": "C++",
  )
  mapping.at(ext, default: "")
}

let ext = path.split(".").last()
let lang = ext-to-lang(ext)

stack(
  if lang != "" {text(size: 0.85em, weight: "bold", fill: gray)[#lang]} else [],
  zebraw(raw(lang: lang, content, block: true)),
  spacing: 0.3em
)
}



#let Quiz_answers = state("Quiz_answers", ())
#let Quiz_counter = counter("quiz")

// Quiz is  abit more complicated than the other environments
#let Quiz(answer: "", body) = {
    Quiz_counter.step()
    context {
    let number = Quiz_counter.get().at(0)
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
        heading(level: 3)[#title]}
    body
} 





#let Praxis = MakeSetting.with(title: "Praxis")
#let Spiel = MakeSetting.with(title: "Spiel")
#let Theorie = MakeSetting.with(title: "Theorie")
