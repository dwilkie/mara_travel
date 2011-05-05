class Activity < ActiveRecord::Base
  validates :title, :description, :uniqueness => true
  has_many   :experiences
  has_many   :images, :through => :experiences
  has_many   :activity_schedules
  has_many   :days, :through => :activity_schedules
end

