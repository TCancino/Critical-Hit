class AddNameToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :Addresses, :name, :string
    add_column :Addresses, :address1, :string
    add_column :Addresses, :address2, :string
    add_column :Addresses, :state, :string
    add_column :Addresses, :region, :string
    remove_column :Addresses, :street, :string
    add_reference :Addresses, :user, foreign_key: true
  end
end
