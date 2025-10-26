# Technology Stack

## Framework & Theme
- **Jekyll 4.4.1**: Static site generator
- **Minima 2.5**: Default Jekyll theme
- **Ruby**: Runtime environment via Bundler

## Plugins
- `jekyll-feed`: RSS/Atom feed generation

## Build System
Jekyll uses Ruby's Bundler for dependency management and provides built-in build commands.

## Common Commands

### Development
```bash
# Install dependencies
bundle install

# Start development server with auto-reload
bundle exec jekyll serve

# Build site for production
bundle exec jekyll build
```

### File Structure Conventions
- Posts must follow naming pattern: `YEAR-MONTH-DAY-title.MARKUP`
- All posts go in `_posts/` directory
- Front matter required for all content files
- Generated site outputs to `_site/` directory

## Configuration
- Main config: `_config.yml`
- Gem dependencies: `Gemfile`
- Server restart required after `_config.yml` changes