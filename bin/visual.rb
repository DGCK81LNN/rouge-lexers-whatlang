#!/usr/bin/env ruby

require "bundler/setup"
require "rouge"
require "rouge/lexers/whatlang"

Dir.chdir("#{__dir__}/..")
begin
  Dir.mkdir("tmp")
rescue Errno::EEXIST; end

theme = ARGV[0] || "thankful_eyes"
css = Rouge::Theme.find(theme).render(scope: '.highlight')
STDERR.puts("Using theme #{theme}")

def html(path)
  code = File.read(path)
  lex = Rouge::Lexers::WhatLang.lex(code)
  Rouge::Formatters::HTML.format(lex)
end

File.write("tmp/visual.html", <<END)
<!DOCTYPE HTML>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name=viewport content="width=device-width, initial-scale=1">
  <title>whatlang lexer visual test</title>
  <style>
    body {
      font-family: sans-serif;
      margin: 1rem;
    }
    .highlight {
      white-space: pre-wrap;
      overflow-wrap: break-word;
      tab-size: 2;
      font: 1rem monospace;
      font-variant-ligatures: none;
      margin: 1rem 0;
      padding: 1rem;
    }
    #{ css }
  </style>
</head>
<body>
  <h1>whatlang lexer visual test</h1>
  <pre class="highlight">#{ html "lib/rouge/demos/whatlang" }</pre>
  <pre class="highlight">#{ html "spec/visual/samples/whatlang" }</pre>
  <p>Rendered with theme: #{theme}</p>
</body>
</html>
END
STDERR.puts("Visual test saved to tmp/visual.html")
