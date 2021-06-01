class CreatePoliciesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :policies do |t|
      t.string :title

      t.timestamps
    end
  end
end
