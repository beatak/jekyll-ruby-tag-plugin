# Title: ruby tag for Jekyll
# Author: Takashi Mizohata <beatak@gmail.com>
# Description: Not the language, but the Ruby element in HTML5
# http://www.w3.org/TR/html5/text-level-semantics.html#the-ruby-element
# This plugin does NOT support <rp> tag.
#
# Syntax {% ruby [JSON array] %}
#
# Example:
# {% ruby [”米”, "こめ"] %}
# {% ruby [["日", "に"], ["本", "ほん"]] %}
#
# Output:
# <ruby>
#   米<rt>こめ</rt>
# </ruby>
# <ruby>
#   日<rt>に</rt>
#   本<rt>ほん</rt>
# </ruby>

module Jekyll
  class RubyTag < Liquid::Tag
    @list = nil

    def initialize(tag_name, tag_args, content)
      @list = []
      hash = JSON.parse(tag_args)
      if hash[0].instance_of? Array
        hash.each { |arr|
          @list.push([arr[0].strip, arr[1].strip])
        }
      else
        @list.push([hash[0].strip, hash[1].strip])
      end
      super
    end

    def render(context)
      output = ['<ruby>']
      @list.each {|arr|
        output.push(arr[0])
        output.push('<rt>')
        output.push(arr[1])
        output.push('</rt>')
      }
      output.push('</ruby>')
      output.join('')
    end
  end
end

Liquid::Template.register_tag('ruby', Jekyll::RubyTag)
