class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def new
    redirect_to root_path unless session[:user_id].nil?
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, success: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def profile
    @images = Image.where(user_id: @current_user.id)
  end

  def profile_settings
  end

  def account_settings
  end

  def apearance_settings
  end

  def notifications_settings
  end

  def update
    @current_user.update(user_params)

    flash[:success] = "Information updated successfully"
    render :profile_settings, status: :ok
  rescue
    redirect_to profile_settings_path, error: "Something went wrong, try again"
  end

  def delete_account
    DeleteAccountJob.perform_later(@current_user.id)

    flash[:success] = "Your account has beend deleted."
    session[:user_id] = nil
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :username, :email, :password, :password_confirmation, :location, :phone_number)
  end
end
