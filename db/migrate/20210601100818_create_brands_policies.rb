class CreateBrandsPolicies < ActiveRecord::Migration[6.1]
  def change
    create_table :brands_policies do |t|
      t.references :brand, null: false, foreign_key: true
      t.references :policy, null: false, foreign_key: true
      t.integer :ranking

      t.timestamps
    end
  end
end
