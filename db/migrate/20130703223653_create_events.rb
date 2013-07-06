class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :details
      t.string :logo_url
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :category
      t.boolean :is_private, :default => false

      t.timestamps
    end
  end
end
