class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.integer :bookID
      t.integer :employeeID
      t.integer :customerID
      t.integer :orderID
      t.date :invoiceDate

      t.timestamps
    end
  end
end
