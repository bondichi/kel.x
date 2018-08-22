class SurveyResponsesController < ApplicationController
  def create
  end

  def new
  	@survey = Survey.find(params[:survey_id])
  	@survey_response = SurveyResponse.find_or_create_by!(survey: @survey)
  end
end
