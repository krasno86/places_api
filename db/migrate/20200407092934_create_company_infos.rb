class CreateCompanyInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :company_infos do |t|
      t.string :name
      t.integer :company_id
      t.text :description
      t.string :address
      t.string :latitude
      t.string :longitude
      t.integer :count_table
      t.string :work_time_description

      t.timestamps
    end
    add_index :company_infos, :company_id
  end
end
