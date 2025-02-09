class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.string :city, null: false
      t.date :date, null: false
      t.references :user, null: false, foreign_key: true
      t.references :motorcycle, null: false, foreign_key: true

      t.timestamps
    end
    add_index :reservations, [:city, :date], unique: true
  end
end
