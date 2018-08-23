class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile
  has_many :cart_items
  has_many :orders
  has_many :order_items, through: :order
  after_create :create_profile

  private 

  def create_profile
  	# user = self
  	Profile.create!(user: self)
  end
end
