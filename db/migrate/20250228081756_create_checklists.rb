class CreateChecklists < ActiveRecord::Migration[7.2]
  def change
    create_table :checklists do |t|
      t.string :title, null: false
      t.string :name, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
