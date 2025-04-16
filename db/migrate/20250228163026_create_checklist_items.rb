class CreateChecklistItems < ActiveRecord::Migration[7.2]
  def change
    create_table :checklist_items do |t|
      t.string :name, null: false
      t.references :checklist, null: false, foreign_key: true
      t.references :default_item, null: false, foreign_key: true

      t.timestamps
    end
    add_index :checklist_items, [ :checklist_id, :default_item_id ], unique: true
  end
end
