class Location < ActiveRecord::Base
  validates :name, :uniqueness => true
  has_many :activities

  def to_s
    name
  end
end

