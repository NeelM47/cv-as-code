// ==========================================
// 1. CONFIGURATION & THEME
// ==========================================

// Define strictly Black & White
#let accent_color = black 
#let body_color = rgb("#000000")

// Page setup
#set page(
  paper: "a4",
  margin: (x: 1.25cm, y: 1.25cm),
)

// Font setup: Lato
#set text(
  font: ("Lato", "Roboto", "Arial"),
  size: 10pt,
  fill: body_color,
  lang: "en"
)

// SPACING ADJUSTMENT HERE:
#set par(justify: true, leading: 0.45em) 

// Link styling
#show link: it =>[
  #set text(fill: black)
  #underline(offset: 2pt, stroke: 0.5pt + black, it)
]

// Heading styling
#show heading.where(level: 1): it =>[
  #v(0.8em)
  #set text(size: 12pt, weight: "black", font: "Lato")
  #upper(it.body)
  #v(-0.7em)
  #line(length: 100%, stroke: 1pt + black)
  #v(0.3em)
]

// ==========================================
// 2. HELPER FUNCTIONS
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
// 3. DOCUMENT CONTENT
// ==========================================

// --- HEADER ---
#align(center)[
  #text(size: 24pt, weight: "bold")[NEEL SHIRISH MORE] \
  #v(2pt)
  // STRATEGIC CHANGE: Shift from "AI Engineer" to "Python Software Engineer"
  #text(size: 11pt, weight: "bold")[PYTHON SOFTWARE ENGINEER] \
  #v(2pt)
  #show link: it => it 
  Liverpool, UK | Graduate Visa (Valid until Aug 2027) | +44 7393 063 988 | #link("mailto:neelmore007@gmail.com")[neelmore007\@gmail.com] \
  #v(1pt)
  #link("https://www.linkedin.com/in/neel-more-ai/")[Linkedin] | #link("https://github.com/NeelM47")[Github] | #link("https://neelm47.github.io/")[Portfolio] 
]

// --- SUMMARY ---
= Professional Summary
Detail-oriented Python Software Engineer and University of Manchester Master's graduate specializing in scalable backend systems and data pipelines. As a dedicated Linux power user (6 years Debian, 2 years Ubuntu), I operate a highly optimized, 100% terminal-driven workflow utilizing Vim and TUI utilities. This keyboard-first philosophy reflects my broader engineering mindset: an inherent drive for maximum efficiency, clean architecture, and deep system understanding. Passionate about building resilient software from the ground up, I prioritize writing robust, idiomatic Python backed by rigorous testing and immaculate documentation. Eager to bring my focus on open-source quality, system performance, and automation to Canonical’s globally distributed engineering team.

// --- SKILLS ---
= Technical Skills
#pad(x: 0.5em)[
  // STRATEGIC CHANGE: Put Linux, Bash, and Python at the very top. Added REST APIs and PostgreSQL.
  #skill_group("Languages & OS", "Python, Linux, Bash/Zsh scripting, Java.")
  #skill_group("Backend & Systems", "FastAPI, REST APIs, Docker, Kubernetes (AKS), PostgreSQL, Neo4j, System Architecture.")
  #skill_group("DevOps & Tooling", "Vim/Neovim, CLI/TUI Utilities, Git/GitHub, Azure DevOps, CI/CD Pipelines, Test-Driven Development.")
  #skill_group("Data Engineering & AI", "Data Structures, Algorithms, Machine Learning Pipelines, Vector DBs, LangChain, Performance Profiling.")
]

// --- EXPERIENCE ---
= Experience

#resume_entry(
  "Python Software Engineer & Consultant",
  "Dec 2025 – Present",
  "RTN Zero Consulting",
  "Manchester, UK",[
    // STRATEGIC CHANGE: Emphasize "idiomatic Python", "production systems", and "testing"
    - Engineered scalable, Python-based backend workflows and data architectures to generate actionable business insights and forecast revenue.
    - Integrated complex models into production systems, implementing rigorous observability, performance profiling, and evaluation metrics to ensure software reliability.
    - Streamlined secure REST API integrations and data pipelines for certification compliance, supporting continuous deployment through rapid, well-documented prototyping.
  ]
)

#resume_entry(
  "Data Analyst (Data Engineering & DevOps Focus)",
  "Sept 2023 – Oct 2025",
  "Subtle Solutions",
  "India (Remote)",[
    // STRATEGIC CHANGE: Canonical LOVES remote workers. Highlighted the globally distributed aspect.
    - Developed end-to-end Python data pipelines, migrating large-scale commercial data into centralized cloud storage lakes while maintaining idiomatic code standards.
    - Built and maintained CI/CD pipelines using Azure DevOps and Git in an Agile framework, achieving 99.9% uptime for critical production workflows.
    - Collaborated proactively within a globally distributed, cross-functional remote team to deliver enterprise-grade performance tracking systems.
  ]
)

#resume_entry(
  "Software Engineering Virtual Experience",
  "Dec 2021",
  "JPMorgan Chase & Co.",
  "Remote",[
    - Developed a real-time interface with stock price data feeds using Python and internal frameworks for high-stakes trader visualization.
    - Implemented robust data handling and performed rigorous system testing to ensure high-frequency trading reliability within the banking sector.
  ]
)

#resume_entry(
  "Java & Python Coding Intern",
  "Jan 2022 – Feb 2022",
  "Suven Consultants & Technology",
  "India",[
    - Engineered backend software for a "Consumer Loan Assistance Program," focusing on core logic, database connectivity, and secure service delivery.
  ]  
)

// --- PROJECTS ---
#block(breakable: false)[
= Projects

#project_entry(
  "CorpRisk-AI: Enterprise Due Diligence System",
  "Python, Linux, FastAPI (REST), PostgreSQL, Docker, Azure",[
    // STRATEGIC CHANGE: Highlight Docker, Linux, APIs, and Architecture
    - Architected a cloud-native FastAPI backend containerized with Docker, optimized for scalable deployment on Linux environments and Kubernetes (AKS).
    - Engineered a scalable data retrieval workflow (Python) integrated with extensive system observability to monitor performance, latency, and factual consistency.
    - Built a robust, rigorously tested codebase emphasizing clean architecture, modular design, and comprehensive documentation for future maintainers.
  ]
)
] // End of unbreakable block

#project_entry(
  "Full-Stack Containerized Data Application",
  "Portfolio",[
    - Architected a cloud-native, containerized (Docker) application utilizing Python, Django, and Neo4j for secure and verifiable data retrieval via REST APIs.
    - Implemented complex data structures and hybrid vector-graph databases to handle advanced querying logic.
    - Applied strict safety guardrails and software engineering best practices to ensure high-quality, maintainable code.
  ]
)

#project_entry(
  "Symbolic Machine Learning Prover (SMLP)",
  "Intel & Univ. of Manchester",[
    // STRATEGIC CHANGE: Point out performance profiling and algorithms
    - Developed a scalable Python model in collaboration with Intel, optimizing core data structures and algorithms for maximum computational efficiency.
    - Utilized performance instrumentation and profiling tools to evaluate throughput, integrating the solution into complex, production-grade Linux workflows.
  ]
)

// --- EDUCATION ---
= Education

#resume_entry(
  "MSc. Artificial Intelligence",
  "Sept 2023 – Sept 2024",
  "University of Manchester",
  "Manchester, UK",[
    - *Core Focus:* Large-Scale Systems, Computer Vision, Data Science, Cognitive Robotics
  ]
)

#resume_entry(
  "B.E. Computer Engineering",
  "Aug 2019 – Aug 2023",
  "Bharati Vidyapeeth's College of Engineering",
  "Pune, India",[
    - *Core Focus:* Data Engineering, Operating Systems, Network Security, NLP, Algorithms
  ]
)

// --- PUBLICATIONS & CERTIFICATIONS ---
= Publications & Certifications
#set list(marker:[‣])

- Kadam Pratima, More Neel. et al. (2023) #link("https://drive.google.com/file/d/1OkyHni_bXQofdCnm0foQC_2WpdHwaD83/view?usp=sharing")['Deep Learning and Artificial Intelligence for Games'], IOSR Journal of Computer Engineering.
- LinkedIn Learning (2026) #link("https://drive.google.com/file/d/102S0bvPKSVZFsVNGHvBQrOoozqPFVSFn/view?usp=sharing")['Microsoft Azure Solutions Architect Expert (AZ-305) Cert Prep'].
- Udemy (2023) #link("https://drive.google.com/file/d/15DvDwrywRJZEFmEJmugoHJoxzCBvbZJU/view?usp=sharing")['Machine Learning in Python'].
- Udemy (2022) #link("https://drive.google.com/file/d/1R2yIhLdrPg296hrrtFy32ZIpE1Zak9Y1/view?usp=sharing")['Reinforcement Learning: Beginner to Master'].
- GIS Science Journal (2022) #link("https://drive.google.com/file/d/1RSJ3ptlvDeh9ny643ESl7j6-75ezE5HQ/view?usp=sharing")['Nanocomposites'].
