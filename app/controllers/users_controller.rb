class UsersController < ApplicationController

  # OWASP A01:2021 – Broken Access Control - https://owasp.org/Top10/A01_2021-Broken_Access_Control/
  # SECURE - CanCanCan method - checks authorization config before every action
  load_and_authorize_resource

  # OWASP A01:2021 – Broken Access Control - https://owasp.org/Top10/A01_2021-Broken_Access_Control/
  # SECURE - user must authenticate before executing controller actions
  before_action :authenticate_user!

  # index action
  def index
    @users = User.all
  end

  # show action
  def show
    if current_user.admin?
      @user = User.find(params[:id])
    else
      @user = User.find(params[:id])
      if current_user != @user
        redirect_to root_path, notice: "Sorry, but you are only allowed to view your own profile page."
      end
    end
  end

  # edit action
  def edit
    # OWASP A01:2021 – Broken Access Control - https://owasp.org/Top10/A01_2021-Broken_Access_Control/
    # SECURE - edit page user ID is set to currently logged in users ID
    if current_user.admin?
      @user = User.find(params[:id])
    else
      @user = User.find(params[:id])
      if current_user != @user
        redirect_to root_path, notice: "Sorry, but you are only allowed to edit your own profile page."
      end
    end
  end

  # update action
  def update
    # OWASP A01:2021 – Broken Access Control - https://owasp.org/Top10/A01_2021-Broken_Access_Control/
    # SECURE - current user can only update their own account details
    if current_user.admin?
      @user = User.find(params[:id])
      @user.update(user_params)
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'You successfully updated your profile.' }
        else
          format.html { render :edit }
        end
      end
    else
      @user = User.find(params[:id])
      if current_user != @user
        redirect_to root_path, notice: "Sorry, but you are only allowed to update your own profile page."
      end
      respond_to do |format|
        if current_user.update(user_params)
          format.html { redirect_to current_user, notice: 'You successfully updated your profile.' }
        else
          format.html { render :edit }
        end
      end
    end
  end

  # @Ref: https://www.youtube.com/watch?v=s88Uc0InOAM
  # Ref description: tutorial on how to add search functionality for a resource
  # users search action
  def search
    # OWASP A03:2021 – Injection - https://owasp.org/Top10/A03_2021-Injection/
    # SECURE - user search input is sanitized to mitigate the risk of SQL injection attacks
    @users = User.where('email LIKE ?', "%#{ActiveRecord::Base.sanitize_sql_like(params[:q])}%")
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
