class UsersController < ApplicationController

=begin
  # OWASP A01:2021 – Broken Access Control - https://owasp.org/Top10/A01_2021-Broken_Access_Control/
  # SECURE - CanCanCan method - checks authorization config before every action
  load_and_authorize_resource
=end

=begin
  # OWASP A01:2021 – Broken Access Control - https://owasp.org/Top10/A01_2021-Broken_Access_Control/
  # SECURE - user must authenticate before executing controller actions
  before_action :authenticate_user!
=end

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

=begin
    # OWASP A01:2021 – Broken Access Control - https://owasp.org/Top10/A01_2021-Broken_Access_Control/
    # SECURE - edit page user ID is set to currently logged in users ID
    @user = current_user
=end
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

=begin
    # OWASP A01:2021 – Broken Access Control - https://owasp.org/Top10/A01_2021-Broken_Access_Control/
    # SECURE - current user can only update their own account details
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to current_user, notice: 'You successfully updated your profile.' }
      else
        format.html { render :edit }
      end
    end
=end
  end

  # users search action
  def search
    # OWASP A03:2021 – Injection - https://owasp.org/Top10/A03_2021-Injection/
    # INSECURE - user search input is not sanitized and is vulnerable to SQL injection attacks
    @users = User.where("email LIKE '%#{params[:q]}%'")

=begin
    # OWASP A03:2021 – Injection - https://owasp.org/Top10/A03_2021-Injection/
    # SECURE - user search input is sanitized to mitigate the risk of SQL injection attacks
    @users = User.where('email LIKE ?', "%#{ActiveRecord::Base.sanitize_sql_like(params[:q])}%")
=end
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
