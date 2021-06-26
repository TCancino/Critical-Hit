class PurchaseOrder < ApplicationRecord
  belongs_to :user
  has_one :address, as: shipping_address # Direccion de Envio
  has_one :address, as: billing_address # Direccion de facturacion
  has_many :products
end
