class RentalsController < ApplicationController

  before_action :find_camera, only: [:show, :new, :create]

  def index
    @rentals = policy_scope(Rental)
    @user = current_user
    @rentals = Rental.where(user: @user)
    @cameras = Camera.where(user: @user)
  end

  def show
    @user = current_user
    @rental = Rental.find(params[:id])
  end

  def new
    @rental = Rental.new
    authorize @rental
  end

  def create
    @rental = Rental.new(user: current_user)
    authorize @rental
    @rental.camera = @camera
    if @rental.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    redirect_to user_path(current_user)
    authorize @rental
  end

  private

  def find_camera
    @camera = Camera.find(params[:camera_id])
  end
end
