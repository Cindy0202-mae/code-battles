# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "destroy users, battles, challenges..."
CodeBaUser.destroy_all
CodeBaBattle.destroy_all
CodeBaChallenge.destroy_all
puts "Done"

puts "create 2 users..."
cindy = CodeBaUser.create!(email: "cindy@me.com", password: "secret4sure")
kaitlyn = CodeBaUser.create!(email: "kaitlyn@me.com", password: "secret4sure")
puts "Done"
puts "Create 1 battle and 2 challenges..."
battle = CodeBaBattle.create!(name: "Ruby strikes back!", user: cindy)
CodeBaChallenge.create!(
  title: "Challenge 1",
  description: "return an empty array",
  code_ba_battle: battle
)
CodeBaChallenge.create!(
  title: "Challenge 2",
  description: "return an empty string",
  code_ba_battle: battle
)
CodeBaChallenge.create!(
  title: "Challenge 3",
  description: "return an empty hash",
  code_ba_battle: battle
)
puts "Done"
