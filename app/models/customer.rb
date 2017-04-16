class Customer < ApplicationRecord
  has_many :orders
  belongs_to :user, required: false
  validates :address, :phone, presence: true
end
