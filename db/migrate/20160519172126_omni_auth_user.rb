class OmniAuthUser < ActiveRecord::Migration
  def change
    change_column :users, :uid, :integer
  end
end
