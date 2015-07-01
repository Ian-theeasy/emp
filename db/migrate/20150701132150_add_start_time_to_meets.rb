class AddStartTimeToMeets < ActiveRecord::Migration
  def change
    add_column :meets, :start_time, :time
  end
end
