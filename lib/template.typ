#let Fachschaft = [InfoMathPhys]

#let conf(body) = {
  set page(
    paper: "a4",
    margin: (x: 1.8cm, top: 2.2cm, bottom: 2.3cm),
    numbering: "1",
    number-align: center,
    header: context {
      let chapters = query(selector(heading.where(level: 1)).before(here()))
      let lessons = query(selector(heading.where(level: 2)).before(here()))
      let on-divider-page = query(
        selector(heading.where(level: 1)).or(heading.where(level: 2))
      ).any(h => h.location().page() == here().page())

      if chapters.len() > 0 and not on-divider-page {
        let chapter-title = chapters.last().body
        let lesson-title = if lessons.len() > 0 { lessons.last().body } else { none }
        grid(
          columns: (1fr, 1fr),
          align(left, text(size: 9pt, tracking: 1.5pt, fill: rgb("#666666"))[#upper(chapter-title)]),
          align(right, text(size: 9pt, style: "italic")[#lesson-title]),
        )
        v(-0.65em)
        line(length: 100%, stroke: 0.4pt + rgb("#999999"))
      }
    },
  )

  // Formatting
  let lesson-counter = counter("lektion")
  let chapter-counter = counter("kapitel")

  show heading.where(level: 2): set text(size: 22pt, style: "italic", weight: "light")
  show heading.where(level: 2): it => {
    pagebreak()
    lesson-counter.step()
    context text(size: 11pt, tracking: 1.5pt, fill: rgb("#999999"))[LEKTION #lesson-counter.get().first()]
    v(0.3em)
    it.body
    move(dy: -0.3em, line(length: 100%, stroke: 0.6pt))
    v(0.6em)
  }
  show heading.where(level: 3): set text(size: 20pt)
  show heading.where(level: 1): it => {
    pagebreak()
    set align(center + horizon)
    let is-frontmatter = it.body == [Vorwort]
    if not is-frontmatter {
      chapter-counter.step()
      context text(size: 13pt, tracking: 2pt, fill: rgb("#999999"))[KAPITEL #chapter-counter.get().first()]
      v(0.8em)
    }
    text(size: 32pt, style: "italic", weight: "light")[#it.body]
  }

  body
}
