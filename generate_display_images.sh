#!/bin/bash

# Script to generate larger display images from thumbnails
# Requires ImageMagick to be installed (sudo apt-get install imagemagick)

# Directory containing thumbnail images
SOURCE_DIR="assets/images"

# Output directory for larger images
OUTPUT_DIR="assets/images"

# Size for larger images (width x height)
SIZE="1200x800"

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "Error: ImageMagick is not installed. Please install it first:"
    echo "sudo apt-get install imagemagick"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Process each image
for img in "$SOURCE_DIR"/*.{png,jpg,jpeg,gif,svg}; do
    # Skip if not a file
    [ -f "$img" ] || continue
    
    # Get filename without extension
    filename=$(basename -- "$img")
    extension="${filename##*.}"
    filename="${filename%.*}"
    
    # Skip if already a large image
    if [[ "$filename" == *"-large" ]]; then
        continue
    fi
    
    # Output filename
    output="$OUTPUT_DIR/${filename}-large.${extension}"
    
    # Skip if output already exists
    if [ -f "$output" ]; then
        echo "Skipping $filename (already exists)"
        continue
    fi
    
    echo "Processing $filename..."
    
    # Create larger version
    convert "$img" -resize "$SIZE" "$output"
    
    echo "Created $output"
done

echo "Done!" 