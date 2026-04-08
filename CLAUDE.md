# Repository Guidelines

## Project Structure & Module Organization

This is the VTEX Ads Retail Media API documentation repository. It provides comprehensive API docs in multiple languages with diagrams and examples.

- `en/` - English documentation
- `es/` - Spanish documentation
- `pt/` - Portuguese documentation
- `examples/` - API usage examples
- `diagrams/` - Architecture and flow diagrams
- `assets/` - Images and static assets (logos, screenshots)
- `scripts/` - Build scripts
  - `scripts/build-diagrams.sh` - Diagram generation script
  - `scripts/build-docs.sh` - Documentation build script
- `old_doc/` - Legacy/archived documentation
- `README.md` - Main entry point with language selection

## Build, Test, and Development Commands

- **Build diagrams:** `bash scripts/build-diagrams.sh`
- **Build docs:** `bash scripts/build-docs.sh`
- No package manager or formal build system; this is a documentation-only repository.

## Coding Style & Naming Conventions

- **Language:** Markdown for documentation
- **File naming:** `kebab-case.md` for documentation files
- **Directory structure:** Language-based directories (`en/`, `es/`, `pt/`)
- **Diagrams:** Maintained in `diagrams/` directory
- **Images:** Referenced from `assets/` directory

## Testing Guidelines

- No automated tests; review documentation for accuracy manually.
- Verify links are not broken across language versions.
- Check that diagrams render correctly after rebuilding.
- Ensure examples are up-to-date with the current API version.

## Commit & Pull Request Guidelines

- Use imperative commits; recommended format: `docs: action` (example: `docs: update authentication guide`)
- Keep translations in sync across `en/`, `es/`, and `pt/` directories.
- PRs must include: objective, changed files, and which languages were updated.

## Security & Configuration Tips

- Do not include real API keys, tokens, or credentials in examples.
- Use placeholder values (e.g., `YOUR_API_KEY`) in code samples.
- Avoid exposing internal endpoint URLs in public documentation.

## Coding Rules

* Always aim for the **smallest possible working diff**.
* Prefer **modifying existing code** over creating new files.
* **Do not introduce new modules, layers, or abstractions** unless explicitly required.
* **Follow existing project conventions** — do not invent new patterns.
* **Refactoring is not allowed** unless explicitly requested.
* When uncertain, **apply a local fix instead of redesigning**.
* Always prioritize **simplicity over cleverness**.
* Continuously ask yourself: **is this code truly necessary, or is there a simpler way to solve the same problem?**

---

## Minimal Implementation Guidelines

* Solve the task with the **least amount of code change**.
* **Edit existing files** instead of creating new ones.
* **Avoid new abstractions** unless strictly necessary to make the solution work.
* **Do not rename variables, functions, or files** unless required for correctness.
* **Do not modify unrelated code**.
* **Reuse existing helpers, services, and patterns** whenever possible.
* If the task can be solved within **a single file**, do not touch multiple files.
* Keep changes **scoped, isolated, and easy to review**.

---

## Final Step

* Before finishing, briefly explain **why this is the minimal and safest implementation**.
