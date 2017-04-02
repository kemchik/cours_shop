class Customer < ApplicationRecord
  has_many :orders
  validates :address, :phone, :user, presence: true
end
