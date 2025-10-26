# Quick Start Guide

## Getting Started in 5 Minutes

### 1. Setup Development Environment

Run the setup script to install dependencies and configure everything:

```bash
# On macOS/Linux
./scripts/setup-dev.sh

# On Windows
scripts\setup-dev.bat

# Or using Make
make setup
```

### 2. Start Development Server

```bash
# Start development with CSS watching and live reload
npm run dev

# Or using Make
make dev
```

Your site will be available at `http://localhost:4000` with automatic reloading.

### 3. Start Styling

#### Using Tailwind Utilities

Add utility classes directly to your HTML:

```html
<!-- In _layouts/default.html -->
<header class="bg-white shadow-lg">
  <nav class="container mx-auto px-4 py-6">
    <h1 class="text-2xl font-bold text-gray-900">{{ site.title }}</h1>
  </nav>
</header>

<main class="container mx-auto px-4 py-8">
  <div class="prose max-w-none">
    {{ content }}
  </div>
</main>
```

#### Using Custom SCSS

Add custom styles in `assets/scss/_components.scss`:

```scss
.hero-section {
  @apply bg-gradient-to-r from-blue-500 to-purple-600 text-white py-20;
  
  .hero-title {
    @apply text-4xl md:text-6xl font-bold mb-4;
  }
  
  .hero-subtitle {
    @apply text-xl opacity-90;
  }
}
```

Then use it in your templates:

```html
<section class="hero-section">
  <div class="container mx-auto px-4 text-center">
    <h1 class="hero-title">Welcome to My Site</h1>
    <p class="hero-subtitle">Built with Jekyll and Tailwind CSS</p>
  </div>
</section>
```

## Common Patterns

### Responsive Navigation

```html
<!-- _includes/header.html -->
<header class="bg-white shadow-sm">
  <nav class="container mx-auto px-4">
    <div class="flex justify-between items-center py-4">
      <a href="{{ "/" | relative_url }}" class="text-xl font-bold text-blue-600">
        {{ site.title }}
      </a>
      
      <!-- Desktop menu -->
      <ul class="hidden md:flex space-x-8">
        <li><a href="{{ "/" | relative_url }}" class="text-gray-700 hover:text-blue-600">Home</a></li>
        <li><a href="{{ "/about/" | relative_url }}" class="text-gray-700 hover:text-blue-600">About</a></li>
        <li><a href="{{ "/blog/" | relative_url }}" class="text-gray-700 hover:text-blue-600">Blog</a></li>
      </ul>
      
      <!-- Mobile menu button -->
      <button class="md:hidden" onclick="toggleMobileMenu()">
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
        </svg>
      </button>
    </div>
    
    <!-- Mobile menu -->
    <div id="mobile-menu" class="hidden md:hidden pb-4">
      <a href="{{ "/" | relative_url }}" class="block py-2 text-gray-700 hover:text-blue-600">Home</a>
      <a href="{{ "/about/" | relative_url }}" class="block py-2 text-gray-700 hover:text-blue-600">About</a>
      <a href="{{ "/blog/" | relative_url }}" class="block py-2 text-gray-700 hover:text-blue-600">Blog</a>
    </div>
  </nav>
</header>

<script>
function toggleMobileMenu() {
  const menu = document.getElementById('mobile-menu');
  menu.classList.toggle('hidden');
}
</script>
```

### Blog Post Cards

```html
<!-- _includes/post-card.html -->
<article class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow duration-300">
  {% if post.image %}
  <img src="{{ post.image }}" alt="{{ post.title }}" class="w-full h-48 object-cover">
  {% endif %}
  
  <div class="p-6">
    <div class="flex items-center text-sm text-gray-500 mb-2">
      <time datetime="{{ post.date | date_to_xmlschema }}">
        {{ post.date | date: "%B %d, %Y" }}
      </time>
      {% if post.categories.size > 0 %}
      <span class="mx-2">•</span>
      <span>{{ post.categories | join: ", " }}</span>
      {% endif %}
    </div>
    
    <h2 class="text-xl font-semibold mb-3">
      <a href="{{ post.url | relative_url }}" class="text-gray-900 hover:text-blue-600 transition-colors">
        {{ post.title }}
      </a>
    </h2>
    
    <p class="text-gray-600 mb-4 leading-relaxed">
      {{ post.excerpt | strip_html | truncate: 150 }}
    </p>
    
    <a href="{{ post.url | relative_url }}" class="inline-flex items-center text-blue-600 hover:text-blue-800 font-medium">
      Read more
      <svg class="w-4 h-4 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
      </svg>
    </a>
  </div>
</article>
```

### Contact Form

```html
<!-- contact.html -->
<form class="max-w-lg mx-auto">
  <div class="mb-6">
    <label for="name" class="block text-sm font-medium text-gray-700 mb-2">Name</label>
    <input type="text" id="name" name="name" required
           class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent">
  </div>
  
  <div class="mb-6">
    <label for="email" class="block text-sm font-medium text-gray-700 mb-2">Email</label>
    <input type="email" id="email" name="email" required
           class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent">
  </div>
  
  <div class="mb-6">
    <label for="message" class="block text-sm font-medium text-gray-700 mb-2">Message</label>
    <textarea id="message" name="message" rows="4" required
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"></textarea>
  </div>
  
  <button type="submit" 
          class="w-full bg-blue-600 text-white py-2 px-4 rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition-colors">
    Send Message
  </button>
</form>
```

## Development Workflow

### Daily Development

1. **Start development server**: `npm run dev`
2. **Edit files**: Make changes to HTML, Markdown, or SCSS files
3. **See changes**: Browser automatically refreshes with your changes
4. **Build for production**: `npm run build` when ready to deploy

### File Organization

- **Layouts**: `_layouts/` - Page templates
- **Includes**: `_includes/` - Reusable components
- **Posts**: `_posts/` - Blog posts
- **SCSS**: `assets/scss/` - Custom styles
- **Generated CSS**: `assets/css/` - Compiled output (don't edit directly)

### Available Commands

```bash
# Development
npm run dev          # Start development with watching
npm run dev:fast     # Start development without CSS watching
npm run serve        # Jekyll server only

# Building
npm run build        # Production build
npm run build:dev    # Development build

# CSS
npm run build:css-dev   # Build CSS once
npm run watch:css       # Watch CSS changes
npm run build:css-prod  # Build optimized CSS

# Utilities
npm run clean        # Clean build files
npm run check:tailwind  # Verify Tailwind setup
npm run check:jekyll    # Verify Jekyll setup
```

### Using Make (Alternative)

```bash
make dev            # Start development
make build          # Production build
make clean          # Clean files
make setup          # Initial setup
make help           # Show all commands
```

## Next Steps

1. **Customize colors**: Edit `tailwind.config.js` to match your brand
2. **Add components**: Create reusable components in `assets/scss/_components.scss`
3. **Optimize images**: Add responsive images with Tailwind classes
4. **Add animations**: Use Tailwind's transition and animation utilities
5. **Deploy**: Use the GitHub Actions workflow for automated deployment

## Need Help?

- 📖 [Full CSS System Documentation](CSS_SYSTEM.md)
- 🎨 [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- 🏗️ [Jekyll Documentation](https://jekyllrb.com/docs/)
- 💡 [Examples and Patterns](EXAMPLES.md)