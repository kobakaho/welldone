class DropChecklistItems < ActiveRecord::Migration[7.2]
  def up
    drop_table :checklist_items
  end

  def down
    create_table :checklist_items do |t|
      t.string :name, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
