class TripsController < ApplicationController
  def index
    @trips = Trip.scoped
  end
end

