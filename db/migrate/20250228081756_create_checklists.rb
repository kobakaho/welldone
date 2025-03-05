class CreateChecklists < ActiveRecord::Migration[7.2]
  def change
    create_table :checklists do |t|
      t.string :title, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :checklists, :title, unique: true
  end
end
