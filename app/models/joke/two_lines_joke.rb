# frozen_string_literal: true

class Joke
  class TwoLinesJoke
    attr_reader :id, :setup, :punchline

    def initialize(id, setup, punchline)
      @id = id
      @setup = setup
      @punchline = punchline
    end

    def format = :two_lines
  end
end
