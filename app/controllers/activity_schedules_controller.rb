class ActivitySchedulesController < ApplicationController
  def index
    day = Day.find(params[:day_id])
    @activities = day.activities.includes(:images, :location)
  end
end

