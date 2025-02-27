# Art Collection

This directory contains creative coding projects displayed on the website.

## Image Options

Each art item can have two different images:

1. **Thumbnail Image** (`image`): Used in the grid on the homepage
2. **Display Image** (`display_image`): Used on the individual art page

If `display_image` is not specified, the system will fall back to using the `image` for both.

```yaml
---
title: "Project Title"
image: "/path/to/thumbnail.png"  # Required - Used in the grid on homepage
display_image: "/path/to/large-image.png"  # Optional - Used on the individual page
tagline: "A short, catchy phrase that appears as a quote."  # Optional - Also used as hover text
description: "A longer description that appears below the tagline."  # Optional
---
```

## Content Fields

### Tagline Field

The `tagline` field is displayed as a styled quote below the title and above the description on the individual art page. It's also used as the tooltip text when hovering over the thumbnail on the homepage.

### Description Field

The `description` field is displayed below the tagline and above the image on the individual art page. It's a good place to provide a more detailed explanation of the project.

## Visibility Option

Each art item can be set as visible or hidden using the `visible` frontmatter property:

```yaml
---
title: "Project Title"
image: "/path/to/thumbnail.png"
display_image: "/path/to/large-image.png"
tagline: "A short, catchy phrase that appears as a quote."
description: "A longer description that appears below the tagline."
visible: true  # or false to hide
---
```

- `visible: true` - The item will be displayed on the website (this is the default)
- `visible: false` - The item will be hidden from the website

### Examples

#### Basic Item (Default)
```yaml
---
title: "Cell Division"
image: "/assets/images/cell-division.png"
tagline: "A biology-inspired board game."
---
```

#### Item with Separate Display Image and Description
```yaml
---
title: "Cell Division"
image: "/assets/images/cell-division-thumb.png"
display_image: "/assets/images/cell-division-large.png"
tagline: "A biology-inspired board game with an AI opponent."
description: "This creative coding project is a strategy-based board game inspired by cellular biology. Players take turns placing cells on the board, and when cells connect with each other, they divide and multiply."
---
```

#### Hidden Item
```yaml
---
title: "Work in Progress"
image: "/assets/images/wip-thumb.png"
display_image: "/assets/images/wip-large.png"
tagline: "This project is still under development."
description: "A more detailed explanation of what this project will be when completed."
visible: false
---
```

## Notes

- Items marked as `visible: false` will not appear on the website but will still be accessible if someone knows the direct URL.
- The default value for `visible` is `true` (set in `_config.yml`).
- You can use this feature to hide works in progress or temporarily remove items from display without deleting them.
- For best results, create thumbnails that are square and optimized for the grid display.
