require 'csv'

namespace :csv do
  desc "Import CSV Data"
  task :import_csv => :environment do
    csv_file_path = '/Users/laynemcnish/gSchoolWork/animal-brains-warmup/lib/assets/Animals.csv'

    CSV.foreach(csv_file_path) do |row|
      Brain.create!({
        :animal => row[0],
        :body => row[1],
        :brain => row[2],
                    })
      puts "Row added!"
    end
    CSV.foreach(csv_file_path) do |row|
      f = File.open('/Users/laynemcnish/gSchoolWork/animal-brains-warmup/db/seeds.rb', "a")
      f.puts (
                 {
                   :animal => row[0],
                   :body => row[1],
                   :brain => row[2],
                 }
      )
      f.close
      puts "Seed added!"
    end
  end
end
