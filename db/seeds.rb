require 'csv'

csv_text = File.read(Rails.root.join('db', 'data', 'ufo_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  s = AlienSighting.new
  s.date_posted = row['datetime']
  s.city = row['city']
  s.state = row['state']
  s.country = row['country']
  s.shape = row['shape']
  s.duration_in_seconds = row['duration (seconds)']
  s.comments = row['comments']
  s.latitude = row['latitude']
  s.longitude = row['longitude']
  s.save
end

puts "There are now #{AlienSighting.count} rows in the alien sightings table"
