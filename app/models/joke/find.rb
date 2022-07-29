# frozen_string_literal: true

class Joke
  class Find < Micro::Case
    attribute :position, default: ->(value) { value.to_i }
    attribute :seed, default: ->(value) { value.to_f }
    attribute :repository

    def call!
      joke = repository.find_random_joke(seed, position)

      return Success(result: {joke: joke}) if joke

      Failure(:no_joke)
    end
  end
end
