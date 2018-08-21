class SurveyResponse < ApplicationRecord
  belongs_to :profile
  belongs_to :survey

  has_many :answers
end
