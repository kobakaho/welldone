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

item = Category.create( name: '服、アイテム' )
wear = item.children.create( name: '着るもの' )
wear.children.create([{ name:'トップス' }, { name: 'アウター'}, { name: 'パンツ' }, { name: 'スカート' }, { name: 'ワンピース / オールインワン' }])

accessory = item.children.create( name: '身に着けるもの' )
accessory.children.create([{ name:'帽子' }, { name: 'バッグ'}, { name: 'シューズ' }, { name: 'アンダーウェア' }, { name: 'ファッション小物' }])

