class Profile < ApplicationRecord
	has_many :survey_responses
  belongs_to :user
end

