/**
 * Development Configuration for Jekyll + Tailwind CSS
 * 
 * This file contains configuration options for the development workflow.
 * You can modify these settings to customize your development experience.
 */

module.exports = {
  // Development server settings
  server: {
    // Jekyll development server port
    jekyllPort: 4000,
    
    // Enable live reload for Jekyll
    liveReload: true,
    
    // Enable incremental builds for faster rebuilds
    incremental: true,
    
    // Host for development server (use 0.0.0.0 to allow external access)
    host: 'localhost'
  },

  // CSS build settings
  css: {
    // Input file for Tailwind CSS
    input: './assets/scss/_tailwind-input.scss',
    
    // Output file for compiled Tailwind CSS
    output: './assets/css/tailwind.css',
    
    // Watch mode settings
    watch: {
      // Enable CSS watching in development
      enabled: true,
      
      // Debounce time for file changes (ms)
      debounce: 100
    },
    
    // Production build settings
    production: {
      // Enable CSS minification
      minify: true,
      
      // Enable CSS purging (remove unused styles)
      purge: true
    }
  },

  // File watching patterns
  watch: {
    // Files to watch for Tailwind class changes
    content: [
      './_layouts/**/*.html',
      './_includes/**/*.html',
      './_posts/**/*.{html,markdown,md}',
      './_pages/**/*.{html,markdown,md}',
      './index.{html,markdown,md}',
      './about.{html,markdown,md}',
      './*.{html,markdown,md}'
    ],
    
    // Files to ignore
    ignore: [
      './_site/**/*',
      './node_modules/**/*',
      './.git/**/*',
      './.jekyll-cache/**/*'
    ]
  },

  // Development workflow preferences
  workflow: {
    // Automatically open browser on start
    openBrowser: false,
    
    // Show detailed build output
    verbose: false,
    
    // Clear console on rebuild
    clearConsole: true,
    
    // Show build notifications
    notifications: true
  },

  // Tool-specific settings
  tools: {
    // Concurrently settings for running multiple processes
    concurrently: {
      // Kill all processes when one exits
      killOthers: true,
      
      // Process name prefixes
      names: ['CSS', 'Jekyll'],
      
      // Colors for process output
      prefixColors: ['blue', 'green'],
      
      // Restart processes on failure
      restartTries: 3
    },
    
    // Tailwind CLI settings
    tailwind: {
      // Config file path
      config: './tailwind.config.js',
      
      // PostCSS config file path
      postcss: './postcss.config.js'
    }
  },

  // Environment-specific overrides
  environments: {
    development: {
      // Development-specific settings
      css: {
        minify: false,
        purge: false,
        sourceMap: true
      }
    },
    
    production: {
      // Production-specific settings
      css: {
        minify: true,
        purge: true,
        sourceMap: false
      }
    }
  }
};