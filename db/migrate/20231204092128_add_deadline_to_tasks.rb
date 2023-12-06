class AddDeadlineToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :deadline, :datetime, null: false, default: Time.now
  end
end
