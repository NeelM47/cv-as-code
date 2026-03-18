# 📄 CV-as-Code

> **Treating my professional identity like a production-grade software system**

[![GitHub Actions](https://img.shields.io/badge/CI/CD-GitHub%20Actions-brightgreen)](https://github.com/features/actions)
[![Typst](https://img.shields.io/badge/Typesetting-Typst-239DAD)](https://typst.app/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Live CV](https://img.shields.io/badge/Live-CV-blue)](https://neelm47.github.io/cv-as-code/ai-engineer.pdf)

---

## 🎯 Overview

As an AI & Data Engineer, I spend my days building automated pipelines and scalable architectures. Yet my CV—the single most important document of my career—was still a static, manually formatted file. Every update meant wrestling with Word margins, exporting PDFs, and manually re-uploading to my portfolio.

**No more.**

This project applies DevOps principles to my professional identity. My CV is now "source code" that gets compiled, versioned, and automatically deployed—just like the software systems I build at work.

---

## 🏗️ Architecture

```
┌─────────────┐     ┌──────────────┐     ┌─────────────┐     ┌──────────────┐
│   Content   │────▶│  Typesetting │────▶│   CI/CD     │────▶│  Deployment  │
│   (YAML)    │     │   (Typst)    │     │   (GitHub   │     │  (GitHub     │
│             │     │              │     │   Actions)  │     │   Pages)     │
└─────────────┘     └──────────────┘     └─────────────┘     └──────────────┘
       │                   │                     │                    │
       ▼                   ▼                     ▼                    ▼
Single source      Professional        Automated on        Always-live
of truth           formatting          every push           public URL
```

### Key Principles

- **📦 Content vs. Presentation** – All data lives in structured YAML; design lives in Typst templates
- **🔁 Single Source of Truth** – Never update the same information in two places
- **🤖 Automated Pipeline** – Every git push triggers a fresh build
- **📊 Version Control** – Full history of every CV version ever sent
- **🌐 Always Live** – Portfolio always serves the latest PDF

---

## 🛠️ Tech Stack

| Component | Technology | Purpose |
|-----------|------------|---------|
| **Data Layer** | YAML | Structured storage of all CV content |
| **Presentation Layer** | [Typst](https://typst.app/) | Modern, Rust-based typesetting (faster than LaTeX) |
| **Build System** | Make / Typst CLI | Local compilation |
| **CI/CD** | [GitHub Actions](https://github.com/features/actions) | Automated build on every push |
| **Hosting** | [GitHub Pages](https://pages.github.com/) | Permanent, live URL |
| **Version Control** | Git | Complete history tracking |

---

## ✨ Features

### ✅ Current
- **Modular architecture** – Change fonts in one file, content in another
- **Perfect formatting** – No mysterious margin shifts between versions
- **Instant updates** – CV regenerates in seconds, not minutes
- **Git-tracked history** – See exactly what your CV looked like 6 months ago
- **QR-code ready** – Share the live link anywhere
- **Multiple variants** – Filter YAML data for role-specific versions (AI Eng vs. Data Eng)

### 🚀 Coming Soon
- **RAG-powered customization** – Feed it a job description, get a tailored CV
- **Natural language interface** – Describe the role, get a polished PDF with embedded portfolio links
- **Automated cover letters** – Generate matching cover letters from the same data

---

## 📁 Project Structure

```
cv-as-code/
├── .github/
│   └── workflows/
│       └── build.yml        # GitHub Actions CI/CD pipeline
├── data/
│   └── cv.yaml              # Single source of truth (all content)
├── templates/
│   ├── main.typ             # Main Typst template
│   ├── header.typ            # Header styling
│   └── sections.typ          # Section layouts
├── variants/
│   ├── ai-engineer.typ       # AI-focused variant
│   └── data-engineer.typ     # Data Eng-focused variant
├── scripts/
│   └── generate.sh           # Local build helper
├── output/                   # Generated PDFs (gitignored)
├── .gitignore
├── Makefile                  # Local build commands
├── README.md
└── LICENSE
```

---

## 🚦 Getting Started

### Prerequisites

```bash
# Install Typst (if you don't have it)
curl -fsSL https://typst.com/install.sh | sh

# Or via package manager
sudo apt install typst        # Debian/Ubuntu
brew install typst             # macOS
```

### Local Development

```bash
# Clone the repository
git clone https://github.com/NeelM47/cv-as-code.git
cd cv-as-code

# Build all variants
make all

# Build specific variant
make ai-engineer

# Watch for changes (auto-rebuild)
make watch

# Clean output directory
make clean
```

### Customizing Content

1. Edit `data/cv.yaml` with your information
2. Modify templates in `templates/` for design changes
3. Commit and push to trigger automatic rebuild

---

## 🤖 CI/CD Pipeline

On every push to `main`, GitHub Actions automatically:

1. **Spins up** a Ubuntu runner
2. **Installs** Typst
3. **Compiles** all variants from YAML + templates
4. **Deploys** PDFs to GitHub Pages
5. **Makes available** at `https://neelm47.github.io/cv-as-code/ai-engineer.pdf`

### Pipeline Configuration (`.github/workflows/build.yml`)

```yaml
name: Build and Deploy CV

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Install Typst
        run: |
          curl -fsSL https://typst.com/install.sh | sh
          echo "$HOME/.local/bin" >> $GITHUB_PATH
      
      - name: Build CV
        run: make all
        
      - name: Upload PDFs
        uses: actions/upload-artifact@v3
        with:
          name: cv-pdfs
          path: output/*.pdf
          
      - name: Deploy to Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./output
          publish_branch: gh-pages
          keep_files: false
```

---

## 🔗 Live Demo

- **AI Engineer CV**: https://neelm47.github.io/cv-as-code/ai-engineer.pdf
- **Portfolio**: https://neelm47.github.io/
Scan this QR code to see the live CV:

```
[![QR Code](https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=https://neelm47.github.io/cv-as-code/ai-engineer.pdf)]
```

---

## 💡 Why This Matters

### For Engineers
- **Demonstrates systems thinking** – I don't just "know" CI/CD; I use it to solve real problems
- **Shows automation mindset** – Why do manually what a machine can do?
- **Proves adaptability** – Quickly learn and apply new tools (Typst)

### For Recruiters
- **Always up-to-date** – No more "is this the latest version?"
- **Perfect formatting** – What you see is what you get
- **Tech stack transparency** – See exactly what tools I work with

---

## 🧠 Lessons Learned

1. **Start with structure** – Separating content from presentation was the key enabler
2. **Automate early** – The CI/CD pipeline saved hours of manual work
3. **Version everything** – Git history has saved me more than once
4. **Keep it simple** – Typst was easier to learn than LaTeX

---

## 🔮 Future Roadmap

- **Phase 1**: ✅ Basic CV-as-Code pipeline
- **Phase 2**: 🔄 Multiple variants (AI/Data Eng)
- **Phase 3**: 🚧 RAG-based job description matching
- **Phase 4**: 📝 Automated cover letter generation
- **Phase 5**: 🌐 Multi-language support

---

## 🤝 Contributing

This is a personal project, but I'm open to ideas! Feel free to:
- Open an issue with suggestions
- Fork and customize for your own CV
- Share how you've adapted the concept

---

## 📬 Contact

- **GitHub**: [@NeelM47](https://github.com/NeelM47)
- **Portfolio**: [https://neelm47.github.io/]
- **LinkedIn**: [https://www.linkedin.com/in/neel-more-ai/]
- **Email**: neelmore007@gmail.com

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

*Built with automation, version control, and ☕*
