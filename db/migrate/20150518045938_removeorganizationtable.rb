class Removeorganizationtable < ActiveRecord::Migration
  def change
    drop_table :organizations
  end

end
