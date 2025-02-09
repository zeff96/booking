class CreateRefreshTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :refresh_tokens do |t|
      t.string :token, null: false
      t.date :expiry, null: false
      t.boolean :is_valid, null: false, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
