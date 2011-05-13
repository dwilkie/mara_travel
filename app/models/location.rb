class Location < ActiveRecord::Base
  validates :name, :uniqueness => true
  has_many :activities
end

