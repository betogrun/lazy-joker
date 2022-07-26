# frozen_string_literal: true

class Joke
  class SingleJoke
    attr_reader :id, :content

    def initialize(id, content)
      @id = id
      @content = content
    end

    def format = :single
  end
end
