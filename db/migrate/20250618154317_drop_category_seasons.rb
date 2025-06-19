class DropCategorySeasons < ActiveRecord::Migration[7.2]
  def up
    drop_table :category_seasons
  end
end
