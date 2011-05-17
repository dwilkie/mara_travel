class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_current_trip

  private

  def set_current_trip
    session[:current_trip_id] ||= current_user.trips.last if current_user
  end

end

