# Jekyll + Tailwind CSS Site

A modern Jekyll static site with integrated Tailwind CSS utilities and SCSS preprocessing, built on the Minima theme foundation.

## Features

- 🎨 **Tailwind CSS** - Utility-first CSS framework for rapid UI development
- 🎯 **SCSS Support** - Custom styling with variables, mixins, and nesting
- 🏗️ **Jekyll 4.4.1** - Modern static site generator
- 📱 **Responsive Design** - Mobile-first responsive layouts
- ⚡ **Live Reload** - Automatic browser refresh during development
- 🚀 **GitHub Pages Ready** - Deploy with GitHub Actions or direct Pages
- 🎭 **Minima Compatible** - Maintains existing theme structure

## Quick Start

### 1. Setup Development Environment

```bash
# Clone and navigate to your project
git clone <your-repo-url>
cd <your-project>

# Run setup script (installs dependencies and configures everything)
./scripts/setup-dev.sh

# Or on Windows
scripts\setup-dev.bat

# Or using Make
make setup
```

### 2. Start Development

```bash
# Start development server with CSS watching and live reload
npm run dev

# Your site will be available at http://localhost:4000
```

### 3. Start Building

Use Tailwind utilities and custom SCSS to style your site:

```html
<!-- Use Tailwind utilities -->
<div class="container mx-auto px-4 py-8">
  <h1 class="text-3xl font-bold text-gray-900 mb-4">Welcome</h1>
  <p class="text-gray-600 leading-relaxed">Your content here...</p>
</div>
```

```scss
// Add custom SCSS in assets/scss/_components.scss
.hero-section {
  @apply bg-gradient-to-r from-blue-500 to-purple-600 text-white py-20;
  
  .hero-title {
    @apply text-4xl md:text-6xl font-bold mb-4;
  }
}
```

## Project Structure

```
├── _layouts/           # Jekyll layout templates
├── _includes/          # Reusable Jekyll components
├── _posts/            # Blog posts
├── assets/
│   ├── css/
│   │   ├── main.scss      # Main SCSS entry point
│   │   └── tailwind.css   # Generated Tailwind CSS (build artifact)
│   └── scss/
│       ├── _variables.scss    # Custom variables
│       ├── _components.scss   # Custom components
│       ├── _utilities.scss    # Custom utilities
│       └── _tailwind-input.scss # Tailwind CLI input
├── docs/              # Documentation
├── scripts/           # Development setup scripts
├── _config.yml        # Jekyll configuration
├── tailwind.config.js # Tailwind configuration
├── package.json       # npm dependencies and scripts
└── Gemfile           # Ruby dependencies
```

## Available Commands

### Development

```bash
npm run dev          # Start development with CSS watching and live reload
npm run dev:fast     # Start development with one-time CSS build (faster startup)
npm run serve        # Start Jekyll server only
```

### Building

```bash
npm run build        # Production build with optimized CSS
npm run build:dev    # Development build
npm run clean        # Clean build artifacts
```

### CSS Management

```bash
npm run build:css-dev    # Build Tailwind CSS once
npm run watch:css        # Watch and rebuild CSS on changes
npm run build:css-prod   # Build optimized CSS for production
```

### Utilities

```bash
npm run check:tailwind   # Verify Tailwind CLI setup
npm run check:jekyll     # Verify Jekyll setup
npm run lint:css         # Check for unused Tailwind classes
```

### Using Make (Alternative)

```bash
make dev            # Start development
make build          # Production build
make clean          # Clean files
make setup          # Initial setup
make help           # Show all commands
```

## CSS System

This project uses a hybrid approach combining Tailwind CSS utilities with custom SCSS:

### Tailwind CSS Utilities

Use utility classes for rapid development:

```html
<button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
  Click me
</button>

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
  <!-- Responsive grid -->
</div>
```

### Custom SCSS

Create custom components and utilities:

```scss
// In assets/scss/_components.scss
.card {
  @apply bg-white rounded-lg shadow-md p-6;
  
  .card-title {
    @apply text-xl font-semibold mb-2;
  }
  
  &:hover {
    @apply shadow-lg;
  }
}
```

### Combining Both

Use `@apply` to combine Tailwind utilities in SCSS:

```scss
.custom-button {
  @apply px-4 py-2 bg-blue-500 text-white rounded;
  
  transition: all 0.3s ease;
  
  &:hover {
    @apply bg-blue-600;
    transform: translateY(-1px);
  }
}
```

## Deployment

### GitHub Pages with GitHub Actions (Recommended)

The project includes a GitHub Actions workflow for automated deployment:

1. Push to your main branch
2. GitHub Actions builds the site with Tailwind CSS
3. Deploys to GitHub Pages automatically

### Manual GitHub Pages

For simple GitHub Pages deployment without build process:

1. The site uses CDN fallback for Tailwind CSS
2. Push to your repository
3. Enable GitHub Pages in repository settings

### Other Hosting

For other hosting providers:

```bash
# Build for production
npm run build

# Upload the _site directory to your hosting provider
```

## Documentation

- 📖 [CSS System Documentation](docs/CSS_SYSTEM.md) - Complete guide to using Tailwind and SCSS
- 🚀 [Quick Start Guide](docs/QUICK_START.md) - Get up and running in 5 minutes
- 💡 [Examples and Patterns](docs/EXAMPLES.md) - Practical code examples
- 🔧 [Troubleshooting Guide](docs/TROUBLESHOOTING.md) - Common issues and solutions

## Development Workflow

1. **Start development**: `npm run dev`
2. **Edit files**: Modify HTML, Markdown, or SCSS files
3. **See changes**: Browser automatically refreshes
4. **Build for production**: `npm run build`
5. **Deploy**: Push to GitHub or upload `_site` directory

## Browser Support

- Modern browsers (Chrome, Firefox, Safari, Edge)
- Internet Explorer 11+ (with autoprefixer)
- Mobile browsers (iOS Safari, Chrome Mobile)

## Requirements

- **Node.js** 16+ and npm
- **Ruby** 2.7+ and Bundler
- **Git** for version control

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally with `npm run dev`
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- 📖 Check the [documentation](docs/)
- 🐛 Report issues in the GitHub issue tracker
- 💬 Ask questions in GitHub Discussions
- 🎯 Follow the [troubleshooting guide](docs/TROUBLESHOOTING.md)

---

Built with ❤️ using [Jekyll](https://jekyllrb.com/) and [Tailwind CSS](https://tailwindcss.com/)