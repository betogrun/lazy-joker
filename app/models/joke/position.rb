# frozen_string_literal: true

class Joke
  class Position
    attr_reader :value

    def initialize(input)
      @value = normalize(input)
    end

    def next_value = normalize(value + 1)

    def previous_value = normalize(value - 1)

    def self.to_proc = ->(input) { new(input) }

    private

    def normalize(input)
      return 1 if input.nil?

      [1, input.to_i].max
    end
  end
end
