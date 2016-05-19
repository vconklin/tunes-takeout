class AddColumnsImageAndProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :image, :string
    add_column :users, :profile, :string
  end
end
