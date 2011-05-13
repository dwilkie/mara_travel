class DaysController < ApplicationController
  def index
    @days = Day.scoped
  end
end

