class Brand < ApplicationRecord
  validates :name, presence: true
  has_many :products
  validates_associated :products
end
