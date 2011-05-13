class Trip < ActiveRecord::Base
  belongs_to :user
  has_one  :master_image, :foreign_key => :trip_id, :class_name => "Image"
  has_many :day_schedules
  has_many :days, :through => :day_schedules

  validates :title, :description, :presence => true, :uniqueness => true
  validates :user, :master_image, :presence => true

  def self.company_owned
    scoped.joins(:user).where("users.admin" => true)
  end

  def self.published
    scoped.where(:published => true).company_owned
  end

  def snippit
    description.slice(0..160)
  end
end

