class DaySchedule < ActiveRecord::Base
  belongs_to :trip
  belongs_to :day
end

