class RemoveUserIdToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    remove_column :Subscriptions, :user_id
    remove_column :Subscriptions, :product_id
    add_column :Subscriptions, :user_id, :id
    add_column :Subscriptions, :product_id, :id
  end
end
