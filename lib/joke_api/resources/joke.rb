# frozen_string_literal: true

module JokeAPI
  module Resources
    class Joke < JokeAPI::Resource
      def retrieve(from:, to:)
        response = get_request("joke/Any?&safe-mode&idRange=#{from}-#{to}&amount=#{(to - from) + 1}")
        build_result(response.body.deep_symbolize_keys)
      end
    end
  end
end
