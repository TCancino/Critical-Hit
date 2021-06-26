# frozen_string_literal: true

class CreateValuations < ActiveRecord::Migration[5.2]
  def change
    create_table :valuations do |t|
      t.integer :score
      t.text :comment

      t.timestamps
    end
  end
end
