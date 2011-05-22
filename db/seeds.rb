# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

def create_item!(item_class, title, description, options = {})
  index = options.delete(:index)
  item = item_class.find_or_initialize_by_title(title << " " << index.to_s)
  if item.new_record?
    item.description = description << " " << index.to_s if description
    options.each do |key, value|
      item.send("#{key}=", value)
    end
    item.save!
  end
  item
end

def create_activity_schedule!(day, activity)
  activity_schedule = day.activity_schedules.build
  activity_schedule.activity = activity
  activity_schedule.save!
  activity_schedule
end

def create_location!(name)
  location = Location.find_or_initialize_by_name(name)
  location.save! if location.new_record?
  location
end

def create_day_schedule!(trip, day, sequence)
  day_schedule = trip.day_schedules.build
  day_schedule.sequence = sequence
  day_schedule.day = day
  day_schedule.save!
  day_schedule
end

def create_image!(options = {})
  options[:image] ||= Image.new
  image = options.delete(:image)
  options.each do |key, value|
    image.send("#{key}=", value)
  end
  image.save!
  image
end

def seed_trip_info(admin_user, index = 1)
  trip_image = create_image!(:filename => "slider_image_#{index}.png")

  trip = create_item!(
    Trip,
    "Best of Cambodia",
    "Enjoy the best Cambodia has to offer....",
    :index => index,
    :master_image => trip_image,
    :user => admin_user,
    :published => true
  )

  day = create_item!(
    Day,
    "Meet the group",
    "Meet the leader and the rest of the group",
    :index => index
  )

  bangkok = create_location!("Bangkok, Thailand")

  activity = create_item!(
    Activity,
    "Group meeting",
    "Meet the leader and the rest of the group",
    :index => index,
    :location => bangkok
  )

  create_activity_schedule!(day, activity)

  activity = create_item!(
    Activity,
    "Group dinner",
    "Have dinner with the rest of the group",
    :index => index,
    :location => bangkok
  )

  create_image!(
    :image => activity.images.build,
    :filename => "slider_image_{index + 1}.png"
  )
  create_activity_schedule!(day, activity)

  create_day_schedule!(trip, day, 1)

  # Day 2

  day = create_item!(
    Day,
    "Bangkok to Siem Reap}",
    nil,
    :index => index
  )

  siem_reap = create_location!("Siem Reap, Cambodia")

  activity = create_item!(
    Activity,
    "Bus from Bangkok to Siem Reap",
    "Along the way we'll see some cows that can run!",
    :index => index,
    :location => siem_reap
  )

  create_image!(
    :image => activity.images.build,
    :filename => "slider_image_#{index + 1}.png"
  )

  create_activity_schedule!(day, activity)

  create_day_schedule!(trip, day, 2)
end

admin_user = User.where(:admin => true).first

if admin_user
  3.times do |index|
    seed_trip_info(admin_user, index + 1)
  end
else
  puts("Create an admin user first. Try rake mt:admin_user")
end

