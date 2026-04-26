Gem::Specification.new do |s|
  s.name     = "rouge-lexers-whatlang"
  s.version  = "1.0.0"
  s.summary  =
    "Rouge lexer for WhatLang, a stack-based esolang"
  s.description = <<~END
    == Rouge::Lexers::WhatLang
    {Rouge}[https://github.com/rouge-ruby/rouge] lexer for
    {WhatLang}[https://esolangs.org/wiki/WhatLang], a stack-based esoteric programming language
  END
  s.authors  = ["DGCK81LNN"]
  s.email    = "triluolnn@163.com"
  s.files    = Dir[
    "Gemfile",
    "LICENSE",
    "rouge-lexers-whatlang.gemspec",
    "lib/**/*",
  ]
  s.homepage = "https://github.com/DGCK81LNN/rouge-lexers-whatlang"
  s.license  = "MIT"
  s.metadata = {
    "bug_tracker_uri"   => "https://github.com/DGCK81LNN/rouge-lexers-whatlang/issues",
    "source_code_uri"   => "https://github.com/DGCK81LNN/rouge-lexers-whatlang",
  }

  s.add_runtime_dependency "rouge", ">=3.0", "<5.0"
end
