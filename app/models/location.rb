class Location < ActiveRecord::Base
  validates :name, :uniqueness => true
  has_many :experiences
  has_many :activities, :through => :experiences
end

