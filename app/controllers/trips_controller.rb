class TripsController < ApplicationController
  def index
    @homepage = true
    @trips = Trip.scoped
  end

  def show
    @trip = Trip.find(params[:id])
    @images = @trip.images
  end
end

