require 'json'

class AnswersController < ApplicationController
  def create
    content_data = Question.find(params[:question_id]).content["options"][answer_params[:content].to_i-1][2] || Question.find(params[:question_id]).content["options"][answer_params[:content].to_i-1][0]
    answer_name = Question.find(params[:question_id]).content['name']
    if content_data.class == Hash
      content_data['name'] = answer_name
    else
      content_data = { 'content' => content_data,'name' => answer_name }
    end
    Answer.create(question_id: params[:question_id], content: content_data, survey_response_id: answer_params[:survey_response_id])
    @survey_response = SurveyResponse.find(answer_params[:survey_response_id])
    @survey = Survey.find(@survey_response.survey_id)
  	@question_id = params[:question_id]

    @last_question = @survey_response.unanswered_questions.empty?
    
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
  	answer_params = params.require(:answer).permit(:content, :survey_response_id)
    answer_params[:content] ||= "Skip"
    answer_params
  end
end
