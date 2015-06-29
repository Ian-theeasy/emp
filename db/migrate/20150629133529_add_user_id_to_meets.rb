class AddUserIdToMeets < ActiveRecord::Migration
  def change
    add_column :meets, :user_id, :integer
  end
end
