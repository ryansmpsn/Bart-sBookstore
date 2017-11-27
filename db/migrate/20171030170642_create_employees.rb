class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :firstName
      t.string :lastName
      t.date :dateOfBirth
      t.date :startDate

      t.timestamps
    end
  end
end
