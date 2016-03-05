class AddTypeAndActiveFlagToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :type, :string, null: false, default: ''
  	add_column :users, :active, :boolean, null: false, default: false
  end
end