class AddCoordinatesToBrands < ActiveRecord::Migration[6.1]
  def change
    add_column :brands, :latitude, :float
    add_column :brands, :longitude, :float
  end
end
