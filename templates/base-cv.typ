// ==========================================
// HELPER FUNCTIONS (Exported for use in your CV)
// ==========================================

#let resume_entry(title, date, company, location, content) = {
  pad(bottom: 4pt, block[
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      text(weight: "bold", size: 11pt, title), 
      text(style: "italic", date)
    )
    #v(-5pt)
    #grid(
      columns: (1fr, auto),
      align: (left, right),
      text(style: "italic", weight: "medium", company), 
      text(size: 9pt, location)
    )
    #v(2pt)
    #set list(indent: 1em, marker: [•])
    #content
  ])
}

#let project_entry(title, subtitle, content) = {
  pad(bottom: 4pt, block[
    #text(weight: "bold", size: 10.5pt, title) | #text(style: "italic", subtitle)
    #v(2pt)
    #set list(indent: 1em, marker: [•])
    #content
  ])
}

#let skill_group(category, skills) = {
  text(weight: "bold", category) + [: ] + skills + linebreak()
}

// ==========================================
// MAIN LAYOUT FUNCTION
// ==========================================

#let cv-layout(
  name: "",
  role: "",
  contact-info:[],
  body
) = {
  // 1. CONFIGURATION & THEME
  let body_color = rgb("#000000")

  set page(paper: "a4", margin: (x: 1.25cm, y: 1.25cm))
  
  set text(
    font: ("Lato", "Roboto", "Arial"),
    size: 10pt,
    fill: body_color,
    lang: "en"
  )
  
  set par(justify: true, leading: 0.45em) 

  // Global Link styling (underlined)
  show link: it =>[
    #set text(fill: black)
    #underline(offset: 2pt, stroke: 0.5pt + black, it)
  ]

  // Heading styling
  show heading.where(level: 1): it =>[
    #v(0.8em)
    #set text(size: 12pt, weight: "black", font: "Lato")
    #upper(it.body)
    #v(-0.7em)
    #line(length: 100%, stroke: 1pt + black)
    #v(0.3em)
  ]

  // 2. HEADER RENDERER
  align(center)[
    #text(size: 24pt, weight: "bold")[#upper(name)] \
    #v(2pt)
    #text(size: 11pt, weight: "bold")[#upper(role)] \
    #v(2pt)
    
    // We override links in the header so they don't have underlines
    #show link: it => it 
    #contact-info
  ]

  // 3. BODY RENDERER
  body
}
// Add this at the bottom of templates/base-cv.typ

#let generate_experience(yaml_data) = {

  for job in yaml_data.experience [
    #resume_entry(
      job.title, 
      job.dates, 
      job.company, 
      job.location,
      [

        #for bullet in job.bullets [
          - #bullet
        ]
      ]
    )
  ]
}

#let generate_education(yaml_data) = {

  for edu in yaml_data.education [
    #resume_entry(
      edu.degree,
      edu.dates,
      edu.university,
      edu.location,
      [
        - *Modules:* #edu.modules
      ]
    )
  ]
}
