class AddTypeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :Users, :type, :string
  end
end
