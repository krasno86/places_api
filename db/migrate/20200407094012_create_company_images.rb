class CreateCompanyImages < ActiveRecord::Migration[6.0]
  def change
    create_table :company_images do |t|
      t.integer :company_id
      t.string :image

      t.timestamps
    end
    add_index :company_images, :company_id
  end
end
