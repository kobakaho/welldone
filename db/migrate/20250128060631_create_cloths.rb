class CreateCloths < ActiveRecord::Migration[7.2]
  def change
    create_table :cloths do |t|
      t.string :image_file, null: false
      t.string :brand
      t.text :body
      t.date :purchase_date
      t.datetime :deleted_at
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  add_index :cloths, :deleted_at
  end
end
