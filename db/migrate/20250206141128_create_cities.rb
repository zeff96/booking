class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :timezone
      t.boolean :booking_open, null: false, default: true

      t.timestamps
    end
  end
end
