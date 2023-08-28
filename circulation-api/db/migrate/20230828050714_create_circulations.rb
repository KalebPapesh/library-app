class CreateCirculations < ActiveRecord::Migration[7.0]
  def change
    create_table :circulations do |t|
      t.string :book_id
      t.string :patron_id
      t.date :return_date
      t.date :timestamp
      t.string :action_type

      t.timestamps
    end
  end
end
