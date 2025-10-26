# Project Structure

## Root Level Files
- `_config.yml`: Main Jekyll configuration
- `Gemfile` & `Gemfile.lock`: Ruby dependency management
- `index.markdown`: Homepage (uses `home` layout)
- `about.markdown`: About page (uses `page` layout)
- `404.html`: Custom 404 error page

## Key Directories

### `_posts/`
Blog posts with required naming convention: `YYYY-MM-DD-title.markdown`
- Must include front matter with layout, title, date, categories
- Use `post` layout by default

### `_site/`
Generated static site output (excluded from version control)
- Contains compiled HTML, CSS, and assets
- Recreated on each build

### `.jekyll-cache/`
Jekyll's internal caching (excluded from version control)
- Speeds up subsequent builds
- Safe to delete if needed

## Content Conventions

### Front Matter
All content files require YAML front matter:
```yaml
---
layout: post|page|home
title: "Page Title"
date: YYYY-MM-DD HH:MM:SS +TIMEZONE  # for posts
categories: category1 category2       # for posts
permalink: /custom-url/               # optional
---
```

### Layouts
- `home`: For index page with post listings
- `page`: For static pages like About
- `post`: For blog posts with date/category metadata

## File Organization
- Keep markdown files in root for pages
- Use `_posts/` only for blog content
- Assets handled by Minima theme automatically