# rouge-lexers-whatlang

[Rouge] lexer for [WhatLang], a stack-based esolang.

[Rouge]: https://github.com/rouge-ruby/rouge
[WhatLang]: https://esolangs.org/wiki/WhatLang

## Installation

Add this line to your Gemfile:

~~~ruby
gem 'rouge-lexers-whatlang'
~~~

Or run:

~~~sh
$ gem install rouge-lexers-whatlang
~~~

## Usage

For [Jekyll]:

~~~liquid
{% highlight whatlang %}

{% endhighlight %}
~~~

or use fenced code blocks in Markdown / [Kramdown]:

~~~markdown
```whatlang

```
~~~

[Jekyll]: https://github.com/jekyll/jekyll
[Kramdown]: https://github.com/gettalong/kramdown

For Rouge CLI:

~~~sh
$ rougify highlight -r rouge-lexers-whatlang [...]
~~~

Besides `whatlang`, this lexer also supports `what` and `wl` as aliases. `.what` is the file extension for WhatLang.

## Testing

After cloning the repository, run `ruby bin/visual.rb` (optionally followed by a theme name which defaults to `thankful_eyes`) to write a visual test to `tmp/visual.html`.
