class AddNameToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :Products, :name, :string
    add_column :Products, :sku, :string
    add_column :Products, :status, :string
    add_column :Products, :barcode, :string
    add_column :Products, :rating_value, :float
    add_column :Products, :rating_count, :integer
    add_column :Products, :stock, :integer
  end
end
