class Order < ApplicationRecord
  validates :order_date, presence: true
end
