class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.integer :position
      t.boolean :completed

      t.timestamps
    end
  end
end
