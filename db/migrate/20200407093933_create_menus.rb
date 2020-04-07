class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.integer :company_id
      t.integer :page_number
      t.string :image

      t.timestamps
    end
    add_index :menus, :company_id
  end
end
