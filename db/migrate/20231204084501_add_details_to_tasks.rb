class AddDetailsToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :details, :text
  end
end
