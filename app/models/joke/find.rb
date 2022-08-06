# frozen_string_literal: true

class Joke
  class Find < Micro::Case
    attribute :position, default: proc(&Joke::Position)
    attribute :seed, default: proc(&:to_f)
    attribute :repository, default: Repository

    def call!
      joke = repository.find_random_joke(seed, position)

      return Success(result: { joke: joke, position: position }) if joke.present?

      Failure(:no_joke)
    end
  end
end
