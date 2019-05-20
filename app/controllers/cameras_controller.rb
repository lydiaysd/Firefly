class CamerasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_camera, only: [:show, :destroy]

  def index
    @cameras = policy_scope(Camera)

    @markers = @cameras.map do |camera|
      {
        lat: camera.latitude,
        lng: camera.longitude
      }
    end
  end

  def show
    authorize @camera
  end

  def new
    @camera = Camera.new
    authorize @camera
  end

  def create
    @camera = Camera.new(set_params)
    @camera.user = current_user
    authorize @camera
    if @camera.save
      redirect_to camera_path(@camera)
    else
      render :new
    end
  end

  def destroy
    authorize @camera
    @camera.destroy
    redirect_to cameras_path
  end

  private

  def find_camera
    @camera = Camera.find(params[:id])
  end

  def set_params
    params.require(:camera).permit(:name, :brand, :price, :description, :address, :start_date, :end_date)
  end
end
