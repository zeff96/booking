class CreateMotorcircles < ActiveRecord::Migration[7.1]
  def change
    create_table :motorcircles do |t|
      t.string :name
      t.string :image
      t.decimal :finance_fee
      t.decimal :option_to_purchase
      t.decimal :total_amount_payable
      t.integer :duration
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
