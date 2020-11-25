class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, presence: true
  validates :fragrance_family_id, presence: true
  validates :category_id, presence: true
  validates :brand_id, presence: true
  belongs_to :category
  belongs_to :brand
  belongs_to :fragrance_family

  paginates_per 10
end
