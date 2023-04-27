class UsersController < ApplicationController
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

  def boxes
    @boxes = Box.where(user_id: @current_user.id)
  end

  def likes
    likes = ImagesLike.where(user_id: @current_user.id)
    @images = Image.find(likes.map { |img| img.image_id })
  end

  def downloads
    downloads = ImagesDownload.where(user_id: @current_user.id)
    @images = Image.find(downloads.map { |img| img.image_id })
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :username, :email, :password, :password_confirmation, :location, :phone_number)
  end
end
