namespace :db do
  desc "Rebuild develop and test db."
  task :rebuild => :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
    Rake::Task["db:test:prepare"].invoke
  end
end
