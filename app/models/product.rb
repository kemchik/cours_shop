class Product < ApplicationRecord
  has_many :categories
  validates :name, :description, :price, presence: true
  validates :price, numericality: true
end

