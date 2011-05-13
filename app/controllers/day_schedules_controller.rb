class DaySchedulesController < ApplicationController
  def index
    trip = Trip.find(params[:trip_id])
    @days = trip.days.order("day_schedules.sequence")
    @in_a_trip = true
  end
end

