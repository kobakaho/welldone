class CreateOriginalItems < ActiveRecord::Migration[7.2]
  def change
    create_table :original_items do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
