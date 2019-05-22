class CamerasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_policy_scoped
  before_action :find_camera, only: [:show, :destroy]

  def index
    if params[:query].present?
      @cameras = Camera.search_cameras(params[:query])
      # @cameras = Camera.where.not(user: current_user)
    else
      @cameras = policy_scope(Camera)
      # @cameras = Camera.where.not(user: current_user)
    end

    @markers = @cameras.map do |camera|
      {
        lat: camera.latitude,
        lng: camera.longitude
      }
    end
  end

  def show
    authorize @camera
    @markers =
      [{
        lat: @camera.latitude,
        lng: @camera.longitude
      }]
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
    params.require(:camera).permit(:name, :brand, :price, :description, :address, :start_date, :end_date, :photo)
  end
end
