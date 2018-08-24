class Profile < ApplicationRecord
	has_many :survey_responses
	has_many :shipping_addresses
	belongs_to :user
end

