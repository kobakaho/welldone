class CreateChecklistItems < ActiveRecord::Migration[7.2]
  def change
    create_table :checklist_items do |t|
      t.string :name, null: false
      t.references :checklist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
