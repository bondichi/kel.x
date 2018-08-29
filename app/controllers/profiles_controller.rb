class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]

  def edit
    @survey = Survey.last
    @survey_response = SurveyResponse.find_or_create_by!(survey: @survey, profile: current_user.profile)
  end

  def update
    @profile.update(profile_params)
    redirect_to products_path
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :age, :gender, :occupation)
  end
end
