class ChangeTitleToNotNullInCloths < ActiveRecord::Migration[7.2]
  def change
    change_column_null :cloths, :title, false
  end
end
