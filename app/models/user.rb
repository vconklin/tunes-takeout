# custom validator method

class User < ActiveRecord::Base
  validates :name, :uid, :provider, presence: true

  validate :must_be_a_string,
    :provider_must_be_spotify

  def must_be_a_string
    unless provider.is_a? String
      errors.add(:provider, "must be a string")
    end
    unless uid.is_a? String
      errors.add(:uid, "must be a string")
    end
    unless name.is_a? String
      errors.add(:name, "must be a string")
    end
  end

  def provider_must_be_spotify
    if provider != "spotify"
      errors.add(:provider, "must be spotify")
    end
  end

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
