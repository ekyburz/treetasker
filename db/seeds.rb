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
user1 = User.create!(email: 'user1@example.com') do |user|
  user.password = 'password'
  user.first_name = 'John'
  user.last_name = 'Doe'
end
user2 = User.create!(email: 'user2@example.com') do |user|
  user.password = 'password'
  user.first_name = 'Jane'
  user.last_name = 'Doe'
end

# Create a task with a tree
task1 = Task.create!(name: 'Water the tree', creator: user1, assignee: user1, priority: 1, completed: false)
task2 = Task.create!(name: 'Prune the tree', creator: user1, assignee: user1, priority: 2, completed: true)
task3 = Task.create!(name: 'Water the tree', creator: user1, assignee: user2, priority: 3, completed: false)
task4 = Task.create!(name: 'Prune the tree', creator: user1, assignee: user1, priority: 4, completed: true)

# Create a tree with a task
tree1 = Tree.create!(name: 'Oak', task: task1, garden: user1.garden)
tree2 = Tree.create!(name: 'Maple', task: task2, garden: user1.garden)
tree3 = Tree.create!(name: 'Pine', task: task3, garden: user1.garden)
tree4 = Tree.create!(name: 'Birch', task: task4, garden: user1.garden)
tree5 = Tree.create!(name: 'Willow', task: task3, garden: user2.garden)
