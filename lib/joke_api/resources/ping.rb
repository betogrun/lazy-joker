# frozen_string_literal: true

module JokeAPI
  module Resources
    class Ping < JokeAPI::Resource
      def ping
        response = get_request('ping')
        build_result(response.body.deep_symbolize_keys)
      end
    end
  end
end
