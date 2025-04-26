class ChangeImageFileNullConstraintInCloths < ActiveRecord::Migration[7.2]
  def change
    change_column_null :cloths, :image_file, true
  end
end
