# frozen_string_literal: true

require 'rest-client'
module StarWars
  class ApiClientService
    class << self
      def get(path)
        RestClient.get(
          "#{path}",
          {
            'Accept' => '*/*',
            'Content-Type' => 'application/json',
          }
        )
      rescue RestClient::ExceptionWithResponse => e
        e.response
      end
    end
  end
end
