#!/bin/bash

# Set environment variables for production
export GOOGLE_ANALYTICS_ID="G-9PREHWYS4F"

# Build the site for production
JEKYLL_ENV=production bundle exec jekyll build

# Add any additional deployment steps here
# For example, if you're deploying to GitHub Pages, you might not need additional steps
# If you're deploying elsewhere, add the necessary commands

echo "Site built successfully with production settings!" 