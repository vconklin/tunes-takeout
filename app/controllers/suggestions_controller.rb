require 'tunes_takeout_wrapper'

class SuggestionsController < ApplicationController

  def index
    if params[:query]
      @suggestion = TunesTakeoutWrapper.search(params[:query])
      @restaurant = Restaurant.find(@suggestion.food_id)
      @music = SpotifyItem.find_by(@suggestion.music_id, @suggestion.music_type)
    end

    @top_faves = TunesTakeoutWrapper.top_favorites

    if current_user
      @your_favorites = TunesTakeoutWrapper.user_favorites(current_user.uid)
    end
  end

  def favorite
    # post to charles api
    @favorite = TunesTakeoutWrapper.fave(params[:suggestion_id], current_user.uid)
    redirect_to root_path
  end

  def unfavorite
    @unfavorited = TunesTakeoutWrapper.unfave(params[:suggestion_id], current_user.uid)
    redirect_to root_path
  end

  def favorites
    @your_favorites = TunesTakeoutWrapper.user_favorites(current_user.uid)
  end
end
