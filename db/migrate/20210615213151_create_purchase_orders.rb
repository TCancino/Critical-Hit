class CreatePurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_orders do |t|
      t.integer :amount
      t.string :payment_type

      t.timestamps
    end
  end
end
