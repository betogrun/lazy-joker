# frozen_string_literal: true

class Joke
  class Position
    attr_reader :value

    def initialize(input)
      @value = normalize(input)
    end

    def next_value = value + 1

    def previous_value = @previous_value ||= value - 1

    def previous? = previous_value.positive?

    def self.to_proc = ->(input) { new(input) }

    private

    def normalize(input)
      return 1 if input.nil?

      [1, input.to_i].max
    end
  end
end
