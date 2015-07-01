class AddStartDateToMeets < ActiveRecord::Migration
  def change
    add_column :meets, :start_date, :date
  end
end
