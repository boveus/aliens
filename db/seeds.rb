require 'csv'

def get_date(date)
  DateTime.strptime(date, "%m/%d/%Y %H:%M")
end

csv_text = File.read(Rails.root.join('db', 'data', 'ufo_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  s = AlienSighting.new
  s.date_posted = get_date(row['datetime'])
  s.city = row['city']
  s.state = row['state']
  s.country = row['country']
  s.shape = row['shape']
  s.duration_in_seconds = row['duration (seconds)']
  s.comments = row['comments']
  s.latitude = row['latitude']
  s.longitude = row['longitude ']
  s.save
end

csv_text = File.read(Rails.root.join('db', 'data', 'population_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  sp = StatePopulation.new
  sp.state = row[4]
  sp.population = row[5]
  sp.save
end

puts "There are now #{AlienSighting.count} rows in the alien sightings table"
puts "There are now #{StatePopulation.count} rows in the state populations table"
