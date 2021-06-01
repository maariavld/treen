class CreateBrandsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :address
      t.text :description
      t.decimal :avg_prices, precision: 10, scale: 2

      t.timestamps
    end
  end
end
