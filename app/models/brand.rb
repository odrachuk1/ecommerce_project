class Brand < ApplicationRecord
  validates :name, presence: true
  has_many :products
  validates_associated :products

  paginates_per 10
end
