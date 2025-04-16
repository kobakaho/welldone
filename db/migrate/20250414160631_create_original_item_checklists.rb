class CreateOriginalItemChecklists < ActiveRecord::Migration[7.2]
  def change
    create_table :original_item_checklists do |t|
      t.references :original_item, null: false, foreign_key: true
      t.references :checklist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
