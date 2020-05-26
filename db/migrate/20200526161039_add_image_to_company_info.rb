class AddImageToCompanyInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :company_infos, :image, :string
  end
end
