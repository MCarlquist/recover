# Makefile for Jekyll + Tailwind CSS Development
# Provides convenient commands for common development tasks

.PHONY: help install dev dev-fast serve build build-dev clean clean-all lint check setup

# Default target
help: ## Show this help message
	@echo "Jekyll + Tailwind CSS Development Commands"
	@echo "=========================================="
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'
	@echo ""
	@echo "Quick Start:"
	@echo "  make setup    # First time setup"
	@echo "  make dev      # Start development server"

setup: ## Run initial setup (install dependencies and build CSS)
	@echo "🚀 Setting up development environment..."
	@if [ -f "scripts/setup-dev.sh" ]; then \
		./scripts/setup-dev.sh; \
	else \
		echo "📦 Installing dependencies..."; \
		bundle install; \
		npm install; \
		echo "🎨 Building initial CSS..."; \
		npm run build:css-dev; \
		echo "✅ Setup complete! Run 'make dev' to start developing."; \
	fi

install: ## Install all dependencies (Ruby gems and npm packages)
	@echo "📦 Installing dependencies..."
	bundle install
	npm install

dev: ## Start development server with CSS watching and live reload
	@echo "🚀 Starting development server..."
	npm run dev

dev-fast: ## Start development server with one-time CSS build (faster startup)
	@echo "🚀 Starting development server (fast mode)..."
	npm run dev:fast

serve: ## Start Jekyll server only (no CSS watching)
	@echo "🏗️  Starting Jekyll server..."
	npm run serve

serve-lr: ## Start Jekyll server with live reload
	@echo "🏗️  Starting Jekyll server with live reload..."
	npm run serve:livereload

build: ## Build site for production
	@echo "🏗️  Building for production..."
	npm run build

build-dev: ## Build site for development
	@echo "🏗️  Building for development..."
	npm run build:dev

clean: ## Clean build artifacts
	@echo "🧹 Cleaning build artifacts..."
	npm run clean

clean-all: ## Clean all artifacts including dependencies
	@echo "🧹 Cleaning all artifacts..."
	npm run clean:all

lint: ## Check CSS for unused Tailwind classes
	@echo "🔍 Linting CSS..."
	npm run lint:css

check: ## Check that all tools are properly installed
	@echo "🔍 Checking development environment..."
	@npm run check:tailwind
	@npm run check:jekyll

# CSS specific commands
css-build: ## Build Tailwind CSS once
	@echo "🎨 Building Tailwind CSS..."
	npm run build:css-dev

css-watch: ## Watch and rebuild Tailwind CSS on changes
	@echo "🎨 Watching Tailwind CSS..."
	npm run watch:css

css-prod: ## Build optimized Tailwind CSS for production
	@echo "🎨 Building production Tailwind CSS..."
	npm run build:css-prod

# Jekyll specific commands
jekyll-serve: ## Start Jekyll development server
	@echo "🏗️  Starting Jekyll server..."
	bundle exec jekyll serve

jekyll-build: ## Build Jekyll site
	@echo "🏗️  Building Jekyll site..."
	bundle exec jekyll build

jekyll-clean: ## Clean Jekyll build artifacts
	@echo "🧹 Cleaning Jekyll artifacts..."
	bundle exec jekyll clean

# Development workflow shortcuts
start: dev ## Alias for 'make dev'

stop: ## Stop all development processes (manual - use Ctrl+C in terminal)
	@echo "⏹️  To stop development servers, use Ctrl+C in the terminal where they're running"

restart: clean dev ## Clean and restart development server

# Information commands
info: ## Show project information and status
	@echo "Jekyll + Tailwind CSS Project Information"
	@echo "========================================"
	@echo ""
	@echo "Project Structure:"
	@echo "  📁 _layouts/     - Jekyll layout templates"
	@echo "  📁 _includes/    - Jekyll include partials"
	@echo "  📁 _posts/       - Blog posts"
	@echo "  📁 assets/css/   - Compiled CSS output"
	@echo "  📁 assets/scss/  - SCSS source files"
	@echo "  📄 tailwind.config.js - Tailwind configuration"
	@echo ""
	@echo "Development URLs:"
	@echo "  🌐 Local site: http://localhost:4000"
	@echo "  🔄 Live reload: Enabled with 'make dev'"
	@echo ""
	@echo "Key Files:"
	@echo "  📄 _config.yml - Jekyll configuration"
	@echo "  📄 package.json - npm scripts and dependencies"
	@echo "  📄 Gemfile - Ruby dependencies"

status: check ## Alias for 'make check'