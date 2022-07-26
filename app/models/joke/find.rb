# frozen_string_literal: true

class Joke
  class Find < Micro::Case
    attributes :repository, :seed, :position

    def call!
      joke = repository.find_random_joke(seed, position)

      return Success(result: {joke: joke}) if joke

      Failure(:not_available)
    end
  end
end
