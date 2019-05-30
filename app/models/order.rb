class Order < ApplicationRecord
  validates :order_date, presence: true
  has_many :purchases
end
