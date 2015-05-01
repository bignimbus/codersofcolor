class AddCategorytoOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :categoru, :string
  end
end


