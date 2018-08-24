class AddProfileIdToSurveyResponses < ActiveRecord::Migration[5.2]
  def change
  	add_column :survey_responses, :profile_id, :integer
  end
end
