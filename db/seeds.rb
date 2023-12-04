# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.create!(name: genre_name)
#   end

# Create a user with a garden and a tree
user1 = User.create!(email: 'etienne@treetasker.ch') do |user|
  user.password = 'password'
  user.first_name = 'Etienne'
  user.last_name = 'Kyburz'
end
user2 = User.create!(email: 'nicolas@treetasker.ch') do |user|
  user.password = 'password'
  user.first_name = 'Nicolas'
  user.last_name = 'Messer'
end
user3 = User.create!(email: 'anhnam@treetasker.ch') do |user|
  user.password = 'password'
  user.first_name = 'Anh Nam'
  user.last_name = 'Le Giang'
end

# Create a task with a tree
task1 = Task.create!(name: 'Water the tree', creator: user1, assignee: user1, priority: 1, completed: false)
task2 = Task.create!(name: 'Prune the tree', creator: user1, assignee: user1, priority: 2, deadline: DateTime.current + 1, completed: true)
task3 = Task.create!(name: 'Photograph the tree', creator: user1, assignee: user2, priority: 3, completed: false)
task4 = Task.create!(name: 'Draw the tree', creator: user1, assignee: user1, priority: 4, completed: true)
