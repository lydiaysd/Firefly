class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @cameras = @user.cameras
  end
end

