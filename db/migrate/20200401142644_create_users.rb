class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :full_name
      t.integer :role
      t.string :phone

      t.timestamps
    end
  end
end
