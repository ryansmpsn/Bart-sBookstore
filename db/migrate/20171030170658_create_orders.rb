class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :bookID
      t.date :orderDate

      t.timestamps
    end
  end
end
