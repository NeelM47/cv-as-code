// ai-data-engineer.typ
#import "templates/base-cv.typ": cv-layout, generate_experience, generate_education, skill_group, project_entry

// 1. LOAD THE DATA
#let data = yaml("content/resume-data.yml")

// 2. SET UP THE LAYOUT
#show: cv-layout.with(
  name: data.personal.name,
  role: "Data Engineer", // You can change this per file
  contact-info:[
    #data.personal.location | #data.personal.visa | #data.personal.phone | #link("mailto:" + data.personal.email)[#data.personal.email] \
    #v(1pt)
    #link(data.personal.linkedin)[Linkedin] | #link(data.personal.github)[Github] | #link(data.personal.portfolio)[Portfolio]
  ]
)

// ==========================================
// 3. RENDER CONTENT DYNAMICALLY
// ==========================================

= Professional Summary
University of Manchester (MSc AI) graduate and published researcher specializing in data-driven automation. Expert in architecting autonomous agents that translate forecast analytics into actionable operations. Proven track record in engineering robust ETL pipelines on AWS Databricks.

= Technical Skills
#pad(x: 0.5em)[
  #skill_group("AI & Machine Learning", "LLMs, RAG, Autonomous Agents, Computer Vision (YOLO, OpenCV), NLP, PyTorch.")
  #skill_group("Data Engineering", "AWS Databricks, Amazon S3, ETL Pipelines, SQL, PostgreSQL, FAISS.")
]

= Experience
// Automatically generates the whole section from YAML!
#generate_experience(data)

= Projects
// (You can also move projects to YAML, but keeping them here is fine for now)
#project_entry(
  "Symbolic Machine Learning Prover (SMLP)",
  "Intel & Univ. of Manchester",[
    - Developed a machine learning model for SMLP in collaboration with Intel.
  ]
)

= Education
// Automatically generates education from YAML!
#generate_education(data)
