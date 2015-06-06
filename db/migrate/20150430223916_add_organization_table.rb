class AddOrganizationTable < ActiveRecord::Migration
  def change
     create_table :organizations do |t|
      t.string :name
      t.string :address
      t.string :address_2
      t.string :city
      t.string :state
      t.integer :postal
      t.text :description
      t.string :website
    end

     create_table :contacts do |t|
      t.belongs_to :organizations, index:true
      t.string :name
      t.string :email
      t.string :phone
      t.string :position
      t.string :bio
     end

  end
end
