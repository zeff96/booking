class CreateMotorcycles < ActiveRecord::Migration[7.1]
  def change
    create_table :motorcycles do |t|
      t.string :name
      t.string :image
      t.decimal :finance_fee
      t.decimal :option_to_purchase
      t.decimal :total_amout_payable
      t.time :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
