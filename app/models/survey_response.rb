class SurveyResponse < ApplicationRecord
  # belongs_to :profile
  belongs_to :survey

  has_many :answers
  has_many :answered_questions, class_name: :Question, source: :question, through: :answers

  def unanswered_questions
  	survey.questions - answered_questions
  end
end
