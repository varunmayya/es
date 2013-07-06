class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :quantity
      t.datetime :sales_start_datetime
      t.datetime :sales_end_datetime
      t.integer :event_id

      t.timestamps
    end
  end
end
