class Customer < ApplicationRecord
  has_secure_password
  belongs_to :province
  has_many :orders
end
