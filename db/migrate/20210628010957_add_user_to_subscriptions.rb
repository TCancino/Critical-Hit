class AddUserToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :Subscriptions, :user_id, :string
    add_column :Subscriptions, :product_id, :string
  end
end
