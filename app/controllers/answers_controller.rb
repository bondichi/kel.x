require 'json'

class AnswersController < ApplicationController
  def create
    content_data = Question.find(params[:question_id]).content["options"][answer_params[:content].to_i-1][2] || Question.find(params[:question_id]).content["options"][answer_params[:content].to_i-1][0]
    Answer.create(question_id: params[:question_id], content: content_data, survey_response_id: answer_params[:survey_response_id])
    @survey_response = SurveyResponse.find(answer_params[:survey_response_id])
    @survey = Survey.find(@survey_response.survey_id)
  	@question_id = params[:question_id]

    @last_question = @survey_response.unanswered_questions.empty?
    # binding.pry
    respond_to do |format|
      unless @last_question
        format.html { redirect_back fallback_location: '/products' }
        format.js
    	else
    		format.html { redirect_to '/products' }
        format.js 
    	end
    end
  end

  private

  def answer_params
  	params.require(:answer).permit(:content, :survey_response_id)
  end
end
