class DropOrganizations < ActiveRecord::Migration
    def change
    drop_table :organizations
  end
end
