class Customer < ApplicationRecord
  has_many :orders
  belongs_to :user, required: false
  validates :address, :phone, presence: true

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
