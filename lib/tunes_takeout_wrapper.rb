require 'httparty'

class TunesTakeoutWrapper
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/v1/"
  attr_reader :food_id, :music_id, :music_type

  def initialize(data)
    @food_id = data["food_id"]
    @music_id = data["music_id"]
    @music_type = data["music_type"]
  end

  def self.find(id)
    data = HTTParty.get(BASE_URL + "suggestions/#{id}").parsed_response
    self.new(data["suggestion"])
  end

  def self.search(query)
    data = HTTParty.get(BASE_URL + "suggestions/search?query=#{query}&limit=1").parsed_response

    self.new(data["suggestions"][0])
  end

  def self.top_favorites
    # returns an array
    HTTParty.get(BASE_URL + "suggestions/top?limit=20").parsed_response["suggestions"]
  end


  def restaurant
    Restaurant.find(food_id)
  end

  def music
    SpotifyItem.find_by(music_id, music_type)
  end

end
