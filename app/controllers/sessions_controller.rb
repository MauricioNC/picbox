class SessionsController < ApplicationController
  def new
    redirect_to root_path unless session[:user_id].nil?
  end

  def create
    user = User.find_by_email(params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new, error: "Email or password incorrect.",status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
