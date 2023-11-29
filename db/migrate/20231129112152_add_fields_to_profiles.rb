class AddFieldsToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :delegates, :text
    rename_column :profiles, :archived, :archive
  end
end
