class Product < ApplicationRecord
  belongs_to :category
  has_many :orders
  has_many :comments
  validates :name, :description, :price, presence: true
  validates :price, :numericality => {:greater_than => 0}
  validates :amount, :numericality => {:greater_than => 0}
  validates :weight, :numericality => {:greater_than => 0}
  validates :calories, :numericality => {:greater_than => 0}
  validates :name, uniqueness: { scope: :category_id }
  mount_uploader :image, ImageUploader
end

