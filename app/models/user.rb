class User < ApplicationRecord
  field :first_name, type: String
  field :middle_name, type: String
  field :last_name, type: String
  field :rut, type: String
  field :username, type: String
  field :email, type: String

  has_secure_password
  has_many :records #delete
  has_many :purchase_orders, :addresses, :subscriptions, :ratings
end
