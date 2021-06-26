# frozen_string_literal: true

class PurchaseOrder < ApplicationRecord
  field :date, type: Date # Fecha de emision
  field :status, type: String # Procesando, Pago aceptado, Enviado, Entregado, Preventa, Cancelado
  field :ammount, type: Integer
  field :number, type: String # Numero de orden (count+1?)

  belongs_to :user
  has_one :address, as: shipping_address # Direccion de Envio
  has_one :address, as: billing_address # Direccion de facturacion
  has_many :products
end
