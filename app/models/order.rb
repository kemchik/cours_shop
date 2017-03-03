class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  belongs_to :product
  validates :amount, presence: true, numericality: { only_integer: true }
end
