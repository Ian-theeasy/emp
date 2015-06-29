class AddGroupIdToMeets < ActiveRecord::Migration
  def change
    add_column :meets, :group_id, :integer
  end
end
