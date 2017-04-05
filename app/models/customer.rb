class Customer < ApplicationRecord
  has_many :orders
  belongs_to :user
  validates :address, :phone, :user, presence: true
end
