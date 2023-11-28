# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a user with a garden and a tree
user1 = User.create!(first_name: 'John', last_name: 'Doe', email: 'user1@example.com', password: 'password')
user2 = User.create!(first_name: 'Jane', last_name: 'Doe', email: 'user2@example.com', password: 'password')
task1 = Task.create!(name: 'Task 1', priority: 1, user: user1, assignee_id: 1)
task2 = Task.create!(name: 'Task 2', priority: 2, user: user1, assignee_id: 1)
task3 = Task.create!(name: 'Task 3', priority: 3, user: user1, assignee_id: 2)
task4 = Task.create!(name: 'Task 4', priority: 4, user: user1, assignee_id: 1)
tree1 = Tree.create!(name: 'Tree 1', task: task1)
