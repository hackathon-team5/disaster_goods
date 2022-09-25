# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

CSV.foreach('db/district.csv', headers: true) do |row|
    District.find_or_create_by(name: row['区市町名'])
end

CSV.foreach('db/town.csv', headers: true) do |row|
    Town.find_or_create_by(
        name: row['町丁目名'],
        district_id: row['区市町名'])
end

CSV.foreach('db/rank.csv', headers: true) do |row|
    Rank.find_or_create_by(
        total_danger_rank: row['総合危険度ランク'],
        fire_danger_rank: row['火災危険度ランク'],
        building_collapse_rank: row['建物倒壊危険度ランク'],
        active_difficulty_rank: row['災害時活動困難度ランク'],
        town_id: row['町丁目名'])
end

CSV.foreach('db/type.csv', headers: true) do |row|
    Type.find_or_create_by(
        name: row['タイプ名'],
        description: row['記述'])
end

CSV.foreach('db/goods.csv', headers: true) do |row|
    Good.find_or_create_by(
        name: row['グッズ名'],
        description: row['記述'],
        item_code: row['item_code'],
        amazon_link: row['amazon_link'],
        type_id: row['type_id'])
end