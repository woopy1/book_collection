class CreateUsersAndUserBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.timestamps
    end

    add_index :users, :username, unique: true

    create_table :user_books do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.timestamps
    end

    add_index :user_books, %i[user_id book_id], unique: true
  end
end