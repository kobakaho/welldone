class AddDiscardedAtToCloths < ActiveRecord::Migration[7.2]
  def change
    add_column :cloths, :discarded_at, :datetime
    add_index :cloths, :discarded_at
  end
end
