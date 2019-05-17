class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def dashboard
    @user = current_user
    authorize @user
    @cameras = Camera.where(user: current_user)
  end

end


