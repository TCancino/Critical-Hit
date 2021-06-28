class RemoveTypeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :Users, :tipo, :string
  end
end
