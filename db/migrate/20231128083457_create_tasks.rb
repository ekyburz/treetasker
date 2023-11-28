class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :priority
      t.references :user, null: false, foreign_key: true
      t.integer :assignee_id

      t.timestamps
    end
  end
end
