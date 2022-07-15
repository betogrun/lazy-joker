class JokeListener
  include WisperNext.subscriber(prefix: true)

  def on_joke_not_available
    load_more_jokes_from_api
  end

  def on_last_joke_reached
    load_more_jokes_from_api
  end

  private

  def load_more_jokes_from_api
    Joke::Api::RetrieverWorker.perform_async
  end
end
