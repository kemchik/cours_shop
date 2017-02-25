class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  belongs_to :product, require: true
  validates :amount, presence: true, numericality: { only_integer: true }
end
