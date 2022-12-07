class CharactersController < ApplicationController
  # GET /characters or /characters.json
  def index
    @characters = Character.all
  end
end
