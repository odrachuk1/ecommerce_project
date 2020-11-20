class FragranceFamily < ApplicationRecord
  validates :name, presence: true
  has_many :products
  validates_associated :products

  paginates_per 5
end
