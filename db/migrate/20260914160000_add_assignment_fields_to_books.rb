class AddAssignmentFieldsToBooks < ActiveRecord::Migration[8.0]
  def up
    add_column :books, :title, :string
    add_column :books, :author, :string
    add_column :books, :price, :decimal, precision: 10, scale: 2
    add_column :books, :published_date, :date

    execute "UPDATE books SET title = name WHERE title IS NULL AND name IS NOT NULL"
  end

  def down
    remove_column :books, :published_date
    remove_column :books, :price
    remove_column :books, :author
    remove_column :books, :title
  end
end
