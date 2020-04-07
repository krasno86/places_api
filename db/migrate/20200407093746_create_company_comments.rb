class CreateCompanyComments < ActiveRecord::Migration[6.0]
  def change
    create_table :company_comments do |t|
      t.integer :company_id
      t.string :username
      t.text :message

      t.timestamps
    end
    add_index :company_comments, :company_id
  end
end
