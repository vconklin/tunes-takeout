require 'TunesTakeoutWrapper'

class SuggestionsController < ApplicationController

  def index
    if params[:query]
      @suggestion = TunesTakeoutWrapper.find(params[:query])
      # @restaurant = Restaurant.find_by(business_id: @suggestion.food_id)
      @music = Spotify_Item.find_by(item_id: @suggestion.music_id)
    end
  end

  # def show
  # end
end
