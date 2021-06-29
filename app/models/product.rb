class Product < ApplicationRecord
  has_many :categories
  has_many :ratings
  has_many :offers
end
