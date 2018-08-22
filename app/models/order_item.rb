class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  monetize :product_price_cents
end
