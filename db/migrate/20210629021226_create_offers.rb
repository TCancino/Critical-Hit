class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.string :type
      t.integer :ammount
      t.references :product
    end
    add_reference :Products, :offer
  end
end
