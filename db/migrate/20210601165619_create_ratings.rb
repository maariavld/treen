class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.references :review, null: false, foreign_key: true
      t.integer :carbon_footprint
      t.integer :good_cause
      t.integer :organic
      t.integer :fair_trade

      t.timestamps
    end
  end
end
