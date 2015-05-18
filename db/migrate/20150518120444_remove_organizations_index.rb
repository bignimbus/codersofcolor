class RemoveOrganizationsIndex < ActiveRecord::Migration
  def change
        remove_column :contacts, :organizations_id
  end
end
