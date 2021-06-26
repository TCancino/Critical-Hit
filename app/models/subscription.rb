# frozen_string_literal: true

class Subscription < ApplicationRecord
  belongs_to :user
  has_one :product
end
