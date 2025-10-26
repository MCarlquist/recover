/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './_layouts/**/*.html',
    './_includes/**/*.html',
    './_posts/**/*.{html,markdown,md}',
    './_pages/**/*.{html,markdown,md}',
    './index.{html,markdown,md}',
    './about.{html,markdown,md}',
    './*.{html,markdown,md}',
    '!./_site/**/*',
    '!./node_modules/**/*'
  ],
  theme: {
    extend: {
      // Extend Tailwind's default theme
      colors: {
        // Custom colors that complement Jekyll/Minima theme
        'jekyll-blue': '#2563eb',
        'jekyll-gray': {
          50: '#f9fafb',
          100: '#f3f4f6',
          200: '#e5e7eb',
          300: '#d1d5db',
          400: '#9ca3af',
          500: '#6b7280',
          600: '#4b5563',
          700: '#374151',
          800: '#1f2937',
          900: '#111827'
        }
      },
      fontFamily: {
        // Use system fonts that work well with Jekyll
        'sans': ['system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', 'sans-serif'],
        'mono': ['SFMono-Regular', 'Menlo', 'Monaco', 'Consolas', 'Liberation Mono', 'Courier New', 'monospace']
      },
      typography: {
        DEFAULT: {
          css: {
            // Customize prose styles to work with Jekyll content
            maxWidth: 'none',
            color: '#374151',
            a: {
              color: '#2563eb',
              textDecoration: 'none',
              '&:hover': {
                color: '#1e40af',
                textDecoration: 'underline'
              }
            },
            'code::before': {
              content: '""'
            },
            'code::after': {
              content: '""'
            }
          }
        }
      }
    },
  },
  plugins: [
    require('@tailwindcss/typography')
  ],
  // Safelist important classes that might not be detected in content scanning
  safelist: [
    'prose',
    'prose-gray',
    'max-w-none',
    // Add any other classes that should always be included
  ]
}