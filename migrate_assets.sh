#!/bin/bash

# Create necessary directories if they don't exist
mkdir -p assets/images
mkdir -p assets/files
mkdir -p assets/favicons

# Copy images
echo "Copying images..."
cp -r archive/images/* assets/images/

# Copy files
echo "Copying files..."
cp -r archive/files/* assets/files/

# Copy favicons
echo "Copying favicons..."
cp -r archive/favicons/* assets/favicons/

echo "Assets migration completed!" 