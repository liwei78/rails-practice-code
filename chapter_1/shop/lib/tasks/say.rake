namespace :say do
  desc "It's a test rake."
  task :hi => :environment do
    puts "Hi, Rails"
  end
end
