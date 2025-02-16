# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# チェックリストに合わせて要修正
Category.delete_all

item = Category.create(name: '服、アイテム')
item_children = ['着るもの','身に着けるもの']
item_grandchildren = [
  ['トップス','アウター','パンツ','スカート','ワンピース / オールインワン'], 
  ['帽子','バッグ','シューズ','アンダーウェア','ファッション小物'], 
]

item_children.each_with_index do |children, index|
  children = item.children.create(name: children)
  item_grandchildren[index].each do |grandchildren|
    children.children.create(name: grandchildren)
  end
end
