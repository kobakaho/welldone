class RemoveOgpFromCloths < ActiveRecord::Migration[7.2]
  def change
    remove_column :cloths, :ogp, :string
  end
end
