class PurchaseOrder < ApplicationRecord
  has_one :user
  has_many :products
end
