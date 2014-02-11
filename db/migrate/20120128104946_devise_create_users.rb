class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      t.encryptable
      t.confirmable
      t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      t.token_authenticatable

      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :gender
      t.string :country
      t.string :professional
      t.date :dob
      t.boolean  :hamara_souk_updates , :default => false
      t.boolean :allow_adv , :default => false
      t.timestamps
    end

    add_index :users, :email
    add_index :users, :reset_password_token
    add_index :users, :confirmation_token
    add_index :users, :unlock_token
    add_index :users, :authentication_token
  end

  def self.down
    drop_table :users
  end
end
