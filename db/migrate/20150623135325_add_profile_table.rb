class AddProfileTable < ActiveRecord::Migration
  def change
    create_table :profiles do |p|
      p.string :first_name
      p.string :last_name
      p.string :bio
      p.string :website
      p.string :field
    end
  end
end
