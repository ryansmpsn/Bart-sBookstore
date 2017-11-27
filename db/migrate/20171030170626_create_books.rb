class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :category
      t.integer :pages
      t.integer :publisher
      t.integer :price

      t.timestamps
    end
  end
end
