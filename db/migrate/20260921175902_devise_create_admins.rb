# frozen_string_literal: true

class DeviseCreateAdmins < ActiveRecord::Migration[8.0]
  def change
    create_table :admins do |t|
      ## Database authenticatable
      t.string :email,              null: false
      t.string :full_name,          null: false 
      t.string :uid
      t.string :avatar_url
      ## Recoverable
      t.timestamps null: false
    end
    add_index :admins, :email,                unique: true
  end
end
