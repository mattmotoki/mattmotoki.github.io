# Personal Website

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

4. Run the development server:
   ```
   ./serve_dev.sh
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

### Updating Biographical Information

Your biographical information is stored in the `_config.yml` file and the homepage:

1. **Basic Information** - Edit the `_config.yml` file to update:
   - Name (title)
   - Email
   - Site description
   - Social media handles (Twitter, GitHub)

2. **Homepage Bio** - Edit the `index.html` file to update your brief bio that appears on the homepage.

After making changes to `_config.yml`, you'll need to restart the Jekyll server for the changes to take effect.

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
image: "/assets/images/art-image.png"
---

Detailed description here...
```

## Deployment

The site is automatically deployed when changes are pushed to the main branch using GitHub Pages.

## Google Analytics Configuration

This site uses Google Analytics for tracking visitor statistics. The Google Analytics ID is configured to be loaded from an environment variable to keep it secure in the public repository.

### Development Mode

In development mode, Google Analytics is disabled by default. To run the site in development mode:

```
./serve_dev.sh
```

This script uses the `_config_development.yml` file which sets the Google Analytics ID to an empty string.

### Production Mode

For production deployment, the Google Analytics ID is set as an environment variable. If you're using GitHub Actions for deployment, you need to set up a secret:

1. Go to your GitHub repository
2. Navigate to Settings > Secrets and variables > Actions
3. Click "New repository secret"
4. Name: `GOOGLE_ANALYTICS_ID`
5. Value: Your Google Analytics ID (e.g., `G-XXXXXXXXXX`)
6. Click "Add secret"

The GitHub Actions workflow will automatically use this secret when deploying from the main branch.

If you're building the site locally for production, you can use:

```
./deploy.sh
```

This script sets the environment variable and builds the site with production settings. 