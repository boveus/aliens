require 'csv'

def get_date(date)
  DateTime.strptime(date, "%m/%d/%Y %H:%M")
end

csv_text = File.read(Rails.root.join('db', 'data', 'ufo_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  s = AlienSighting.new
  # some of the dates pre 2000 are getting nill'd.
  # need to adjust this to use strptime to seed dates
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

puts "There are now #{AlienSighting.count} rows in the alien sightings table"
