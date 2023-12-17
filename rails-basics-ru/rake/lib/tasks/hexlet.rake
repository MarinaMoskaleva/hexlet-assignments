namespace :hexlet do
  desc 'Uploads users list from CSV file'
  task :import_users, [:fileName] => :environment do |_, args|
    csv_file = args[:fileName]

    unless csv_file
      print "Something went wrong"
      next
    end

    require 'csv'
    require 'date'

    CSV.foreach(csv_file, headers: true) do |row|
      parsed_date = Date.strptime(row['birthday'], '%m/%d/%Y')
      formatted_date = parsed_date.strftime('%Y-%m-%d')
      User.create!(
        first_name: row['first_name'],
        last_name: row['last_name'],
        birthday: formatted_date,
        email: row['email'],
      )
    end
  end

 
end
