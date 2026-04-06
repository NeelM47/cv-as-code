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
  #text(size: 11pt, weight: "bold")[PYTHON AI ENGINEER] \
  #v(2pt)
  #show link: it => it 
  Liverpool, UK | Graduate Visa (Valid until Aug 2027) | +44 7393 063 988 | #link("mailto:neelmore007@gmail.com")[neelmore007\@gmail.com] \
  #v(1pt)
  #link("https://www.linkedin.com/in/neel-more-ai/")[Linkedin] | #link("https://github.com/NeelM47")[Github] | #link("https://neelm47.github.io/")[Portfolio] 
]

// --- SUMMARY ---
= Professional Summary
University of Manchester (MSc AI) graduate specialized in Python-driven AI engineering and cloud-native application development. Adept at architecting scalable LLM solutions, multi-agent workflows (LangChain, LangGraph), and Retrieval-Augmented Generation (RAG) systems. Experienced in bridging development and production by deploying machine learning models via Azure CI/CD pipelines, implementing rigorous LLM observability, and building enterprise-grade data architectures. Brings applied domain knowledge in financial services, algorithmic optimization, and banking systems.

// --- SKILLS ---
= Technical Skills
#pad(x: 0.5em)[
  #skill_group("AI & Engineering", "Python, LangChain, LangGraph, LLM Observability & Evaluation, RAG Architectures, Agentic Workflows, PyTorch.")
  #skill_group("Cloud & Ecosystem", "Microsoft Azure (OpenAI, Functions, Storage, AKS), Cloud-Native Dev, AWS, Docker, API Systems.")
  #skill_group("Data & Databases", "Vector DBs (FAISS, ChromaDB), Graph DBs (Neo4j), Data Structures, Algorithms, SQL, PostgreSQL.")
  #skill_group("DevOps & Delivery", "Azure DevOps, CI/CD Pipelines, LangSmith, Git/GitHub, Responsible AI Governance, Agile/Scrum.")
]

// --- EXPERIENCE ---
= Experience

#resume_entry(
  "Python AI Engineer & Consultant",
  "Dec 2025 – Present",
  "RTN Zero Consulting",
  "Manchester, UK",[
    - Engineered scalable, LLM-based multi-agent workflows using Python and LangChain to forecast revenue and generate actionable AI insights.
    - Integrated machine learning models into production systems, implementing LLM observability, prompt monitoring, and evaluation metrics to ensure model performance.
    - Streamlined secure data-AI pipelines and API-based integrations for certification compliance, supporting continuous improvement through rapid prototyping.
  ]
)

#resume_entry(
  "Data Analyst (Data Engineering & DevOps Focus)",
  "Sept 2023 – Oct 2025",
  "Subtle Solutions",
  "India (Remote)",[
    - Developed end-to-end Python data pipelines, migrating large-scale commercial data into centralized cloud storage lakes.
    - Built and maintained CI/CD pipelines using Azure DevOps and Git in an Agile framework, maintaining 99.9% uptime for production data workflows.
    - Collaborated within a globally distributed, cross-functional team to deliver enterprise-grade performance tracking dashboards.
  ]
)

#resume_entry(
  "Software Engineering Virtual Experience",
  "Dec 2021",
  "JPMorgan Chase & Co.",
  "Remote",[
    - Developed a real-time interface with stock price data feeds using Python and JPMorgan frameworks for trader visualization.
    - Implemented financial data visualizations and performed performance testing to ensure high-frequency trading reliability within the banking sector.
  ]
)

#resume_entry(
  "Java & Python Coding Intern",
  "Jan 2022 – Feb 2022",
  "Suven Consultants & Technology",
  "India",[
    - Engineered software for a "Consumer Loan Assistance Program," focusing on backend logic, database connectivity, and financial service delivery.
  ]  
)

// --- PROJECTS ---
// Wrapped in a block to ensure the heading is never orphaned on the previous page
#block(breakable: false)[
= Projects

#project_entry(
  "CorpRisk-AI: Due Diligence Assessor",
  "Python, LangGraph, RAG, FastAPI, Docker, Azure",[
    - Engineered a scalable, multi-agent AI workflow (Python, LangChain, LangGraph) with a RAG architecture to automate corporate due diligence and AML risk assessment.
    - Implemented comprehensive LLM observability via LangSmith to track prompt metrics, evaluate AI safety guardrails, and monitor token usage.
    - Architected a cloud-native FastAPI backend containerized with Docker, optimized for scalable deployment on Azure Kubernetes Service (AKS) using Azure OpenAI.
  ]
)
] // End of unbreakable block

#project_entry(
  "Full-Stack AI Agentic RAG Application",
  "Portfolio",[
    - Architected a containerized (Docker) cloud-native RAG application using Python, Django, Neo4j, and Gemini APIs for verifiable document retrieval. 
    - Built reasoning-capable AI agents with LangChain and LangGraph, utilizing hybrid vector-graph embeddings and custom re-ranking.
    - Applied AI safety guardrails, prompt evaluation, and responsible AI principles to ensure strict factual consistency.
  ]
)

#project_entry(
  "Symbolic Machine Learning Prover (SMLP)",
  "Intel & Univ. of Manchester",[
    - Developed a scalable machine learning model in collaboration with Intel, optimizing data structures and algorithms for computational efficiency.
    - Utilized performance instrumentation and profiling tools to evaluate model throughput, integrating ML into complex production-grade workflows.
  ]
)

// --- EDUCATION ---
= Education

#resume_entry(
  "MSc. Artificial Intelligence",
  "Sept 2023 – Sept 2024",
  "University of Manchester",
  "Manchester, UK",[
    - *Modules:* Large Language Models, Computer Vision, Cognitive Robotics, Data Science
  ]
)

#resume_entry(
  "B.E. Computer Engineering",
  "Aug 2019 – Aug 2023",
  "Bharati Vidyapeeth's College of Engineering",
  "Pune, India",[
    - *Modules:* CNNs, NLP, Network Security, Operating Systems, Data Engineering
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
- SoftTech Solutions (2023) #link("https://drive.google.com/file/d/15DvDwrywRJZEFmEJmugoHJoxzCBvbZJU/view?usp=sharing")['Internship Certificate'].
- Suvidha Foundation (2023) #link("https://drive.google.com/file/d/13aPoM2o3AszkObIm9WXLaeFI8GElZWpa/view?usp=sharing")['Internship Certificate'].
