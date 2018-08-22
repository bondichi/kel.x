class Product < ApplicationRecord
  belongs_to :brand
  mount_uploader :photo, PhotoUploader
  monetize :cost_price_cents, :rrp_cents, :sale_price_cents
end
