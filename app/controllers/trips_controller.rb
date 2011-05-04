class TripsController < ApplicationController
  def index
    @homepage = true
    @trips = Trip.scoped
  end
end

