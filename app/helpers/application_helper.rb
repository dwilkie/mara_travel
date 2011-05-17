module ApplicationHelper
  def current_trip
    @current_trip ||= Trip.find_by_id(session[:current_trip_id])
  end
end

