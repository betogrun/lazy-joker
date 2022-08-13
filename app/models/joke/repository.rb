# frozen_string_literal: true

class Joke
  module Repository
    module_function

    BuildJoke = ->(record) { Factory.new(record&.attributes).build }
    private_constant :BuildJoke

    def find_random_joke(seed, position)
      Record
        .connection
        .execute("SELECT setseed(#{Record.connection.quote(seed)})")

      Record
        .order('random()')
        .limit(1)
        .offset(position.value - 1)
        .select(:id, :format, :content, :setup, :punchline)
        .take
        &.then(&BuildJoke)
    end
  end
end
