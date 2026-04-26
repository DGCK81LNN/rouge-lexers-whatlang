# -*- coding: utf-8 -*- #

module Rouge
  module Lexers
    class WhatLang < RegexLexer
      title 'WhatLang'
      desc 'a stack-based esoteric programming language'
      tag 'whatlang'
      aliases 'what', 'wl'
      filenames '*.what'

      state :root do
        rule %r/¿/, Comment::Preproc
        mixin :basic
        rule %r/'./, Str::Char
        rule %r/"/, Str::Double, :double_quote
        rule %r/`/, Str::Backtick, :backtick
        rule %r/\(/, Str, :paren
        rule %r/./, Text
      end

      state :basic do
        rule %r/\s+/, Text::Whitespace
        rule %r/0/, Keyword::Constant
        rule %r/[1-9]\d*/, Num::Integer
        rule %r/([a-zA-Z][a-zA-Z0-9_]*)(@)/ do
          groups Name::Function, Punctuation
        end
        rule %r/[a-zA-Z][a-zA-Z0-9_]*/, Name
        rule %r/[.\\:&_=^@><#]/, Keyword
        rule %r/[-+*\/%?~.,;$]/, Operator
        rule %r/[\[|\]{}!]/, Punctuation
      end

      state :double_quote do
        rule %r/[^"\\]+/, Str::Double
        rule %r/\\./, Str::Escape
        rule %r/"/, Str::Double, :pop!
      end

      state :backtick do
        rule %r/[^`\\]+/, Str::Backtick
        rule %r/\\./, Str::Escape
        rule %r/`/, Str::Backtick, :pop!
      end

      state :paren do
        rule %r/'\)/, Str, :pop!
        rule %r/\)/, Str, :pop!
        mixin :basic
        rule %r/'./, Str::Char
        rule %r/"/, Str::Double, :paren_double_quote
        rule %r/`/, Str::Backtick, :paren_backtick
        rule %r/\(/, Str, :paren
        rule %r/./, Str
      end

      state :paren_double_quote do
        rule %r/\(/ do
          token Str::Double
          pop!
          push :paren
          push :paren_double_quote
        end
        rule %r/\)/ do
          pop!
          pop!
          if in_state?(:paren)
            push :paren_double_quote
            token Str::Double
          else
            token Str
          end
        end
        rule %r/[^()"\\]+/, Str::Double
        rule %r/\\./, Str::Escape
        rule %r/"/, Str::Double, :pop!
      end

      state :paren_backtick do
        rule %r/\(/ do
          token Str::Backtick
          pop!
          push :paren
          push :paren_backtick
        end
        rule %r/\)/ do
          pop!
          pop!
          if in_state?(:paren)
            token Str::Backtick
            push :paren_backtick
          else
            token Str
          end
        end
        rule %r/[^()`\\]+/, Str::Backtick
        rule %r/\\./, Str::Escape
        rule %r/`/, Str::Backtick, :pop!
      end
    end
  end
end
