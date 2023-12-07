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
task2 = Task.create!(name: 'Go buy groceries', creator: user1, assignee: user1, priority: 2, completed: false,
                     deadline: DateTime.current + 1.day)
task3 = Task.create!(name: 'Photograph the tree', creator: user1, assignee: user2, priority: 3, completed: true)
task4 = Task.create!(name: 'Buy Tania Grandits cookbook', creator: user1, assignee: user1, priority: 4,
                     completed: false)
task5 = Task.create!(name: 'Take out the garbage', creator: user1, assignee: user1, priority: 1, completed: false)
task6 = Task.create!(name: 'Send back printer for repair', creator: user1, assignee: user1, priority: 2, completed: false,
                     deadline: DateTime.current + 1.day)
task7 = Task.create!(name: 'Photograph the tree', creator: user1, assignee: user3, priority: 3, completed: true)
task8 = Task.create!(name: 'Create a music playlist for coding', creator: user1, assignee: user1, priority: 4,
                     completed: false)
task9 = Task.create!(name: 'Water the tree', creator: user1, assignee: user1, priority: 1, completed: true)
task10 = Task.create!(name: 'Prune the tree', creator: user1, assignee: user1, priority: 2, completed: true,
                      deadline: DateTime.current + 1.day)
task11 = Task.create!(name: 'Photograph the tree', creator: user1, assignee: user3, priority: 3, completed: true)
task12 = Task.create!(name: 'Draw the tree', creator: user1, assignee: user1, priority: 4, completed: true)
task13 = Task.create!(name: 'Water the tree', creator: user1, assignee: user1, priority: 1, completed: true)
task14 = Task.create!(name: 'Prune the tree', creator: user1, assignee: user1, priority: 2, completed: true,
                      deadline: DateTime.current + 1.day)
task15 = Task.create!(name: 'Photograph the tree', creator: user1, assignee: user3, priority: 3, completed: true)
task16 = Task.create!(name: 'Draw the tree', creator: user1, assignee: user1, priority: 4, completed: true)
task17 = Task.create!(name: 'Water the tree', creator: user1, assignee: user1, priority: 1, completed: true)
task18 = Task.create!(name: 'Prune the tree', creator: user1, assignee: user1, priority: 2, completed: true,
                      deadline: DateTime.current + 1.day)
task19 = Task.create!(name: 'Photograph the tree', creator: user1, assignee: user3, priority: 3, completed: true)
task20 = Task.create!(name: 'Draw the tree', creator: user1, assignee: user1, priority: 4, completed: true)
task21 = Task.create!(name: 'Water the tree', creator: user1, assignee: user1, priority: 1, completed: true)
task22 = Task.create!(name: 'Prune the tree', creator: user1, assignee: user1, priority: 2, completed: true,
                      deadline: DateTime.current + 1.day)
task23 = Task.create!(name: 'Photograph the tree', creator: user1, assignee: user3, priority: 3, completed: true)
