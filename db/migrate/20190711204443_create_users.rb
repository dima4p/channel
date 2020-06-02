class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :home_url
      t.string :email
      t.boolean :active, default: false, null: false
      t.integer :roles_mask, default: 0, null: false

      # authlogic
      t.string :persistence_token
      t.string :crypted_password
      t.string :password_salt
      t.string :perishable_token, null: false
      t.string :single_access_token, null: false
      # magic fields
      t.integer :login_count, default: 0, null: false
      t.integer :failed_login_count, default: 0, null: false
      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string :current_login_ip
      t.string :last_login_ip

      t.timestamps
    end
  end
end
