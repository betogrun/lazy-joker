# frozen_string_literal: true

module JokeAPI
  class PingWorker
    include Sidekiq::Worker

    def perform
      ping
    end

    private

    def ping
      response = api_client.ping

      logger.info("Ping: #{response.ping}")
    rescue JokeAPI::Error => exception
      logger.error("Error: #{exception.message}")
    end

    def api_client
      JokeAPI::Client.new
    end
  end
end
