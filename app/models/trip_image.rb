class TripImage < ActiveRecord::Base
  belongs_to :image
  belongs_to :trip
end

