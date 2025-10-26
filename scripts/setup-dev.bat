@echo off
REM Development Setup Script for Jekyll + Tailwind CSS (Windows)
REM This script sets up the development environment and verifies everything is working

echo 🚀 Setting up Jekyll + Tailwind CSS development environment...

REM Check if we're in the right directory
if not exist "_config.yml" (
    echo ❌ Error: This doesn't appear to be a Jekyll project directory
    echo    Please run this script from the root of your Jekyll project
    pause
    exit /b 1
)

REM Check for required tools
echo 🔍 Checking for required tools...

REM Check for Node.js
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed. Please install Node.js 16+ from https://nodejs.org/
    pause
    exit /b 1
) else (
    echo ✅ Node.js found
    node --version
)

REM Check for npm
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is not installed. Please install npm
    pause
    exit /b 1
) else (
    echo ✅ npm found
    npm --version
)

REM Check for Ruby
ruby --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Ruby is not installed. Please install Ruby 2.7+ from https://rubyinstaller.org/
    pause
    exit /b 1
) else (
    echo ✅ Ruby found
    ruby --version
)

REM Check for Bundler
bundle --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️  Bundler not found. Installing...
    gem install bundler
) else (
    echo ✅ Bundler found
    bundle --version
)

REM Install dependencies
echo 📦 Installing dependencies...

echo    Installing Ruby gems...
bundle install

echo    Installing npm packages...
npm install

REM Verify Tailwind CLI is working
echo 🎨 Verifying Tailwind CSS setup...
npm run check:tailwind

REM Verify Jekyll is working
echo 🏗️  Verifying Jekyll setup...
npm run check:jekyll

REM Build initial CSS
echo 🎨 Building initial Tailwind CSS...
npm run build:css-dev

REM Update .gitignore
echo 📝 Updating .gitignore...
findstr /C:"assets/css/tailwind.css" .gitignore >nul 2>&1
if %errorlevel% neq 0 (
    echo assets/css/tailwind.css >> .gitignore
    echo    Added assets/css/tailwind.css to .gitignore
)

findstr /C:"node_modules/" .gitignore >nul 2>&1
if %errorlevel% neq 0 (
    echo node_modules/ >> .gitignore
    echo    Added node_modules/ to .gitignore
)

echo.
echo 🎉 Development environment setup complete!
echo.
echo 📋 Available commands:
echo    npm run dev          - Start development with CSS watching and Jekyll live reload
echo    npm run dev:fast     - Start development with one-time CSS build (faster startup)
echo    npm run serve        - Start Jekyll server only
echo    npm run build        - Build for production
echo    npm run clean        - Clean build artifacts
echo.
echo 🚀 To start developing, run:
echo    npm run dev
echo.
echo 📖 The site will be available at http://localhost:4000
echo    CSS changes will be automatically rebuilt and the browser will refresh

pause