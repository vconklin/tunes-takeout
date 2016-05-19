class User < ActiveRecord::Base
  validates :name, :uid, :provider, presence: true

  ##

  def self.find_or_create_from_omniauth(auth_hash)
    # Find or create a user
    user = User.find_by(uid: auth_hash["info"]["id"], provider: auth_hash["provider"])
    if !user.nil?
      return user
    else
      #   no user found, do something here
      user = User.new(uid: auth_hash["info"]["id"], provider: auth_hash["provider"], name: auth_hash["info"]["display_name"], image: auth_hash["info"]["images"][0]["url"], profile: auth_hash["info"]["external_urls"]["spotify"])
      if user.save
        return user
      else
        return nil
      end
    end
  end

end
