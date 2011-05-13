class Image < ActiveRecord::Base
  belongs_to :trip
  belongs_to :activity

  validates :filename, :presence => true, :length => 0..160
  validates :title, :caption, :length => 0..160

  def self.from_trip(trip)
    scoped.joins(
      :activity => {:days => :trips}
    ).where("trips.id" => trip.id)
  end

  def path(options = {})
    file_path = ""
    file_path = "thumbnails" if options[:thumbnail]
    file_path = File.join("/images", file_path) if options[:full_path]
    file_path.blank? ? filename : File.join(file_path, filename)
  end
end

