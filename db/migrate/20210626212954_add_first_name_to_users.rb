class AddFirstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :Users,  :first_name, :string
    add_column :Users,  :middle_name, :string
    add_column :Users,  :last_name, :string
    add_column :Users,  :rut, :string
    add_column :Users,  :username, :string
  end
end
