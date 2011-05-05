class TripsController < ApplicationController
  def index
    @homepage = true
    @trips = Trip.scoped
  end

  def show
    @trip = Trip.find(params[:id])
    @images = Image.from_trip(@trip)
  end

  def new
    @trip = Trip.new
    @trip.activities.build
  end

end

