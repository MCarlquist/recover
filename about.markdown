---
layout: page
title: About
permalink: /about/
---

<div class="bg-blue-50 border-l-4 border-blue-400 p-4 mb-6">
  <div class="flex">
    <div class="ml-3">
      <p class="text-sm text-blue-700">
        This page demonstrates Tailwind CSS integration with Jekyll. The styling you see here uses Tailwind utility classes.
      </p>
    </div>
  </div>
</div>

<div class="prose max-w-none">
  <p class="text-gray-600 leading-relaxed">
    This is the base Jekyll theme enhanced with <span class="font-semibold text-blue-600">Tailwind CSS</span>. 
    You can find out more info about customizing your Jekyll theme, as well as basic Jekyll usage documentation at 
    <a href="https://jekyllrb.com/" class="text-blue-600 hover:text-blue-800 underline">jekyllrb.com</a>
  </p>

  <div class="bg-gray-100 rounded-lg p-4 my-6">
    <h3 class="text-lg font-semibold text-gray-800 mb-2">Tailwind CSS Features</h3>
    <ul class="space-y-2">
      <li class="flex items-center">
        <span class="w-2 h-2 bg-green-500 rounded-full mr-3"></span>
        <span class="text-gray-700">Utility-first CSS framework</span>
      </li>
      <li class="flex items-center">
        <span class="w-2 h-2 bg-green-500 rounded-full mr-3"></span>
        <span class="text-gray-700">Responsive design utilities</span>
      </li>
      <li class="flex items-center">
        <span class="w-2 h-2 bg-green-500 rounded-full mr-3"></span>
        <span class="text-gray-700">GitHub Pages compatible via CDN</span>
      </li>
    </ul>
  </div>

  <div class="my-6">
    <h3 class="text-lg font-semibold text-gray-800 mb-4">Custom Components Demo</h3>
    <div class="space-y-4">
      <div>
        <button class="btn btn--primary">Primary Button</button>
        <button class="btn btn--secondary">Secondary Button</button>
        <button class="btn btn--outline">Outline Button</button>
      </div>
      
      <div class="alert alert--info">
        This is an info alert using our custom component classes that work with Tailwind!
      </div>
      
      <div class="card">
        <div class="card__header">
          <h4 class="font-semibold">Custom Card Component</h4>
        </div>
        <div class="card__body">
          <p>This card uses our custom SCSS components that complement Tailwind utilities.</p>
        </div>
      </div>
    </div>
  </div>

  <p class="text-gray-600">
    You can find the source code for Minima at GitHub:
    <a href="https://github.com/jekyll/minima" class="text-blue-600 hover:text-blue-800 underline">jekyll/minima</a>
  </p>

  <p class="text-gray-600">
    You can find the source code for Jekyll at GitHub:
    <a href="https://github.com/jekyll/jekyll" class="text-blue-600 hover:text-blue-800 underline">jekyll/jekyll</a>
  </p>
</div>
