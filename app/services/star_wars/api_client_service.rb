# frozen_string_literal: true

require 'rest-client'
module StarWars
  class ApiClientService
    class << self
      def get(path)
        RestClient.get(
          "#{swapi_api_host}/#{path}",
          {
            'Accept' => '*/*',
            'Content-Type' => 'application/json'
          }
        )
      rescue RestClient::ExceptionWithResponse => e
        e.response
      end

      private

      def swapi_api_host
        @swapi_api_host ||= "https://swapi.dev/api"
      end
    end
  end
end
