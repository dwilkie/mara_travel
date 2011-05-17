class Day < ActiveRecord::Base
  validates :title, :description, :uniqueness => true
  has_many :activity_schedules
  has_many :activities, :through => :activity_schedules
  has_many :locations, :through => :activities
  has_many :day_schedules
  has_many :trips, :through => :day_schedules
end

