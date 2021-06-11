class AddUserReferenceToBrands < ActiveRecord::Migration[6.1]
  def change
    add_reference :brands, :user, null: true, foreign_key: true
  end
end
