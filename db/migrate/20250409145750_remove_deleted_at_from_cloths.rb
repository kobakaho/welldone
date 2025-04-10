class RemoveDeletedAtFromCloths < ActiveRecord::Migration[7.2]
  def change
    remove_index :cloths, :deleted_at
    remove_column :cloths, :deleted_at, :datetime
  end
end
