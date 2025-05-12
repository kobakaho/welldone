class AddTitleToCloths < ActiveRecord::Migration[7.2]
  def change
    add_column :cloths, :title, :string, null: true
  end
end
