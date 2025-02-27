# Matt Motoki's Personal Website

Source code for my website: https://mattmotoki.github.io/

## Built With

- [Jekyll](https://jekyllrb.com/) - Static site generator
- HTML/CSS/JavaScript - Frontend technologies

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Ruby (version 2.5.0 or higher)
- RubyGems
- GCC and Make

### Installation

1. Install Jekyll and Bundler:
   ```
   gem install jekyll bundler
   ```

2. Clone the repository:
   ```
   git clone https://github.com/mattmotoki/mattmotoki.github.io.git
   cd mattmotoki.github.io
   ```

3. Install dependencies:
   ```
   bundle install
   ```

4. Run the site locally:
   ```
   bundle exec jekyll serve
   ```

5. Open your browser and navigate to `http://localhost:4000`

## Site Structure

- `_posts/` - Blog posts
- `_projects/` - Project information
- `_competitions/` - Competition entries
- `_art/` - Creative coding projects
- `assets/` - Images, CSS, JavaScript, and other static files
- `_layouts/` - HTML templates
- `_includes/` - Reusable HTML components
- `_sass/` - SCSS files

## Adding Content

### Blog Posts

Create a new file in the `_posts` directory with the format `YYYY-MM-DD-title.md`:

```markdown
---
layout: post
title: "Your Post Title"
date: YYYY-MM-DD
image: /assets/images/your-image.png
description: "Brief description of your post"
---

Your content here...
```

### Projects

Create a new file in the `_projects` directory:

```markdown
---
title: "Your Project Title"
project_url: "https://example.com"
demo_url: "https://demo.example.com"
github_url: "https://github.com/username/repo"
image: "/assets/images/project-image.png"
---

Project description here...
```

### Competitions

Create a new file in the `_competitions` directory:

```markdown
---
title: "Competition Title"
competition_url: "https://competition-website.com"
code_url: "/assets/files/code.html"
summary_url: "https://summary-url.com"
github_url: "https://github.com/username/repo"
presentation_url: "https://presentation-url.com"
app_url: "https://app-url.com"
teammates: "Teammate names"
result: "Result (e.g., 1st Place $10,000)"
---

Competition description here...
```

### Art Projects

Create a new file in the `_art` directory:

```markdown
---
title: "Art Title"
description: "Brief description"
art_url: "/assets/files/art-file.html"
image: "/assets/images/art-image.png"
---

Detailed description here...
```

## Deployment

The site is automatically deployed when changes are pushed to the main branch using GitHub Pages. 