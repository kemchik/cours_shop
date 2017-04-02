class Product < ApplicationRecord
  belongs_to :category
  has_many :orders
  validates :name, :description, :price, presence: true
  validates :price, numericality: true
  validates :name, uniqueness: { scope: :category_id }
  mount_uploader :image, ImageUploader
end

