class Activity < ActiveRecord::Base
  validates :title, :description, :uniqueness => true
  belongs_to :location
  has_many   :images
  has_many   :activity_schedules
  has_many   :days, :through => :activity_schedules
end

