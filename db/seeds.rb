# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require "csv"
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# CSV.foreach('db/district.csv', headers: true) do |row|
#     District.create(name: row['区市町名'])
# end

# CSV.foreach('db/town.csv', headers: true) do |row|
#     Town.create(
#         name: row['町丁目名'],
#         district_id: row['区市町名'])
# end