class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.references :parent, index: true, polymorphic: true

      t.timestamps null: false
    end
    add_index :locations, :name, unique: true
  end
end