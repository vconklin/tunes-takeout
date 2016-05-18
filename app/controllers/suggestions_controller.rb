require 'TunesTakeoutWrapper'

class SuggestionsController < ApplicationController

  def index
    if params[:query]
      @suggestion = TunesTakeoutWrapper.find(params[:query])
      # @restaurant = Restaurant.find_by(business_id: @suggestion.food_id)
      @music = SpotifyItem.find_by(@suggestion.music_id, @suggestion.music_type)
    end
  end

  # def show
  # end
end
