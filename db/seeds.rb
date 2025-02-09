# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Category.delete_all

wear = Category.create(name: '着るもの')
accessory = Category.create(name: '身に着けるもの')
#other = Category.create(name: 'その他')

Tops, Outer, Pants, Skirt, One_piece_All_in_one = wear.children.create(
  [    
    { name: 'トップス' },
    { name: 'アウター' },
    { name: 'パンツ' },
    { name: 'スカート' },
    { name: 'ワンピース / オールインワン' }
  ]
)

Hat, Bags, Footwear,Underwear, Accessories = accessory.children.create(
  [    
    { name: '帽子' },
    { name: 'バッグ' },
    { name: 'シューズ' },
    { name: 'アンダーウェア' },
    { name: 'ファッション小物' }
  ]
)

['Tシャツ / カットソー', 'シャツ / ブラウス', 'ポロシャツ', 'ニット / セーター', 'パーカー / スウェット'].each do |name|
  Tops.children.create(name: name)
end

['ジャケット / ブルゾン', 'コート', 'ダウンジャケット'].each do |name|
  Outer.children.create(name: name)
end

['ジーンズ / デニム', 'スラックス', 'チノパン', 'ショートパンツ'].each do |name|
  Pants.children.create(name: name)
end

['ミニスカート', 'ミディスカート', 'ロングスカート', 'プリーツスカート'].each do |name|
  Skirt.children.create(name: name)
end

['ワンピース', 'サロペット / オーバーオール'].each do |name|
  One_piece_All_in_one.children.create(name: name)
end

['キャップ', 'ハット', 'ニット帽', 'ヘアバンド'].each do |name|
  Hat.children.create(name: name)
end

['リュック / バックパック', 'ショルダーバッグ', 'トートバッグ', 'クラッチバッグ'].each do |name|
  Bags.children.create(name: name)
end

['スニーカー', 'ローファー', 'ブーツ', 'サンダル', 'パンプス', 'スリッポン', 'ハイヒール'].each do |name|
  Footwear.children.create(name: name)
end

['インナーシャツ', 'キャミソール / タンクトップ', 'ショーツ / パンツ', 'ブラジャー', 'レギンス / タイツ', '靴下 / ソックス'].each do |name|
  Underwear.children.create(name: name)
end

['ネクタイ / 蝶ネクタイ', 'イヤーマフ', 'ヘアアクセサリー（ヘアバンド、シュシュ、ヘアピンなど）', 'ベルト / サスペンダー', '手袋', 'ストール / マフラー / スカーフ', '時計 / ジュエリー / アクセサリー'].each do |name|
  Accessories.children.create(name: name)
end
