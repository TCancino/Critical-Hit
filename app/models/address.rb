class Address < ApplicationRecord
  field :name, type: String #Nombre de referencia para el usuario Ej: "casa", "oficina", etc
  field :address1, type: String #Calle+número
  field :address2, type: String #Departamento, condominio, referencias, etc
  field :state, type: String #Comuna
  field :city, type: String #Ciudad
  field :region, type: String #Region
  field :country, type: String #Pais

  belongs_to :user
end
