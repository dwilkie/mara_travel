class Experience < ActiveRecord::Base
  has_many :images
  belongs_to :activity
  belongs_to :location
end

