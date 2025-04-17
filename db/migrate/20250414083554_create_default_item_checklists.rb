class CreateDefaultItemChecklists < ActiveRecord::Migration[7.2]
  def change
    create_table :default_item_checklists do |t|
      t.references :default_item, null: false, foreign_key: true
      t.references :checklist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
