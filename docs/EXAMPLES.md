# CSS Examples and Patterns

This document provides practical examples of combining Tailwind CSS utilities with custom SCSS in Jekyll templates.

## Layout Examples

### Modern Blog Layout

```html
<!-- _layouts/post.html -->
---
layout: default
---

<article class="max-w-4xl mx-auto px-4 py-8">
  <!-- Post header -->
  <header class="mb-8 pb-8 border-b border-gray-200">
    <div class="mb-4">
      <time datetime="{{ page.date | date_to_xmlschema }}" 
            class="text-sm text-gray-500 font-medium">
        {{ page.date | date: "%B %d, %Y" }}
      </time>
      {% if page.categories.size > 0 %}
      <span class="mx-2 text-gray-300">•</span>
      <div class="inline-flex space-x-2">
        {% for category in page.categories %}
        <span class="bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded-full">
          {{ category }}
        </span>
        {% endfor %}
      </div>
      {% endif %}
    </div>
    
    <h1 class="text-3xl md:text-4xl lg:text-5xl font-bold text-gray-900 leading-tight mb-4">
      {{ page.title }}
    </h1>
    
    {% if page.excerpt %}
    <p class="text-xl text-gray-600 leading-relaxed">
      {{ page.excerpt | strip_html }}
    </p>
    {% endif %}
  </header>
  
  <!-- Post content -->
  <div class="prose prose-lg max-w-none">
    {{ content }}
  </div>
  
  <!-- Post footer -->
  <footer class="mt-12 pt-8 border-t border-gray-200">
    <div class="flex flex-col sm:flex-row sm:justify-between sm:items-center">
      <div class="mb-4 sm:mb-0">
        <p class="text-sm text-gray-500">
          Published by <span class="font-medium text-gray-900">{{ site.author }}</span>
        </p>
      </div>
      
      <!-- Social sharing -->
      <div class="flex space-x-4">
        <a href="https://twitter.com/intent/tweet?url={{ page.url | absolute_url }}&text={{ page.title }}"
           class="text-gray-400 hover:text-blue-500 transition-colors">
          <span class="sr-only">Share on Twitter</span>
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <!-- Twitter icon -->
          </svg>
        </a>
        <a href="https://www.facebook.com/sharer/sharer.php?u={{ page.url | absolute_url }}"
           class="text-gray-400 hover:text-blue-600 transition-colors">
          <span class="sr-only">Share on Facebook</span>
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <!-- Facebook icon -->
          </svg>
        </a>
      </div>
    </div>
  </footer>
</article>
```

### Portfolio Grid Layout

```html
<!-- portfolio.html -->
---
layout: default
---

<div class="container mx-auto px-4 py-12">
  <header class="text-center mb-12">
    <h1 class="text-4xl md:text-5xl font-bold text-gray-900 mb-4">
      {{ page.title }}
    </h1>
    <p class="text-xl text-gray-600 max-w-2xl mx-auto">
      {{ page.description }}
    </p>
  </header>
  
  <!-- Filter buttons -->
  <div class="flex flex-wrap justify-center gap-2 mb-8">
    <button class="filter-btn active" data-filter="all">All</button>
    <button class="filter-btn" data-filter="web">Web Design</button>
    <button class="filter-btn" data-filter="mobile">Mobile Apps</button>
    <button class="filter-btn" data-filter="branding">Branding</button>
  </div>
  
  <!-- Portfolio grid -->
  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
    {% for project in site.data.portfolio %}
    <div class="portfolio-item" data-category="{{ project.category }}">
      <div class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-xl transition-shadow duration-300">
        <div class="relative group">
          <img src="{{ project.image }}" alt="{{ project.title }}" 
               class="w-full h-64 object-cover">
          <div class="absolute inset-0 bg-black bg-opacity-0 group-hover:bg-opacity-50 transition-all duration-300 flex items-center justify-center">
            <div class="opacity-0 group-hover:opacity-100 transition-opacity duration-300">
              <a href="{{ project.url }}" 
                 class="bg-white text-gray-900 px-4 py-2 rounded-md font-medium hover:bg-gray-100 transition-colors">
                View Project
              </a>
            </div>
          </div>
        </div>
        
        <div class="p-6">
          <h3 class="text-xl font-semibold text-gray-900 mb-2">
            {{ project.title }}
          </h3>
          <p class="text-gray-600 mb-4">
            {{ project.description }}
          </p>
          <div class="flex flex-wrap gap-2">
            {% for tech in project.technologies %}
            <span class="bg-gray-100 text-gray-700 text-sm px-2 py-1 rounded">
              {{ tech }}
            </span>
            {% endfor %}
          </div>
        </div>
      </div>
    </div>
    {% endfor %}
  </div>
</div>
```

## Component Examples

### Custom Button Components (SCSS)

```scss
// assets/scss/_components.scss

// Base button styles
.btn {
  @apply inline-flex items-center justify-center px-4 py-2 border border-transparent text-sm font-medium rounded-md;
  @apply focus:outline-none focus:ring-2 focus:ring-offset-2;
  @apply transition-all duration-200 ease-in-out;
  @apply disabled:opacity-50 disabled:cursor-not-allowed;
  
  // Size variants
  &.btn-sm {
    @apply px-3 py-1.5 text-xs;
  }
  
  &.btn-lg {
    @apply px-6 py-3 text-base;
  }
  
  &.btn-xl {
    @apply px-8 py-4 text-lg;
  }
  
  // Style variants
  &.btn-primary {
    @apply bg-blue-600 text-white border-blue-600;
    @apply hover:bg-blue-700 hover:border-blue-700;
    @apply focus:ring-blue-500;
    
    &:active {
      @apply bg-blue-800 border-blue-800;
    }
  }
  
  &.btn-secondary {
    @apply bg-gray-600 text-white border-gray-600;
    @apply hover:bg-gray-700 hover:border-gray-700;
    @apply focus:ring-gray-500;
  }
  
  &.btn-outline {
    @apply bg-transparent text-blue-600 border-blue-600;
    @apply hover:bg-blue-600 hover:text-white;
    @apply focus:ring-blue-500;
  }
  
  &.btn-ghost {
    @apply bg-transparent text-gray-600 border-transparent;
    @apply hover:bg-gray-100 hover:text-gray-900;
    @apply focus:ring-gray-500;
  }
  
  // Icon support
  .btn-icon {
    @apply w-4 h-4;
    
    &.btn-icon-left {
      @apply -ml-1 mr-2;
    }
    
    &.btn-icon-right {
      @apply ml-2 -mr-1;
    }
  }
}

// Loading state
.btn-loading {
  @apply relative text-transparent;
  
  &::after {
    content: '';
    @apply absolute inset-0 flex items-center justify-center;
    @apply w-4 h-4 border-2 border-current border-t-transparent rounded-full;
    animation: spin 1s linear infinite;
  }
}

@keyframes spin {
  to {
    transform: rotate(360deg);
  }
}
```

### Card Components

```scss
// Card base styles
.card {
  @apply bg-white rounded-lg shadow-md overflow-hidden;
  @apply transition-shadow duration-300;
  
  &:hover {
    @apply shadow-lg;
  }
  
  .card-header {
    @apply p-6 pb-0;
  }
  
  .card-body {
    @apply p-6;
  }
  
  .card-footer {
    @apply p-6 pt-0 border-t border-gray-200;
  }
  
  // Card variants
  &.card-bordered {
    @apply border border-gray-200 shadow-sm;
  }
  
  &.card-elevated {
    @apply shadow-xl;
  }
  
  &.card-flat {
    @apply shadow-none border border-gray-200;
  }
}

// Specialized card types
.feature-card {
  @apply card text-center;
  
  .feature-icon {
    @apply w-12 h-12 mx-auto mb-4 text-blue-600;
  }
  
  .feature-title {
    @apply text-xl font-semibold text-gray-900 mb-2;
  }
  
  .feature-description {
    @apply text-gray-600;
  }
}

.testimonial-card {
  @apply card relative;
  
  &::before {
    content: '"';
    @apply absolute top-4 left-6 text-4xl text-blue-600 font-serif;
  }
  
  .testimonial-content {
    @apply pt-8 pb-4 px-6 text-gray-700 italic;
  }
  
  .testimonial-author {
    @apply px-6 pb-6;
    
    .author-name {
      @apply font-semibold text-gray-900;
    }
    
    .author-title {
      @apply text-sm text-gray-500;
    }
  }
}
```

### Navigation Components

```scss
// Main navigation
.main-nav {
  @apply bg-white shadow-sm sticky top-0 z-50;
  
  .nav-container {
    @apply container mx-auto px-4;
  }
  
  .nav-content {
    @apply flex justify-between items-center py-4;
  }
  
  .nav-brand {
    @apply text-xl font-bold text-blue-600;
    @apply hover:text-blue-700 transition-colors;
  }
  
  .nav-menu {
    @apply hidden md:flex space-x-8;
    
    .nav-link {
      @apply text-gray-700 hover:text-blue-600 font-medium;
      @apply transition-colors duration-200;
      @apply relative;
      
      &.active {
        @apply text-blue-600;
        
        &::after {
          content: '';
          @apply absolute bottom-0 left-0 w-full h-0.5 bg-blue-600;
          transform: translateY(100%);
        }
      }
    }
  }
  
  .nav-toggle {
    @apply md:hidden p-2 text-gray-700 hover:text-blue-600;
    @apply transition-colors duration-200;
  }
  
  // Mobile menu
  .nav-mobile {
    @apply md:hidden border-t border-gray-200 py-4;
    
    .nav-link {
      @apply block py-2 text-gray-700 hover:text-blue-600;
      @apply transition-colors duration-200;
    }
  }
}

// Breadcrumb navigation
.breadcrumb {
  @apply flex items-center space-x-2 text-sm text-gray-500 mb-6;
  
  .breadcrumb-item {
    @apply flex items-center;
    
    &:not(:last-child)::after {
      content: '/';
      @apply ml-2 text-gray-400;
    }
    
    a {
      @apply text-blue-600 hover:text-blue-800;
      @apply transition-colors duration-200;
    }
    
    &:last-child {
      @apply text-gray-900 font-medium;
    }
  }
}

// Pagination
.pagination {
  @apply flex justify-center items-center space-x-2 mt-8;
  
  .page-link {
    @apply px-3 py-2 text-sm font-medium text-gray-700;
    @apply border border-gray-300 rounded-md;
    @apply hover:bg-gray-50 hover:text-blue-600;
    @apply transition-colors duration-200;
    
    &.active {
      @apply bg-blue-600 text-white border-blue-600;
      @apply hover:bg-blue-700;
    }
    
    &.disabled {
      @apply text-gray-400 cursor-not-allowed;
      @apply hover:bg-transparent hover:text-gray-400;
    }
  }
  
  .page-prev,
  .page-next {
    @apply flex items-center;
    
    svg {
      @apply w-4 h-4;
    }
  }
}
```

## Form Examples

### Contact Form with Validation Styles

```html
<!-- contact-form.html -->
<form class="max-w-2xl mx-auto" id="contact-form">
  <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
    <div class="form-group">
      <label for="firstName" class="form-label">First Name</label>
      <input type="text" id="firstName" name="firstName" required
             class="form-input">
      <div class="form-error hidden">Please enter your first name</div>
    </div>
    
    <div class="form-group">
      <label for="lastName" class="form-label">Last Name</label>
      <input type="text" id="lastName" name="lastName" required
             class="form-input">
      <div class="form-error hidden">Please enter your last name</div>
    </div>
  </div>
  
  <div class="form-group mb-6">
    <label for="email" class="form-label">Email Address</label>
    <input type="email" id="email" name="email" required
           class="form-input">
    <div class="form-error hidden">Please enter a valid email address</div>
  </div>
  
  <div class="form-group mb-6">
    <label for="subject" class="form-label">Subject</label>
    <select id="subject" name="subject" required class="form-select">
      <option value="">Choose a subject</option>
      <option value="general">General Inquiry</option>
      <option value="support">Support</option>
      <option value="business">Business</option>
    </select>
    <div class="form-error hidden">Please select a subject</div>
  </div>
  
  <div class="form-group mb-6">
    <label for="message" class="form-label">Message</label>
    <textarea id="message" name="message" rows="5" required
              class="form-textarea"></textarea>
    <div class="form-error hidden">Please enter your message</div>
  </div>
  
  <div class="form-group mb-6">
    <label class="flex items-start">
      <input type="checkbox" required class="form-checkbox">
      <span class="ml-2 text-sm text-gray-600">
        I agree to the <a href="/privacy" class="text-blue-600 hover:underline">Privacy Policy</a>
        and <a href="/terms" class="text-blue-600 hover:underline">Terms of Service</a>
      </span>
    </label>
  </div>
  
  <button type="submit" class="btn btn-primary btn-lg w-full">
    <span class="btn-text">Send Message</span>
    <svg class="btn-icon btn-icon-right hidden" fill="none" stroke="currentColor" viewBox="0 0 24 24">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"></path>
    </svg>
  </button>
</form>
```

### Form Styles (SCSS)

```scss
// Form components
.form-group {
  @apply relative;
  
  &.has-error {
    .form-input,
    .form-select,
    .form-textarea {
      @apply border-red-500 focus:border-red-500 focus:ring-red-500;
    }
    
    .form-error {
      @apply block;
    }
  }
  
  &.has-success {
    .form-input,
    .form-select,
    .form-textarea {
      @apply border-green-500 focus:border-green-500 focus:ring-green-500;
    }
  }
}

.form-label {
  @apply block text-sm font-medium text-gray-700 mb-2;
  
  &.required::after {
    content: '*';
    @apply text-red-500 ml-1;
  }
}

.form-input,
.form-select,
.form-textarea {
  @apply w-full px-3 py-2 border border-gray-300 rounded-md;
  @apply focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent;
  @apply transition-colors duration-200;
  @apply placeholder-gray-400;
  
  &:disabled {
    @apply bg-gray-100 text-gray-500 cursor-not-allowed;
  }
}

.form-textarea {
  @apply resize-vertical;
}

.form-checkbox,
.form-radio {
  @apply w-4 h-4 text-blue-600 border-gray-300 rounded;
  @apply focus:ring-blue-500 focus:ring-2;
}

.form-error {
  @apply text-red-600 text-sm mt-1;
}

.form-help {
  @apply text-gray-500 text-sm mt-1;
}

// Input groups
.input-group {
  @apply flex;
  
  .input-group-prepend,
  .input-group-append {
    @apply flex items-center px-3 bg-gray-100 border border-gray-300;
    @apply text-gray-700 text-sm;
  }
  
  .input-group-prepend {
    @apply rounded-l-md border-r-0;
  }
  
  .input-group-append {
    @apply rounded-r-md border-l-0;
  }
  
  .form-input {
    @apply rounded-none;
    
    &:first-child {
      @apply rounded-l-md;
    }
    
    &:last-child {
      @apply rounded-r-md;
    }
  }
}
```

## Animation Examples

### CSS Animations with Tailwind

```scss
// Custom animations
@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes slideInLeft {
  from {
    opacity: 0;
    transform: translateX(-30px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

@keyframes pulse-slow {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: 0.5;
  }
}

// Animation utility classes
.animate-fade-in-up {
  animation: fadeInUp 0.6s ease-out;
}

.animate-slide-in-left {
  animation: slideInLeft 0.6s ease-out;
}

.animate-pulse-slow {
  animation: pulse-slow 3s ease-in-out infinite;
}

// Staggered animations
.stagger-animation {
  > * {
    opacity: 0;
    animation: fadeInUp 0.6s ease-out forwards;
    
    @for $i from 1 through 10 {
      &:nth-child(#{$i}) {
        animation-delay: #{$i * 0.1}s;
      }
    }
  }
}

// Hover animations
.hover-lift {
  @apply transition-transform duration-300;
  
  &:hover {
    @apply -translate-y-1;
  }
}

.hover-scale {
  @apply transition-transform duration-300;
  
  &:hover {
    @apply scale-105;
  }
}

.hover-glow {
  @apply transition-shadow duration-300;
  
  &:hover {
    box-shadow: 0 0 20px rgba(59, 130, 246, 0.5);
  }
}
```

### JavaScript Integration

```html
<!-- Intersection Observer for animations -->
<script>
// Animate elements when they come into view
const observerOptions = {
  threshold: 0.1,
  rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver((entries) => {
  entries.forEach(entry => {
    if (entry.isIntersecting) {
      entry.target.classList.add('animate-fade-in-up');
      observer.unobserve(entry.target);
    }
  });
}, observerOptions);

// Observe all elements with animation class
document.querySelectorAll('.animate-on-scroll').forEach(el => {
  observer.observe(el);
});

// Staggered animations
document.querySelectorAll('.stagger-container').forEach(container => {
  const children = container.children;
  Array.from(children).forEach((child, index) => {
    child.style.animationDelay = `${index * 0.1}s`;
    child.classList.add('animate-fade-in-up');
  });
});
</script>
```

These examples demonstrate how to effectively combine Tailwind CSS utilities with custom SCSS to create modern, responsive, and interactive web components in Jekyll.