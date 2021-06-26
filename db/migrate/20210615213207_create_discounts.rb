# frozen_string_literal: true

class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.integer :amount
      t.string :type

      t.timestamps
    end
  end
end
