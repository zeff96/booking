class CreateMotorcycles < ActiveRecord::Migration[7.1]
  def change
    create_table :motorcycles do |t|
      t.string :name, null: false
      t.text :bio, null: false
      t.integer :finance_fee, null:false
      t.integer :option_to_purchase, null:false
      t.integer :total_amount_payable, null: false
      t.integer :duration, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
