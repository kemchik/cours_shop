class Customer < ApplicationRecord
  has_many :orders
  validates :address, :phone, presence: true
end
