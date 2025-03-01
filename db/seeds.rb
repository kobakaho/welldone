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
# "着るもの" => ["毛玉が取れない","汚れ・ほつれがある","着心地が悪い","1年以上着ていない","合わせるのが難しい","シワになりやすい","体型が変わって着れない","高かったからが理由で手放せない","着ていてもテンションが上がらない"],
# "身に着けるもの" => ["デザイン・用途が似ている","使い勝手が悪い","1年以上使ってない","必要以上の量がある","高かったからが理由で手放せない","使ってもテンションが上がらない","「人に見られないからいいか」と使い続けている"]


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
