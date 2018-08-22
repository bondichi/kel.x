class AnswersController < ApplicationController
  def create
  	Answer.create(question_id: params[:question_id], content: answer_params[:content], survey_response_id: answer_params[:survey_response_id])
  	@survey_response = SurveyResponse.find(answer_params[:survey_response_id])
  	unless @survey_response.unanswered_questions.empty?
  		redirect_back fallback_location: '/'
  	else
  		redirect_to '/'
  	end
  end

  private

  def answer_params
  	params.require(:answer).permit(:content, :survey_response_id)
  end
end
