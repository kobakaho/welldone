# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

cloth = Category.create(name: '服 / アイテム')
Tops, Outer, Bottoms, One_piece_All_in_one, Bags, Footwear, Underwear, Accessories, Others = cloth.children.create(
  [
    { name: 'トップス' },
    { name: 'アウター' },
    { name: 'ボトムス' },
    { name: 'ワンピース / オールインワン' },
    { name: 'アンダーウェア' },
    { name: '靴' },
    { name: 'バッグ' },
    { name: 'ファッション小物' },
    { name: 'その他' }
  ]
)

['Tシャツ / カットソー', 'シャツ / ブラウス', 'ポロシャツ', 'ニット / セーター', 'パーカー / スウェット'].each do |name|
  Tops.children.create(name: name)
end

['ジャケット / ブルゾン', 'コート', 'ダウンジャケット'].each do |name|
  Outer.children.create(name: name)
end

['ジーンズ / デニム', 'スラックス', 'チノパン', 'ショートパンツ', 'スカート'].each do |name|
  Bottoms.children.create(name: name)
end
  
['ワンピース', 'サロペット / オーバーオール'].each do |name|
  One_piece_All_in_one.children.create(name: name)
end
  
['リュック / バックパック', 'ショルダーバッグ', 'トートバッグ', 'クラッチバッグ'].each do |name|
  Bags.children.create(name: name)
end

['スニーカー', 'ローファー', 'ブーツ', 'サンダル', 'パンプス', 'スリッポン', 'ビーチサンダル', 'ハイヒール'].each do |name|
  Footwear.children.create(name: name)
end

['インナーシャツ', 'キャミソール / タンクトップ', 'ショーツ / パンツ', 'ブラジャー', 'レギンス / タイツ', '靴下 / ソックス'].each do |name|
  Underwear.children.create(name: name)
end
  
['帽子', 'ベルト / サスペンダー', '手袋', 'ストール / マフラー / スカーフ', '時計 / ジュエリー / アクセサリー'].each do |name|
  Accessories.children.create(name: name)
end
  
['ネクタイ / 蝶ネクタイ', 'イヤーマフ', 'ヘアアクセサリー（ヘアバンド、シュシュ、ヘアピンなど）', '和装（着物 / 浴衣 / 帯）'].each do |name|
  Others.children.create(name: name)
end
