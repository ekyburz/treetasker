class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :priority
      t.references :creator
      t.references :assignee
      t.timestamps
    end
    add_foreign_key :tasks, :users, column: :creator_id
    add_foreign_key :tasks, :users, column: :assignee_id
  end
end
