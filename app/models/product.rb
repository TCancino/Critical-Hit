class Product < ApplicationRecord
  has_one :category
  has_many :ratings
  has_many :offers
end
