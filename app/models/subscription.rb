class Subscription < ApplicationRecord
  has_many :users
  has_one :product
end
