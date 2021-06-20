class Discount < ApplicationRecord
  field :ammount, type: Integer
  field :type, type: String #Monto fijo, porcentaje
  field :start_date, type: Date #Inicio de oferta
  field :end_date, type: Date #Final de oferta

  has_one :product
end
