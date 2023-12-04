class AddDeletedToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :deleted, :boolean, default: false
  end
end
