class Joke
  class Find < Micro::Case
    attributes :repository, :position, :seed

    def call!
      joke = repository.find_joke(position, seed)

      return Success result: joke if joke.available?

      publish(:joke_not_available)
      Failure :not_available
    end
  end
end
