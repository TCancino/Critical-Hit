class FixColumnName < ActiveRecord::Migration[5.2]
  def self.up
    rename_column :products, :length, :large
  end
end
