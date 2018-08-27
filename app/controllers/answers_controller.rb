require 'json'

class AnswersController < ApplicationController
  def create
    content_data = Question.find(params[:question_id]).content["options"][answer_params[:content].to_i][0]
    raise
  	Answer.create(question_id: params[:question_id], content: answer_params[:content], survey_response_id: answer_params[:survey_response_id])
  	@survey_response = SurveyResponse.find(answer_params[:survey_response_id])
  	unless @survey_response.unanswered_questions.empty?
  		redirect_back fallback_location: '/products'
  	else
  		redirect_to '/products'
  	end
  end

  private

  def answer_params
  	params.require(:answer).permit(:content, :survey_response_id)
  end
end
