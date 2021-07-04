class DropValuations < ActiveRecord::Migration[5.2]
  def change
    drop_table :valuations
  end
end
