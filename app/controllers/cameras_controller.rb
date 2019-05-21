class CamerasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_policy_scoped
  before_action :find_camera, only: [:show, :destroy]

  def index
    if params[:query].present?
      @cameras = Camera.search_cameras(params[:query])
    else
      @cameras = policy_scope(Camera)
    end

    # @many_cameras = []
    # 6.times do
    #   @cameras.each {|camera| @many_cameras << camera}
    # end

    @markers = @cameras.map do |camera|
      {
        lat: camera.latitude,
        lng: camera.longitude
      }
    end
      # if params[:query].present?
      #   sql_query = " \
      #   cameras.name @@ :query \
      #   OR cameras.brand @@ :query \
      #   OR cameras.price @@ :query \
      #   OR cameras.address @@ :query \
      # "
      #   @cameras = Camera.where(sql_query, query: "%#{params[:query]}%")
      # else
      #   @cameras = policy_scope(Camera)
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
    params.require(:camera).permit(:name, :brand, :price, :description, :address, :start_date, :end_date, :photo)
  end
end
