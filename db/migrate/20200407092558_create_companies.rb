class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.boolean :active, default: false
      t.integer :city_id
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
    add_index :companies, :city_id
    add_index :companies, :category_id
    add_index :companies, :user_id
  end
end
