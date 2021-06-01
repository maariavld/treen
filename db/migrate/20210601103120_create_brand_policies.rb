class CreateBrandPolicies < ActiveRecord::Migration[6.1]
  def change
    create_table :brand_policies do |t|

      t.timestamps
    end
  end
end
