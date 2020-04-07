class CreateCompanyTables < ActiveRecord::Migration[6.0]
  def change
    create_table :company_tables do |t|
      t.integer :company_id
      t.string :name
      t.boolean :reservation, default:false

      t.timestamps
    end
    add_index :company_tables, :company_id
  end
end
