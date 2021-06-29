class AddNewColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :brand, :string
    add_column :products, :height, :float
    add_column :products, :width, :float
    add_column :products, :length, :float
    add_column :products, :weight, :float
    add_column :products, :recommended_age, :string
    add_column :products, :number_of_player, :string
  end
end
