class AddUserIdToUrls < ActiveRecord::Migration[5.1]
  def change
    add_column :urls, :user_id, :integer
  end
end
