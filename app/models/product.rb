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

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      #csv << :name
      all.each do |product|
        csv << product.attributes.values_at(:name, :description, :price, :amount, :weight, :calories)
      end
    end
  end
end

