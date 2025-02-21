class AddProfileImageToUses < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :profile_image, :string
  end
end
