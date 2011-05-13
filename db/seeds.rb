# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

def create_item!(item_class, title, description, options = {})
  item = item_class.new
  item.title = title
  item.description = description
  options.each do |key, value|
    item.send("#{key}=", value)
  end
  item.save!
  item
end

def create_activity_schedule!(day, activity)
  activity_schedule = day.activity_schedules.build
  activity_schedule.activity = activity
  activity_schedule.save!
  activity_schedule
end

def create_location!(name)
  location = Location.new
  location.name = name
  location.save!
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

def seed_trip_info(admin_user)
  trip_image = create_image!(:filename => "slider_image_1.png")

  trip = create_item!(
    Trip,
    "Best of Cambodia",
    "Enjoy the best Cambodia has to offer....",
    :master_image => trip_image,
    :user => admin_user,
    :published => true
  )

  day = create_item!(
    Day,
    "Meet the group",
    "Meet the leader and the rest of the group"
  )

  bangkok = create_location!("Bangkok, Thailand")

  activity = create_item!(
    Activity,
    "Group meeting",
    "Meet the leader and the rest of the group",
    :location => bangkok
  )

  create_activity_schedule!(day, activity)

  activity = create_item!(
    Activity,
    "Group dinner",
    "Have dinner with the rest of the group",
    :location => bangkok
  )

  create_image!(
    :image => activity.images.build,
    :filename => "slider_image_3.png"
  )
  create_activity_schedule!(day, activity)

  create_day_schedule!(trip, day, 1)

  # Day 2

  day = create_item!(
    Day,
    "Bangkok to Siem Reap",
    nil
  )

  siem_reap = create_location!("Siem Reap, Cambodia")

  activity = create_item!(
    Activity,
    "Bus from Bangkok to Siem Reap",
    "Along the way we'll see some cows that can run!",
    :location => siem_reap
  )

  create_image!(
    :image => activity.images.build,
    :filename => "slider_image_2.png"
  )

  create_activity_schedule!(day, activity)

  create_day_schedule!(trip, day, 2)
end

admin_user = User.where(:admin => true).first

admin_user ? seed_trip_info(admin_user) : puts("Create an admin user first. Try rake mt:admin_user")

