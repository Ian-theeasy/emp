class AddPlaceIdToMeets < ActiveRecord::Migration
  def change
    add_column :meets, :place_id, :integer
  end
end
