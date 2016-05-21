require 'httparty'

class TunesTakeoutWrapper
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/v1/"
  attr_reader :id, :food_id, :music_id, :music_type

  def initialize(data)
    @id = data["id"]
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

    self.new(data["suggestions"].sample)
  end

  def self.top_favorites
    # returns an array
    HTTParty.get(BASE_URL + "suggestions/top?limit=20").parsed_response["suggestions"]
  end

  def self.user_favorites(id)
    # returns an array
    HTTParty.get(BASE_URL + "users/#{id}/favorites").parsed_response["suggestions"]
  end

  def self.fave(id)
    HTTParty.post((BASE_URL + "users/#{id}/favorites"),
    :body => { "suggestion": "suggestion-id" }).to_json
  end

  def restaurant
    Restaurant.find(food_id)
  end

  def music
    SpotifyItem.find_by(music_id, music_type)
  end

end
