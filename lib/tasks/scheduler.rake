desc "This task is called by the Heroku scheduler add-on"
task :update_database => :environment do
  puts "Updating database..."
  DatabaseUpdater.update
  puts "done."
end
