class RentalsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @rental = Rental.new
    authorize @rental
  end

  def create
    @rental = Rental.new(rental_params)
    authorize @rental
  end

  private

  def rental_params
  end
end
