class ProfilesController < ApplicationController
  def edit
    # raise
    @profile = current_user.profile
    # authorize @profile
  end

  def update
    @profile = current_user.profile
    @profile.update(profile_params)
  end


  # def update
  #     @profile.user = current_user
  #     # authorize
  #     @profile
  #     redirect_to profile_path(@profile)
  #   # else
  #     # render :edit
  # end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :age, :gender, :occupation)
  end
end
