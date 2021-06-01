class CreateBrandPolicies < ActiveRecord::Migration[6.1]
  def change
    create_table :brand_policies do |t|
      t.references :brand, null: false, foreign_key: true
      t.references :policy, null: false, foreign_key: true
      t.decimal :ranking, precision: 2, scale: 1

      t.timestamps
    end
  end
end
