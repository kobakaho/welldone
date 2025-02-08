class CreateCategoryCloths < ActiveRecord::Migration[7.2]
  def change
    create_table :category_cloths do |t|
      t.references :category, null: false, foreign_key: true
      t.references :cloth, null: false, foreign_key: true

      t.timestamps
    end
  end
end
