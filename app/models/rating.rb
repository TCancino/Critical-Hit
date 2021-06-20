class Rating < ApplicationRecord
  field :value, type: Float
  field :comment, type: String

  belongs_to :product
  belongs_to :user
end
