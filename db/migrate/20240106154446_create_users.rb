class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, null: false, default: ""
      t.string :password_digest, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.string :confirmation_token
      t.datetime :confirmation_sent_at
      t.datetime :confirmed_at
      t.string :role, null: false, default: "user"

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token, unique: true
  end
end
