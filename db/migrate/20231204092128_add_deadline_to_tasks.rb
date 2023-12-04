class AddDeadlineToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :deadline, :datetime
  end
end
