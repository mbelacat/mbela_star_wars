# frozen_string_literal: true

module StarWars
  class Api < StarWars::ApiClientService
    class << self
      # get a start_wars's characters
      def get_people
        get("people")
      end

      def get_planet(planet_id)
        get("planets/#{planet_id}")
      end
    end
  end
end
