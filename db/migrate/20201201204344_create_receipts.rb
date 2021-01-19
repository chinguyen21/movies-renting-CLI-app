class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.integer :movie_id
      t.integer :user_id
      t.date :checkout_date
      t.date :return_date
    end
  end
end
