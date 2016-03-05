class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :email, null: false
      t.string :authentication_token
      t.string :phone
      t.string :image

      t.timestamps null: false
    end

    add_index :users, :email, unique: true

  end
end
