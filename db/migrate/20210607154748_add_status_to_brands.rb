class AddStatusToBrands < ActiveRecord::Migration[6.1]
  def change
    add_column :brands, :status, :string
  end
end
