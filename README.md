# jekyll-ruby-tag-plugin
HTML5 `<ruby>` tag support for Jekyll.  Make a `_plugins` directory on your Jekyll instance if you don't have yet, copy this `ruby_tag.rb` into it.  It should render `<ruby>` tag.

## Example:

In Markdown
```ruby
{% ruby ["米", "こめ"] %}
{% ruby [["日", "に"], ["本", "ほん"]] %}
```

The output will be…
```html
<ruby>
  米<rt>こめ</rt>
</ruby>
<ruby>
  日<rt>に</rt>
  本<rt>ほん</rt>
</ruby>
```
