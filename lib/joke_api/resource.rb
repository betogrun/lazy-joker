# frozen_string_literal: true

module JokeAPI
  class Resource
    def initialize(client)
      @client = client
    end

    def get_request(url, params: {}, headers: {})
      handle_response @client.connection.get(url, params, headers)
    end

    def build_result(response_body)
      JSON.parse(response_body.to_json, object_class: OpenStruct)
    end

    private

    def handle_response(response)
      case { status: response.status, message: response.body['message'] }
      in { status: 400, message: message }
        raise Error, "Your request was malformed. #{message}"
      in { status: 404, message: message }
        raise Error, "No results were found for your request. #{message}"
      in { status: 429, message: message }
        raise Error, "Your request exceeded the API rate limit. #{message}"
      in { status: 500, message: message }
        raise Error, "We were unable to perform the request due to server-side problems. #{message}"
      in { status: 503, message: message }
        raise Error, "The server is temporarily offline. #{message}"
      else
        response
      end
    end
  end
end
