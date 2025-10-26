# Troubleshooting Guide

## Common Issues and Solutions

### Development Setup Issues

#### 1. Tailwind CSS not building

**Problem**: CSS changes aren't being applied or Tailwind classes aren't working.

**Solutions**:
```bash
# Check if Tailwind CLI is installed
npm run check:tailwind

# Rebuild CSS manually
npm run build:css-dev

# Clean and rebuild everything
npm run clean && npm run build:css-dev

# Check if the CSS file is being generated
ls -la assets/css/tailwind.css
```

**Common causes**:
- Node.js dependencies not installed (`npm install`)
- Tailwind config file has syntax errors
- Input file path is incorrect in package.json scripts

#### 2. Jekyll server not starting

**Problem**: `bundle exec jekyll serve` fails or shows errors.

**Solutions**:
```bash
# Check Jekyll installation
npm run check:jekyll

# Install Ruby dependencies
bundle install

# Check for port conflicts
bundle exec jekyll serve --port 4001

# Clear Jekyll cache
bundle exec jekyll clean
```

**Common causes**:
- Ruby gems not installed (`bundle install`)
- Port 4000 already in use
- Jekyll cache corruption
- Missing or invalid `_config.yml`

#### 3. Live reload not working

**Problem**: Browser doesn't refresh automatically when files change.

**Solutions**:
```bash
# Use the development script with live reload
npm run dev

# Or start Jekyll with live reload manually
bundle exec jekyll serve --livereload

# Check if the live reload script is included in your layout
# Should see: <script src="http://localhost:35729/livereload.js"></script>
```

**Common causes**:
- Live reload not enabled in Jekyll command
- Browser blocking the live reload script
- Firewall blocking port 35729

### CSS and Styling Issues

#### 4. Tailwind classes not applying

**Problem**: Tailwind utility classes have no effect on elements.

**Diagnostic steps**:
```bash
# Check if CSS is being included in your layout
# Look for: <link rel="stylesheet" href="/assets/css/main.css">

# Verify CSS is being generated
cat assets/css/tailwind.css | head -20

# Check browser developer tools for CSS loading errors
```

**Solutions**:
- Ensure `assets/css/main.scss` imports Tailwind CSS
- Check that the CSS file is linked in your layout
- Verify Tailwind config `content` paths include your templates
- Clear browser cache (Ctrl+F5 or Cmd+Shift+R)

#### 5. SCSS compilation errors

**Problem**: SCSS files fail to compile with syntax errors.

**Common errors and fixes**:
```scss
// Error: Invalid CSS after "@apply": expected 1 selector or at-rule
// Fix: Ensure @apply is used correctly
.my-class {
  @apply text-blue-500 font-bold; // Correct
  // @apply: text-blue-500; // Incorrect
}

// Error: Undefined variable
// Fix: Import variables file or define the variable
@import "../scss/variables"; // Add this import
$my-color: #blue; // Or define the variable

// Error: Invalid nesting
// Fix: Proper SCSS nesting syntax
.parent {
  .child {
    color: blue;
  }
  
  &:hover {
    color: red;
  }
}
```

#### 6. Styles not updating in development

**Problem**: CSS changes don't appear in the browser during development.

**Solutions**:
```bash
# Restart the development server
# Stop with Ctrl+C, then:
npm run dev

# Force rebuild CSS
npm run build:css-dev

# Clear all caches
npm run clean
bundle exec jekyll clean
# Then restart: npm run dev
```

**Check these files**:
- Browser cache (hard refresh)
- Jekyll `_site` directory (should regenerate)
- CSS source maps in browser dev tools

### Build and Deployment Issues

#### 7. Production build failures

**Problem**: `npm run build` fails or produces incorrect output.

**Solutions**:
```bash
# Check for Node.js environment issues
NODE_ENV=production npm run build:css-prod

# Verify Tailwind purge configuration
# Check tailwind.config.js content paths

# Test production build locally
npm run build
bundle exec jekyll serve --source _site --skip-initial-build
```

**Common causes**:
- Purge configuration removing needed classes
- PostCSS plugin conflicts
- Missing environment variables

#### 8. GitHub Pages deployment issues

**Problem**: Site doesn't work correctly when deployed to GitHub Pages.

**Solutions**:
```yaml
# Check GitHub Actions workflow (.github/workflows/deploy.yml)
# Ensure it includes CSS building step:
- name: Build Tailwind CSS
  run: npm run build:css-prod

# Verify _config.yml has correct baseurl for GitHub Pages
baseurl: "/your-repo-name" # For project pages
# or
baseurl: "" # For user/organization pages
```

**Check deployment logs**:
- GitHub Actions tab in your repository
- Look for CSS build errors
- Verify all files are being deployed

### Performance Issues

#### 9. Slow build times

**Problem**: Development builds take too long.

**Solutions**:
```bash
# Use fast development mode (no CSS watching)
npm run dev:fast

# Enable Jekyll incremental builds
bundle exec jekyll serve --incremental --livereload

# Check Tailwind JIT mode is enabled
# In tailwind.config.js:
module.exports = {
  mode: 'jit', // Add this line
  // ... rest of config
}
```

#### 10. Large CSS file size

**Problem**: Generated CSS file is too large for production.

**Solutions**:
```javascript
// Ensure purge is enabled in tailwind.config.js
module.exports = {
  content: [
    './_layouts/**/*.html',
    './_includes/**/*.html',
    // ... other paths
  ],
  // Purge will automatically run in production
}
```

```bash
# Check CSS file size
ls -lh assets/css/tailwind.css

# Build with purging enabled
NODE_ENV=production npm run build:css-prod
```

### Browser Compatibility Issues

#### 11. Styles not working in older browsers

**Problem**: CSS doesn't work in Internet Explorer or older browsers.

**Solutions**:
```javascript
// Check autoprefixer configuration in postcss.config.js
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {
      overrideBrowserslist: [
        '> 1%',
        'last 2 versions',
        'IE 11'
      ]
    }
  }
}
```

#### 12. Mobile responsiveness issues

**Problem**: Responsive classes don't work on mobile devices.

**Solutions**:
```html
<!-- Ensure viewport meta tag is in your layout -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Test responsive classes -->
<div class="text-sm sm:text-base md:text-lg lg:text-xl">
  Responsive text
</div>
```

## Debugging Tools and Commands

### Useful Commands

```bash
# Development diagnostics
npm run check:tailwind    # Verify Tailwind CLI
npm run check:jekyll      # Verify Jekyll setup
npm run lint:css          # Check for unused CSS

# Build diagnostics
npm run build:css-dev     # Build CSS once
npm run clean             # Clean build artifacts
make info                 # Show project information (if using Make)

# Jekyll diagnostics
bundle exec jekyll doctor # Check Jekyll configuration
bundle exec jekyll build --verbose # Verbose build output
bundle list               # Show installed gems
```

### Browser Developer Tools

1. **Check CSS loading**:
   - Open Network tab
   - Reload page
   - Look for CSS files (main.css, tailwind.css)
   - Check for 404 errors

2. **Inspect element styles**:
   - Right-click element → Inspect
   - Check Computed styles
   - Look for overridden styles
   - Verify Tailwind classes are applied

3. **Console errors**:
   - Check for JavaScript errors
   - Look for CSS parsing errors
   - Check for missing resources

### File System Checks

```bash
# Verify file structure
tree assets/ -I node_modules

# Check file permissions
ls -la scripts/setup-dev.sh

# Verify generated files
ls -la _site/assets/css/
ls -la assets/css/

# Check configuration files
cat _config.yml | grep -E "(sass|css)"
cat package.json | grep -A 10 '"scripts"'
```

## Getting Help

### Before Asking for Help

1. **Check this troubleshooting guide**
2. **Run diagnostic commands**:
   ```bash
   npm run check:tailwind
   npm run check:jekyll
   make info  # If using Make
   ```
3. **Check browser console for errors**
4. **Try a clean rebuild**:
   ```bash
   npm run clean
   npm install
   bundle install
   npm run build:css-dev
   ```

### Information to Include

When reporting issues, include:

1. **Environment information**:
   ```bash
   node --version
   npm --version
   ruby --version
   bundle --version
   ```

2. **Error messages** (full output)
3. **Steps to reproduce** the issue
4. **Expected vs actual behavior**
5. **Recent changes** made to the project

### Resources

- [Tailwind CSS Documentation](https://tailwindcss.com/docs)
- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [SCSS Documentation](https://sass-lang.com/documentation)
- [PostCSS Documentation](https://postcss.org/)

### Community Support

- Jekyll Talk: [talk.jekyllrb.com](https://talk.jekyllrb.com/)
- Tailwind CSS Discord: [tailwindcss.com/discord](https://tailwindcss.com/discord)
- Stack Overflow: Use tags `jekyll`, `tailwindcss`, `scss`