class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :nickname
      t.string :mobile
      t.string :qq
      t.string :msn
      t.boolean :sex
      t.string :password_digest
      t.string   :remember_token
      t.datetime :remember_token_expires_at
      t.string   :activation_code
      t.datetime :activated_at
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.string :auth_token
      t.timestamps
    end
  end
end
