# curso-lia3r

Static site for **LIA 3R** — course, presentations and materials on AI, the Judiciary and the digital society — hosted on **GitHub Pages**.

Live: https://fabiopauli.github.io/curso-lia3r/

## What this is

A flat, self-contained static site (HTML/CSS/PNG/PDF). Entry point: `index.html`.
All internal links are relative, so it works under the project-page subpath `/curso-lia3r/`.

This repo is intentionally **separate** from the application repo (`cnj-landing`, deployed on Railway) so that GitHub Pages and Railway stay fully decoupled.

## Enabling GitHub Pages

Repo → **Settings → Pages** → **Build and deployment**:
- **Source:** Deploy from a branch
- **Branch:** `main` · **Folder:** `/ (root)` → **Save**

`.nojekyll` is present, so Pages serves the files as-is (no Jekyll build).

## Updating

The source of truth for the content lives in `cnj-landing/public/`. To publish updates,
copy that folder's contents over this repo's root and push. From the `cnj-landing` checkout:

```bash
rsync -a --delete --exclude='.git' --exclude='.nojekyll' --exclude='README.md' public/ ../curso-lia3r/
cd ../curso-lia3r && git add -A && git commit -m "Sync site" && git push
```
