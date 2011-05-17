class DaySchedulesController < ApplicationController
  def index
    @trip = Trip.find_by_id(params[:trip_id])
    @days = trip.days.order("day_schedules.sequence")
  end
end

