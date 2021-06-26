# frozen_string_literal: true

class Product < ApplicationRecord
  field :status, type: String # Disponible, Sin Stock, No disponible/Oculto, Preventa
  field :name, type: String
  field :price, type: Integer
  field :description, type: String
  field :rating_value, type: Float # Calificación final
  field :rating_count, type: Integer # Cantidad de opiniones, para no consultar en la BDD
  field :stock, type: Integer
  field :sku, type: String
  field :barcode, type: String

  has_many :categories
  has_many :ratings
end
