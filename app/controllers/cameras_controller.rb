class CamerasController < ApplicationController
  before_action :find_camera, only: [:show]

  def index
    @cameras = Camera.all
  end

  def show

  end

  def new
    @camera = Camera.new
  end

  def create
    @camera = Camera.create(set_params)
    if @camera.save
      redirect_to camera_path(@camera)
    else
      render :new
    end
  end

  private

  def find_camera
    @camera = Camera.find(params[:id])
  end

  def set_params
    paramas.require(:camera).permit(:name, :brand, :price, :description, :availability)
  end

end
