class Product < ApplicationRecord
  validates :description, presence: true
  validates :quantity, presence: true
  validates :cost, presence: true
  validates :sale_price, presence: true
end
