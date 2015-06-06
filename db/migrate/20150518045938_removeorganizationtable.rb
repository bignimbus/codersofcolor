class Removeorganizationtable < ActiveRecord::Migration
  def change
    drop_table :organizations
  end

  def change
    remove_column :contacts, :organization_id
  end

end
