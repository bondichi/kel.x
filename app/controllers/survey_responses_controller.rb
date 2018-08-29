class SurveyResponsesController < ApplicationController
	before_action :set_survey, :set_response

  def destroy
  	@survey_response.destroy
  	redirect_to new_survey_survey_response_path(Survey.last)
  end

  def new
  	redirect_to products_path if @survey_response.unanswered_questions.empty?
  end

  def set_survey
  	@survey = Survey.find(params[:survey_id])
  end

  def set_response
	  @survey_response = SurveyResponse.find_or_create_by!(survey: @survey, profile: current_user.profile)   	
  end
end
