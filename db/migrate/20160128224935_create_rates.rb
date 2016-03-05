class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.references :rated, index: true, foreign_key: true, null: false
      t.references :rater, index: true, foreign_key: true, null: false
      t.text :comment
      t.integer :score, null: false

      t.timestamps null: false
    end
  end
end