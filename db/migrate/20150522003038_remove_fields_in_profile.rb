class RemoveFieldsInProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :phone, :string
    rename_column :profiles, :name, :string
    rename_column :profiles, :position, :string
  end
end
