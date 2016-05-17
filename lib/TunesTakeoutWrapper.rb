require 'httparty'

class TunesTakeoutWrapper
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/v1/"
  attr_reader :food_id, :music_id, :music_type

  def initialize(data)
    @food_id = data["suggestions"][0]["food_id"]
    @music_id = data["suggestions"][0]["music_id"]
    @music_type = data["suggestions"][0]["music_type"]
  end

  # is this supposed to be how this works? self method?
  def self.find(query)
    data = HTTParty.get(BASE_URL + "suggestions/search?query=#{query}&limit=1").parsed_response

    self.new(data)
  end

end
