class Location < ActiveRecord::Base
  validates :name, :uniqueness => true
  has_many :activities
  has_many :activity_schedules, :through => :activities
  has_many :days, :through => :activity_schedules

  def to_s
    name
  end
end

