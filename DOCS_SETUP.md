# Setting Up Your Course Documentation Website

## What I've Created

✅ **mkdocs.yml** - Configuration file that organizes all your course content into a beautiful website
✅ **GitHub Actions Workflow** - Automatically builds and deploys your site when you push to GitHub

## Quick Setup (3 Steps)

### Step 1: Install MkDocs Locally (Optional but recommended to preview)

```bash
pip install mkdocs mkdocs-material mkdocs-awesome-pages-plugin mkdocs-glightbox
```

### Step 2: Preview Your Site Locally

```bash
cd "ai-infra-engineer-learning"
mkdocs serve
```

Then open http://localhost:8000 in your browser. You can now preview how the course will look!

### Step 3: Push to GitHub & Enable GitHub Pages

1. **Commit and push** your changes:
   ```bash
   git add mkdocs.yml .github/workflows/deploy-docs.yml
   git commit -m "docs: add MkDocs configuration and GitHub Pages deployment"
   git push origin main
   ```

2. **Enable GitHub Pages** in your repository settings:
   - Go to your repo → Settings → Pages
   - Source: Select "Deploy from a branch"
   - Branch: Select "gh-pages" (will be created automatically after first push)
   - Click Save

3. **GitHub Actions will automatically build your site** the first time you push. Check the "Actions" tab to monitor the deployment.

## After Setup

**Your course will be live at:**
```
https://[your-username].github.io/ai-infra-engineer-learning/
```

Or if you have a custom domain, configure it in the GitHub Pages settings.

### Share with Students

- 📖 Direct link to the website
- 🔗 Print-friendly: Add `/print_page/` to any page URL
- 📚 Search: Built-in search bar (accessible from any page)
- 📱 Mobile-friendly: Works on all devices
- 🌙 Dark mode: Users can toggle theme

## Website Features

✅ **Navigation** - Easy module browsing
✅ **Search** - Find content instantly
✅ **Code highlighting** - Pretty syntax highlighting
✅ **Mobile responsive** - Works on phones/tablets
✅ **Dark mode** - Reader-friendly theme toggle
✅ **Auto-updates** - Push to repo = automatic site update

## Customization

To modify the site (colors, logo, structure), edit `mkdocs.yml`:
- Change `site_name`, `site_description`
- Adjust `theme` colors and features
- Update navigation structure under `nav:`
- Add your own logo

Need help? See [MkDocs Material Documentation](https://squidfunk.github.io/mkdocs-material/)
