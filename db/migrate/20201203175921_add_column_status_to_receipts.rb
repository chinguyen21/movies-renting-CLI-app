class AddColumnStatusToReceipts < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :status, :string
  end
end
