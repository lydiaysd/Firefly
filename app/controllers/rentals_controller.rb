class RentalsController < ApplicationController
  # before_action :set_rentals, only: [:show, :edit, :update, :destroy]
    # before_action :set_rentals, only: [:show, :edit, :update, :destroy]
  # GET /restaurants
 skip_before_action :authenticate_user!, only: [:home]


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
