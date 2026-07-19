# OSTERA Standards Track Document Template

This repository contains official LaTeX templates for authoring **OSTERA Standards Track** documents.

[OSTERA](https://ostera.org) (The Open Standards and Technology Engineering and Research Association) is a nonprofit standards-defining organization based in Geneva, Switzerland. These templates provide a consistent, professional format for contributors drafting technical standards submitted through the OSTERA Standards Track process.

## Requirements

- A working [XeLaTeX](https://tug.org/xetex/) installation (e.g., via TeX Live or MacTeX)
- `biblatex` with the `biber` backend for bibliography management

## Compile

Compile **`main.tex`** with **XeLaTeX**. The root file begins with a XeLaTeX magic comment for editors that support it.

The class uses `fontspec`, so **pdfLaTeX is not supported**. LuaLaTeX is also compatible.

> Do not compile individual files from `sections/`, `annexes/`, `appendices/`, `references/`, or `examples/`. They are components of `main.tex` and do not contain their own document preamble.

## Where to edit

| Purpose | File or folder |
|---|---|
| Title, authors, status information, citation, abstract, keywords | `metadata.tex` |
| Main document content | `sections/` |
| Normative and informative references | `references/normative.tex`, `references/informative.tex` |
| Bibliographic record store for BibTeX/Biber workflow | `references/references.bib` |
| Annexes | `annexes/` |
| Informational appendices | `appendices/` |
| Demonstrations of equations, listings, code, tables, and figures | `examples/illustrations.tex` |
| OSTERA visual style, packages, numbering, hyperlink navigation, table-of-contents/list formatting, title page, and reusable commands | `ostera-standards.cls` |

## Entry point

`main.tex` is intentionally short. It establishes the document order and imports each part. Add a new section by creating a file under `sections/` and inserting one `\input{...}` line in `spec.tex` at the appropriate location.

## Navigation and internal links

- Create an annex top-level heading with `\AnnexSection{Title}`.
- Create an informational appendix top-level heading with `\AppendixSection{Title}`.
- Create an unnumbered back-matter heading that belongs in the ToC with `\UnnumberedSection{Title}`.

Custom List of Listings and List of Code entries now use native `\refstepcounter` anchors, so they point to their own labels rather than to a preceding equation or listing.

## Illustrations demonstration

`sections/06-main-content.tex` imports `examples/illustrations.tex` to demonstrate how to use the various types of objects (tables, figures, code, equations, etc). Remove that input line before publication.

## References

The template uses Biber to automatically generate the IEEE-style refernces and uses `references/references.bib` as the canonical store for bibliographic records. Please note the keywords of `normative` and `informative`.

## Repository hygiene

Do not commit generated `.aux`, `.log`, `.pdf`, `.toc`, `.lof`, `.lot`, `.loe`, `.lol`, `.loc`, `.out`, or `.synctex.gz` files. The provided `.gitignore` covers common build artefacts.

## Template Development

This LaTeX template was developed by Bret Jordan and Vasileios Mavroeidis. Special thanks goes to Vasileios Mavroeidis who took the monolithic document that I created and broke it up into the structure we now have and for enabling the references to be automatically generated.

