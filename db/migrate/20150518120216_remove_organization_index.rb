class RemoveOrganizationIndex < ActiveRecord::Migration
  def change
    remove_column :contacts, :organization_id
  end
end
