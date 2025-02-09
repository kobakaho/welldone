class CreateSeasonCloths < ActiveRecord::Migration[7.2]
  def change
    create_table :season_cloths do |t|
      t.references :season, null: false, foreign_key: true
      t.references :cloth, null: false, foreign_key: true

      t.timestamps
    end
  end
end
