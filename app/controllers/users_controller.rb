class UsersController < ApplicationController

  # index action
  def index
    @users = User.all
  end

  # show action
  def show
    @user = User.find(params[:id])
  end

  # edit action
  def edit
    # OWASP A01:2021 – Broken Access Control - https://owasp.org/Top10/A01_2021-Broken_Access_Control/
    # INSECURE - edit page accepts param ID as user ID to edit
    @user = User.find(params[:id])
  end

  # update action
  def update
    # OWASP A01:2021 – Broken Access Control - https://owasp.org/Top10/A01_2021-Broken_Access_Control/
    # INSECURE - any user can update any other users account details
    @user = User.find(params[:id])
    @user.update(user_params)
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'You successfully updated your profile.' }
      else
        format.html { render :edit }
      end
    end
  end

  # @Ref: https://www.youtube.com/watch?v=s88Uc0InOAM
  # Ref description: tutorial on how to add search functionality for a resource
  # users search action
  def search
    # OWASP A03:2021 – Injection - https://owasp.org/Top10/A03_2021-Injection/
    # INSECURE - user search input is not sanitized and is vulnerable to SQL injection attacks
    @users = User.where("email LIKE '%#{params[:q]}%'")
  end

  private

  # user update parameters
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :dob,
      :pps_number,
      :address,
      :contact_number,
      :emergency_contact_name,
      :emergency_contact_number
    )
  end

end
