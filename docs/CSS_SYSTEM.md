# CSS System Documentation

## Overview

This Jekyll site uses a hybrid CSS system that combines **Tailwind CSS** utilities with **SCSS** preprocessing, while maintaining compatibility with the **Minima** theme. This approach gives you the flexibility to use utility classes for rapid development and custom SCSS for complex styling needs.

## Architecture

### CSS Processing Pipeline

```
SCSS Source Files → Jekyll SASS Processor → Compiled CSS
Tailwind Config → PostCSS + Tailwind → Generated CSS
                                    ↓
                            Final CSS Output
```

### File Structure

```
assets/
├── css/
│   ├── main.scss          # Main SCSS entry point (Jekyll processed)
│   └── tailwind.css       # Generated Tailwind CSS (build artifact)
├── scss/
│   ├── _variables.scss    # Custom variables and Minima overrides
│   ├── _components.scss   # Custom component styles
│   ├── _utilities.scss    # Custom utility classes
│   ├── _tailwind.scss     # Tailwind integration layer
│   ├── _minima-overrides.scss # Minima theme customizations
│   └── _tailwind-input.scss   # Tailwind CLI input file
```

## Using Tailwind CSS

### Basic Utility Classes

Tailwind provides utility classes for common styling needs:

```html
<!-- Layout -->
<div class="container mx-auto px-4">
  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
    <!-- Content -->
  </div>
</div>

<!-- Typography -->
<h1 class="text-3xl font-bold text-gray-900 mb-4">Heading</h1>
<p class="text-gray-600 leading-relaxed">Paragraph text</p>

<!-- Buttons -->
<button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
  Click me
</button>

<!-- Cards -->
<div class="bg-white shadow-lg rounded-lg p-6">
  <h2 class="text-xl font-semibold mb-2">Card Title</h2>
  <p class="text-gray-600">Card content</p>
</div>
```

### Responsive Design

Tailwind uses mobile-first responsive prefixes:

```html
<!-- Responsive grid -->
<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4">
  <!-- Items -->
</div>

<!-- Responsive text -->
<h1 class="text-xl sm:text-2xl md:text-3xl lg:text-4xl">
  Responsive heading
</h1>

<!-- Responsive spacing -->
<div class="p-4 md:p-6 lg:p-8">
  <!-- Content with responsive padding -->
</div>
```

### Custom Component Classes

Pre-built component classes are available in `_tailwind-input.scss`:

```html
<!-- Custom prose styling -->
<article class="prose-custom">
  <h1>Article Title</h1>
  <p>Article content with custom styling...</p>
</article>

<!-- Button components -->
<button class="btn btn-primary">Primary Button</button>
<button class="btn btn-secondary">Secondary Button</button>
```

## Using SCSS

### Variables

Define custom variables in `assets/scss/_variables.scss`:

```scss
// Custom colors
$primary-color: #2563eb;
$secondary-color: #64748b;
$accent-color: #f59e0b;

// Typography
$font-family-base: 'Inter', system-ui, sans-serif;
$font-size-base: 1rem;
$line-height-base: 1.6;

// Spacing
$spacing-unit: 1rem;
$container-max-width: 1200px;

// Breakpoints (should match Tailwind config)
$breakpoint-sm: 640px;
$breakpoint-md: 768px;
$breakpoint-lg: 1024px;
$breakpoint-xl: 1280px;
```

### Mixins

Create reusable mixins for common patterns:

```scss
// Responsive breakpoint mixin
@mixin respond-to($breakpoint) {
  @if $breakpoint == sm {
    @media (min-width: $breakpoint-sm) { @content; }
  }
  @if $breakpoint == md {
    @media (min-width: $breakpoint-md) { @content; }
  }
  @if $breakpoint == lg {
    @media (min-width: $breakpoint-lg) { @content; }
  }
}

// Button mixin
@mixin button-style($bg-color, $text-color: white) {
  background-color: $bg-color;
  color: $text-color;
  padding: 0.5rem 1rem;
  border-radius: 0.375rem;
  border: none;
  cursor: pointer;
  transition: background-color 0.2s;
  
  &:hover {
    background-color: darken($bg-color, 10%);
  }
}
```

### Component Styles

Create component styles in `assets/scss/_components.scss`:

```scss
// Navigation component
.site-nav {
  background: white;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  
  .nav-list {
    display: flex;
    list-style: none;
    margin: 0;
    padding: 0;
  }
  
  .nav-item {
    margin-right: 2rem;
    
    a {
      color: $primary-color;
      text-decoration: none;
      font-weight: 500;
      
      &:hover {
        color: darken($primary-color, 15%);
      }
      
      &.active {
        color: $accent-color;
      }
    }
  }
}

// Article component
.article {
  max-width: 65ch;
  margin: 0 auto;
  
  .article-header {
    margin-bottom: 2rem;
    
    .article-title {
      font-size: 2.5rem;
      font-weight: 700;
      line-height: 1.2;
      margin-bottom: 0.5rem;
    }
    
    .article-meta {
      color: $secondary-color;
      font-size: 0.875rem;
    }
  }
  
  .article-content {
    line-height: 1.7;
    
    h2, h3, h4 {
      margin-top: 2rem;
      margin-bottom: 1rem;
    }
    
    p {
      margin-bottom: 1rem;
    }
    
    code {
      background: #f3f4f6;
      padding: 0.125rem 0.25rem;
      border-radius: 0.25rem;
      font-size: 0.875em;
    }
    
    pre {
      background: #1f2937;
      color: #f9fafb;
      padding: 1rem;
      border-radius: 0.5rem;
      overflow-x: auto;
      margin: 1rem 0;
      
      code {
        background: none;
        padding: 0;
      }
    }
  }
}
```

## Combining Tailwind and SCSS

### Using Tailwind in SCSS

You can use Tailwind utilities within SCSS using the `@apply` directive:

```scss
.custom-button {
  @apply px-4 py-2 bg-blue-500 text-white rounded;
  
  // Add custom styles
  transition: all 0.3s ease;
  
  &:hover {
    @apply bg-blue-600;
    transform: translateY(-1px);
  }
  
  &.large {
    @apply px-6 py-3 text-lg;
  }
}
```

### Accessing Tailwind Values in SCSS

Use Tailwind's theme function to access config values:

```scss
.custom-component {
  // Use Tailwind spacing values
  padding: theme('spacing.4');
  margin-bottom: theme('spacing.6');
  
  // Use Tailwind colors
  background-color: theme('colors.gray.100');
  border-color: theme('colors.gray.300');
  
  // Use Tailwind breakpoints
  @media (min-width: theme('screens.md')) {
    padding: theme('spacing.8');
  }
}
```

### Conditional Styling

Combine both approaches for complex conditional styling:

```scss
.card {
  @apply bg-white rounded-lg shadow;
  
  &.featured {
    @apply border-2 border-blue-500;
    
    .card-title {
      @apply text-blue-600;
    }
  }
  
  &.dark {
    @apply bg-gray-800 text-white;
    
    .card-content {
      @apply text-gray-300;
    }
  }
  
  // Responsive behavior
  @include respond-to(md) {
    @apply p-6;
  }
}
```

## Jekyll Integration

### Using CSS Classes in Layouts

In your Jekyll layouts (`_layouts/*.html`):

```html
<!DOCTYPE html>
<html lang="{{ page.lang | default: site.lang | default: "en" }}">
<head>
  <!-- Head content -->
</head>
<body class="bg-gray-50 text-gray-900">
  <header class="bg-white shadow-sm">
    <nav class="container mx-auto px-4 py-4">
      <div class="flex justify-between items-center">
        <a href="{{ "/" | relative_url }}" class="text-xl font-bold text-blue-600">
          {{ site.title }}
        </a>
        <ul class="flex space-x-6">
          <li><a href="{{ "/" | relative_url }}" class="hover:text-blue-600">Home</a></li>
          <li><a href="{{ "/about/" | relative_url }}" class="hover:text-blue-600">About</a></li>
        </ul>
      </div>
    </nav>
  </header>
  
  <main class="container mx-auto px-4 py-8">
    {{ content }}
  </main>
  
  <footer class="bg-gray-800 text-white py-8 mt-12">
    <div class="container mx-auto px-4 text-center">
      <p>&copy; {{ 'now' | date: "%Y" }} {{ site.title }}</p>
    </div>
  </footer>
</body>
</html>
```

### Using CSS Classes in Posts

In your blog posts (`_posts/*.md`):

```markdown
---
layout: post
title: "My Blog Post"
date: 2025-10-26
---

<div class="prose prose-lg max-w-none">

# {{ page.title }}

<div class="bg-blue-50 border-l-4 border-blue-400 p-4 mb-6">
  <p class="text-blue-800">This is a highlighted note using Tailwind classes.</p>
</div>

Regular markdown content here...

<div class="grid grid-cols-1 md:grid-cols-2 gap-6 my-8">
  <div class="bg-white p-6 rounded-lg shadow">
    <h3 class="text-lg font-semibold mb-2">Feature 1</h3>
    <p class="text-gray-600">Description of feature 1</p>
  </div>
  <div class="bg-white p-6 rounded-lg shadow">
    <h3 class="text-lg font-semibold mb-2">Feature 2</h3>
    <p class="text-gray-600">Description of feature 2</p>
  </div>
</div>

</div>
```

### Using CSS Classes in Includes

In your includes (`_includes/*.html`):

```html
<!-- _includes/post-card.html -->
<article class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-shadow">
  {% if post.image %}
  <img src="{{ post.image }}" alt="{{ post.title }}" class="w-full h-48 object-cover">
  {% endif %}
  
  <div class="p-6">
    <h2 class="text-xl font-semibold mb-2">
      <a href="{{ post.url | relative_url }}" class="text-gray-900 hover:text-blue-600">
        {{ post.title }}
      </a>
    </h2>
    
    <p class="text-gray-600 mb-4">{{ post.excerpt | strip_html | truncate: 150 }}</p>
    
    <div class="flex justify-between items-center text-sm text-gray-500">
      <time datetime="{{ post.date | date_to_xmlschema }}">
        {{ post.date | date: "%B %d, %Y" }}
      </time>
      {% if post.categories.size > 0 %}
      <div class="flex space-x-2">
        {% for category in post.categories %}
        <span class="bg-gray-100 text-gray-700 px-2 py-1 rounded text-xs">
          {{ category }}
        </span>
        {% endfor %}
      </div>
      {% endif %}
    </div>
  </div>
</article>
```

## Best Practices

### 1. Utility-First Approach

Start with Tailwind utilities for most styling needs:

```html
<!-- Good: Use utilities first -->
<button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
  Button
</button>

<!-- Avoid: Creating custom classes for simple styling -->
<button class="custom-blue-button">Button</button>
```

### 2. Component Classes for Reusable Patterns

Create component classes when you have repeated complex patterns:

```scss
// Good: Component class for complex, reusable pattern
.article-card {
  @apply bg-white rounded-lg shadow-md p-6;
  
  .title {
    @apply text-xl font-semibold mb-2 text-gray-900;
  }
  
  .excerpt {
    @apply text-gray-600 mb-4;
  }
  
  .meta {
    @apply text-sm text-gray-500 flex justify-between;
  }
}
```

### 3. Consistent Spacing and Colors

Use Tailwind's design system for consistency:

```html
<!-- Good: Consistent spacing -->
<div class="space-y-4">
  <div class="mb-4">Item 1</div>
  <div class="mb-4">Item 2</div>
  <div class="mb-4">Item 3</div>
</div>

<!-- Good: Consistent colors -->
<div class="text-gray-600 bg-gray-50 border-gray-200">
  Content
</div>
```

### 4. Responsive Design

Always consider mobile-first responsive design:

```html
<!-- Good: Mobile-first responsive -->
<div class="text-sm sm:text-base md:text-lg lg:text-xl">
  Responsive text
</div>

<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
  <!-- Responsive grid -->
</div>
```

### 5. Performance Considerations

- Use Tailwind's purge feature in production to remove unused styles
- Avoid creating too many custom component classes
- Leverage Tailwind's JIT (Just-In-Time) compilation for faster builds

## Troubleshooting

### Common Issues

1. **Styles not applying**: Check that Tailwind CSS is being built and included
2. **Classes not found**: Ensure classes are included in the content scanning paths
3. **SCSS compilation errors**: Check syntax and import paths
4. **Build performance**: Use JIT mode and proper purging configuration

### Debug Commands

```bash
# Check if Tailwind is working
npm run check:tailwind

# Check if Jekyll is working
npm run check:jekyll

# Lint CSS for unused classes
npm run lint:css

# Clean and rebuild everything
npm run clean && npm run build
```

### Getting Help

- Check the [Tailwind CSS documentation](https://tailwindcss.com/docs)
- Review the [Jekyll documentation](https://jekyllrb.com/docs/)
- Look at the project's issue tracker for common problems
- Use browser developer tools to inspect generated CSS