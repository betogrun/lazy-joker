# frozen_string_literal: true

module JokeAPI
  class Client
    BASE_URL = 'https://v2.jokeapi.dev'

    def initialize(adapter: Faraday.default_adapter)
      @adapter = adapter
    end

    def retrieve_jokes(from: 1, to: 10)
      ::JokeAPI::Resources::Joke.new(self).retrieve(from: from, to: to)
    end

    def ping
      ::JokeAPI::Resources::Ping.new(self).ping
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :json
        conn.response :json, content_type: 'application/json'
        conn.adapter @adapter
      end
    end
  end
end
