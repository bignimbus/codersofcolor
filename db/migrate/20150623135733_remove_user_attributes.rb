class RemoveUserAttributes < ActiveRecord::Migration
  def change
    remove_column :users , :first_name , :string
    remove_column :users , :last_name , :string
    remove_column :users , :website    ,:string
    remove_column :users , :twitter    ,:string
    remove_column :users , :field      , :string
    remove_column :users , :bio        , :string
    remove_column :users , :avatar_file_name , :string
    remove_column :users , :avatar_content_type, :string
    remove_column :users , :avatar_file_size    ,:integer
    remove_column :users ,   :avatar_updated_at ,:datime
  end
end
