require 'tunes_takeout_wrapper'

class SuggestionsController < ApplicationController

  def index
    if params[:query]
      @suggestion = TunesTakeoutWrapper.search(params[:query])
      @restaurant = Restaurant.find(@suggestion.food_id)
      @music = SpotifyItem.find_by(@suggestion.music_id, @suggestion.music_type)
    end

    @top_faves = TunesTakeoutWrapper.top_favorites
  end

  def favorite
    # post to charles api
    TunesTakeoutWrapper.fave(current_user.id)
  end

  def favorites
    @favorites = TunesTakeoutWrapper.user_favorites(current_user.id)
  end
end
