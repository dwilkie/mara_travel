class Trip < ActiveRecord::Base
  has_many :trip_images
  has_many :images, :through => :trip_images
  has_one  :master_image, :foreign_key => :trip_id, :class_name => "Image"

  validates :title, :description, :master_image, :presence => true

  def snippit
    description.slice(0..160)
  end
end

