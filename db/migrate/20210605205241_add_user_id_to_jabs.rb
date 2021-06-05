class AddUserIdToJabs < ActiveRecord::Migration[6.1]
  def change
    add_column :jabs, :user_id, :int
  end
end
