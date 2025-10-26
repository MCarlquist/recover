source "https://rubygems.org"
# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!
gem "jekyll", "~> 4.4.1"
# This is the default theme for new Jekyll sites. You may change this to anything you like.
gem "minima", "~> 2.5"
# Fix Ruby 3.4+ logger warning
gem "logger"
# Enhanced CSS processing support
gem "sassc", "~> 2.4" # Fast SASS compiler
gem "rouge", "~> 4.0" # Syntax highlighting
# If you want to use GitHub Pages, remove the "gem "jekyll"" above and
# uncomment the line below. To upgrade, run `bundle update github-pages`.
# gem "github-pages", group: :jekyll_plugins
# If you have any plugins, put them here!
group :jekyll_plugins do
  gem 'jekyll-seo-tag', '~> 2.8'
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-sass-converter", "~> 3.0" # Enhanced SASS processing
  gem "jekyll-sitemap", "~> 1.4" # SEO optimization
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1", :platforms => [:mingw, :x64_mingw, :mswin]

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds since newer versions of the gem
# do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]

# Development dependencies (optional)
group :development do
  # Note: jekyll-livereload is not compatible with Jekyll 4.x
  # Use 'bundle exec jekyll serve --livereload' for auto-reload instead
end
