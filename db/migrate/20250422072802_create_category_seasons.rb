class CreateCategorySeasons < ActiveRecord::Migration[7.2]
  def change
    create_table :category_seasons do |t|
      t.references :season, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
