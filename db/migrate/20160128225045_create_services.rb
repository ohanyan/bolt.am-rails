class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.integer :status

      t.timestamps null: false
    end
  end
end
