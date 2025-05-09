# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[ "Spring", "Summer", "Autumn", "Winter" ].each do |name|
  Season.find_or_create_by!(name: name)
end

[ "毛玉が取れない", "汚れ/ほつれがある", "着心地が悪い", "1年以上着ていない/使っていない", "合わせるのが難しい", "シワになりやすい", "体型が変わって着れない", "高かったからが理由で手放せない", "着ていても/使っていてもテンションが上がらない", "デザイン・用途が似ている", "使い勝手が悪い", "必要以上の量がある", "「人に見られないからいいか」と使い続けている" ].each do |name|
  DefaultItem.find_or_create_by!(name: name)
end



CategoryCloth.delete_all
Category.delete_all

# 1階層
wear = Category.find_or_create_by!(name: '着るもの')
accessary = Category.find_or_create_by!(name: '身に着けるもの')

# 2階層（着るもの）
tops = wear.children.find_or_create_by!(name: 'トップス')
outer = wear.children.find_or_create_by!(name: 'アウター')
pants = wear.children.find_or_create_by!(name: 'パンツ')
skirt = wear.children.find_or_create_by!(name: 'スカート')
onepiece = wear.children.find_or_create_by!(name: 'ワンピース / オールインワン')
other = wear.children.find_or_create_by!(name: 'その他')

# 3階層（トップスの子カテゴリ）
tops.children.find_or_create_by!(name: 'Tシャツ/カットソー')
tops.children.find_or_create_by!(name: 'シャツ/ブラウス')
tops.children.find_or_create_by!(name: 'ベスト')
tops.children.find_or_create_by!(name: 'シャツ/パーカー')
tops.children.find_or_create_by!(name: 'ニット / セーター')
tops.children.find_or_create_by!(name: 'その他トップス')


# 3階層（アウターの子カテゴリ）
outer.children.find_or_create_by!(name: 'ジャケット')
outer.children.find_or_create_by!(name: 'コート')
outer.children.find_or_create_by!(name: 'ブルゾン')
outer.children.find_or_create_by!(name: 'その他アウター')

# 3階層（パンツの子カテゴリ）
pants.children.find_or_create_by!(name: 'デニム')
pants.children.find_or_create_by!(name: 'スラックス')
pants.children.find_or_create_by!(name: 'ショートパンツ')
pants.children.find_or_create_by!(name: 'その他パンツ')

# 3階層（スカートの子カテゴリ）
skirt.children.find_or_create_by!(name: 'ロングスカート')
skirt.children.find_or_create_by!(name: 'ミニスカート')
skirt.children.find_or_create_by!(name: 'その他スカート')

onepiece.children.find_or_create_by!(name: 'ワンピース')
onepiece.children.find_or_create_by!(name: 'シャツワンピース')
onepiece.children.find_or_create_by!(name: 'ジャンパースカート')
onepiece.children.find_or_create_by!(name: 'サロペット/オーバーオール')
onepiece.children.find_or_create_by!(name: 'その他ワンピース / オールインワン')


# 3階層（アンダーウェアの子カテゴリ）

# 2階層（身に着けるもの）
hat = accessary.children.find_or_create_by!(name: '帽子')
bag = accessary.children.find_or_create_by!(name: 'バッグ')
shoes = accessary.children.find_or_create_by!(name: 'シューズ')
small_item = accessary.children.find_or_create_by!(name: 'ファッション小物')
other = accessary.children.find_or_create_by!(name: 'その他')

# 3階層（帽子）
hat.children.find_or_create_by!(name: 'キャップ')
hat.children.find_or_create_by!(name: 'ハット')
hat.children.find_or_create_by!(name: 'ベレー帽')
hat.children.find_or_create_by!(name: 'その他帽子')

# 3階層（バッグ）
bag.children.find_or_create_by!(name: 'トートバッグ')
bag.children.find_or_create_by!(name: 'リュック')
bag.children.find_or_create_by!(name: 'ショルダーバッグ')
bag.children.find_or_create_by!(name: 'ハンドバック')
bag.children.find_or_create_by!(name: 'クラッチバック')
bag.children.find_or_create_by!(name: 'ショルダーバッグ')
bag.children.find_or_create_by!(name: 'かごバック')
bag.children.find_or_create_by!(name: 'その他バック')


# 3階層（シューズ）
shoes.children.find_or_create_by!(name: 'スニーカー')
shoes.children.find_or_create_by!(name: 'パンプス')
shoes.children.find_or_create_by!(name: 'サンダル')
shoes.children.find_or_create_by!(name: 'バレエシューズ')
shoes.children.find_or_create_by!(name: 'ローファー')
shoes.children.find_or_create_by!(name: 'ブーツ')
shoes.children.find_or_create_by!(name: 'その他シューズ')

# 3階層（ファッション小物）
small_item.children.find_or_create_by!(name: 'アクセサリー')
small_item.children.find_or_create_by!(name: 'ヘアアクセサー')
small_item.children.find_or_create_by!(name: 'サングラス')
small_item.children.find_or_create_by!(name: '時計')
small_item.children.find_or_create_by!(name: 'ベルト')
small_item.children.find_or_create_by!(name: 'マフラー')
small_item.children.find_or_create_by!(name: 'その他ファッション小物')
