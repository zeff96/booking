class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.string :name
      t.date :date
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
