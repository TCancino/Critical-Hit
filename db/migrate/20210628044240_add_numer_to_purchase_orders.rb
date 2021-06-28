class AddNumerToPurchaseOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_orders, :Number, :string
    add_column :purchase_orders, :Status, :string
    add_reference :purchase_orders, :product, foreign_key: true
    add_reference :purchase_orders, :user, foreign_key: true
  end
end
