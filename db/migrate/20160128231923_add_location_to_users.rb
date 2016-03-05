class AddLocationToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :location_id, :integer, index: true, foreign_key: true
  end
end
