class Trip < ActiveRecord::Base
  validates :title, :description, :presence => true

  def snippit
    description.slice(0..160)
  end
end

