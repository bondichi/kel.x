class AddProfileForeignKeyToSurveyResponse < ActiveRecord::Migration[5.2]
  def change
  	add_foreign_key :survey_responses, :profiles
  end
end
