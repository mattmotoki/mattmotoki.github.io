#!/bin/bash

# Run Jekyll with development configuration
JEKYLL_ENV=development bundle exec jekyll serve --config _config.yml,_config_development.yml

echo "Development server stopped." 