class Trip < ActiveRecord::Base
  has_one  :master_image, :foreign_key => :trip_id, :class_name => "Image"
  has_many :day_schedules
  has_many :days, :through => :day_schedules

  accepts_nested_attributes_for :days

  validates :title, :description, :presence => true, :uniqueness => true
  validates :master_image, :presence => true

  def snippit
    description.slice(0..160)
  end
end

