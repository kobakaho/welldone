# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

#  本番環境に適応する分
#  ["Spring","Summer","Autumn","Winter"].each do |season|
#    Season.find_or_create_by!(name: season)
#  end

# チェックリストに合わせて要修正
Category.delete_all

root = Category.create!(name: '服、アイテム')

wear = root.children.create!(name: '着るもの')
accessary = root.children.create!(name: '身に着けるもの')

wear.children.create!(name: 'トップス')
wear.children.create!(name: 'アウター')
wear.children.create!(name: 'パンツ')
wear.children.create!(name: 'スカート')
wear.children.create!(name: 'ワンピース / オールインワン')
accessary.children.create!(name: '帽子')
accessary.children.create!(name: 'バッグ')
accessary.children.create!(name: 'シューズ')
accessary.children.create!(name: 'アンダーウェア')
accessary.children.create!(name: 'ファッション小物')
