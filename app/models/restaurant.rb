require 'yelp'

class Restaurant
  attr_reader :business_id, :name, :url, :image_url, :phone, :rating, :address

  def initialize(data)
    @business_id = data.id
    @name = data.name
    @url = data.url
    @image_url = data.image_url
    @phone = data.phone
    @rating = data.rating
    @address = data.location.display_address
  end

  def self.find(id)
    data = Yelp.client.business(id)
    self.new(data.business)
  end

end
