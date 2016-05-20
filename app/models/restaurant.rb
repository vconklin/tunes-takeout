require 'yelp'

class Restaurant
  attr_reader :business_id, :name, :url, :image_url, :phone, :rating

  def initialize(data)
    @business_id = data.id
    @name = data.name
    @url = data.url
    @image_url = data.image_url
    @phone = data.phone
    @rating = data.rating
  end

  def self.find(id)
    data = Yelp.client.business(id)
    self.new(data.business)
  end

end
