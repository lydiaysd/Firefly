class CamerasController < ApplicationController
  before_action :find_camera, only: [:show]

  def index
    @cameras = Camera.all
  end

  def show

  end

  private

  def find_camera
    @camera = Camera.find(params[:id])
  end
end
