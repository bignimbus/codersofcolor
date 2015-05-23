class Adduserfeatures < ActiveRecord::Migration
  def change
  add_column :users, :first_name, :string
  add_column :users, :last_name, :string
  add_column :users, :website, :string
  add_column :users, :twitter, :string
  add_column :users, :field, :string
  add_column :users, :bio, :string
  end
end
