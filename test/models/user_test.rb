require 'test_helper'
require 'rspotify'
require 'tunes_takeout_wrapper'

class UserTest < ActiveSupport::TestCase
  describe User do
    before do
      auth_hash = request.env['omniauth.auth']
      @user = User.find_or_create_from_omniauth(auth_hash)
    end

    it "has a name", :vcr do
      refute @user.name.nil?
    end

    it "has a uid", :vcr do
      refute @user.uid.nil?
    end

    it "has a provider", :vcr do
      refute @user.provider.nil?
    end

    it "provider is a string", :vcr do
      assert provider.is_a? String
    end
  end
end
