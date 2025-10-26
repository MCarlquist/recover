#!/bin/bash

# Development Setup Script for Jekyll + Tailwind CSS
# This script sets up the development environment and verifies everything is working

set -e

echo "🚀 Setting up Jekyll + Tailwind CSS development environment..."

# Check if we're in the right directory
if [ ! -f "_config.yml" ]; then
    echo "❌ Error: This doesn't appear to be a Jekyll project directory"
    echo "   Please run this script from the root of your Jekyll project"
    exit 1
fi

# Check for required tools
echo "🔍 Checking for required tools..."

# Check for Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 16+ from https://nodejs.org/"
    exit 1
else
    echo "✅ Node.js found: $(node --version)"
fi

# Check for npm
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm"
    exit 1
else
    echo "✅ npm found: $(npm --version)"
fi

# Check for Ruby
if ! command -v ruby &> /dev/null; then
    echo "❌ Ruby is not installed. Please install Ruby 2.7+ from https://www.ruby-lang.org/"
    exit 1
else
    echo "✅ Ruby found: $(ruby --version)"
fi

# Check for Bundler
if ! command -v bundle &> /dev/null; then
    echo "⚠️  Bundler not found. Installing..."
    gem install bundler
else
    echo "✅ Bundler found: $(bundle --version)"
fi

# Install dependencies
echo "📦 Installing dependencies..."

echo "   Installing Ruby gems..."
bundle install

echo "   Installing npm packages..."
npm install

# Verify Tailwind CLI is working
echo "🎨 Verifying Tailwind CSS setup..."
npm run check:tailwind

# Verify Jekyll is working
echo "🏗️  Verifying Jekyll setup..."
npm run check:jekyll

# Build initial CSS
echo "🎨 Building initial Tailwind CSS..."
npm run build:css-dev

# Create .gitignore entries if they don't exist
echo "📝 Updating .gitignore..."
if ! grep -q "assets/css/tailwind.css" .gitignore 2>/dev/null; then
    echo "assets/css/tailwind.css" >> .gitignore
    echo "   Added assets/css/tailwind.css to .gitignore"
fi

if ! grep -q "node_modules/" .gitignore 2>/dev/null; then
    echo "node_modules/" >> .gitignore
    echo "   Added node_modules/ to .gitignore"
fi

echo ""
echo "🎉 Development environment setup complete!"
echo ""
echo "📋 Available commands:"
echo "   npm run dev          - Start development with CSS watching and Jekyll live reload"
echo "   npm run dev:fast     - Start development with one-time CSS build (faster startup)"
echo "   npm run serve        - Start Jekyll server only"
echo "   npm run build        - Build for production"
echo "   npm run clean        - Clean build artifacts"
echo ""
echo "🚀 To start developing, run:"
echo "   npm run dev"
echo ""
echo "📖 The site will be available at http://localhost:4000"
echo "   CSS changes will be automatically rebuilt and the browser will refresh"