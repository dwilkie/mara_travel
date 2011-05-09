namespace :mt do
  desc 'Creates an admin user in order to seed the db'
  task :admin_user =>:environment do

    STDOUT.puts "Enter your email address:"
    email = STDIN.gets.chomp

    STDOUT.puts "Enter your password:"
    password = STDIN.gets.chomp

    user = User.new(
      :email => email,
      :password => password,
      :password_confirmation => password
    )

    user.admin = true
    user.save!

    STDOUT.puts "User #{email} successfully created"
  end
end

