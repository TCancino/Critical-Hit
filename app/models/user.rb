# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :records # delete
  has_many :addresses
  has_many :subscriptions
  has_many :ratings
  has_many :carts
end
