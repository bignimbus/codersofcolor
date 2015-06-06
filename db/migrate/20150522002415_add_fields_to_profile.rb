class AddFieldsToProfile < ActiveRecord::Migration
  def change
     rename_table :contacts, :profiles
     add_column :profiles, :first_name, :string
     add_column :profiles, :last_name, :string
     add_column :profiles, :website, :string
     add_column :profiles, :twitter, :string
     add_column :profiles, :field, :string
  end
end
