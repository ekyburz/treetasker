class CreateTrees < ActiveRecord::Migration[7.1]
  def change
    create_table :trees do |t|
      t.string :name
      t.references :task, null: false, foreign_key: true
      t.references :garden, null: false, foreign_key: true

      t.timestamps
    end
  end
end
