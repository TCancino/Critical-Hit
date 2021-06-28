class AddUserToSubscription < ActiveRecord::Migration[5.2]
  def change
    remove_column :Subscriptions, :user_id, :id
    remove_column :Subscriptions, :product_id, :id
    add_reference :Subscriptions, :user, foreign_key: true, index: {unique: true}
    add_reference :Subscriptions, :product, foreign_key: true, index: {unique: true}
  end
end
