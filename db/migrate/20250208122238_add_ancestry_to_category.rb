class AddAncestryToCategory < ActiveRecord::Migration[7.2]
  def change
    change_table :categories do |t|
      t.string "ancestry"
    end

    add_index :categories, :ancestry
  end
end
