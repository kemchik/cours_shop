class Product < ApplicationRecord
  belongs_to :category
  validates :name, :description, :price, presence: true
  validates :price, numericality: true
  validates :name, uniqueness: { scope: :category_id }
end

