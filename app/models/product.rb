class Product < ApplicationRecord
  belongs_to :brand
  mount_uploader :photo, PhotoUploader
  monetize :sale_price_cents, :cost_price_cents, :rrp_cents
end
