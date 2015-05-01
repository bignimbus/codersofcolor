class RenameCategorutoCategory < ActiveRecord::Migration
  def change
      change_table :organizations do |t|
      t.rename :categoru, :category
    end
  end
end

