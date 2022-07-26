# frozen_string_literal: true

class Joke
  class Factory
    def initialize(attributes)
      @attributes = attributes.symbolize_keys
    end

    def build
      case @attributes
      in { id: id, format: 'single', content: content, setup: nil, punchline: nil }
        SingleJoke.new(id, content)
      in { id: id, format: 'two_lines', content: nil, setup: setup, punchline: punchline }
        TwoLinesJoke.new(id, setup, punchline)
      end
    end
  end
end
