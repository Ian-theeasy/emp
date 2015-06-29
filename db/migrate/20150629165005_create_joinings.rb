class CreateJoinings < ActiveRecord::Migration
  def change
    create_table :joinings do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
