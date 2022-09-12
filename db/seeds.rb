require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require "nokogiri"

def add_premier_league_venues_to_database
  # Event.delete_all
  # Venue.delete_all
  puts "Adding venues..."
  url = URI("https://v3.football.api-sports.io/teams?league=39&season=2022")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = 'v3.football.api-sports.io'
  request["x-rapidapi-key"] = 'd1e9aeabd9e475c76d7728ad89a684eb'

  response = http.request(request)

  data = JSON.parse(response.body)

  data["response"].each do |info|
    football_club = info["team"]["name"]
    Performer.create(name: football_club)

    stadium = info["venue"]["name"]
    city = info["venue"]["city"]
    country = info["team"]["country"]
    address = info["venue"]["address"]
    capacity = info["venue"]["capacity"]
    Venue.create(name: stadium,
                 city: city,
                 country: country,
                 capacity: capacity,
                 address: address)
  end
  puts "#{"\u2713".encode('utf-8') * 3} | All Premier League Venues have been Uploaded onto The Database"
end

def add_premier_league_events_to_database
  # Event.delete_all
  puts "Adding events..."
  url = URI("https://v3.football.api-sports.io/fixtures?league=39&season=2022")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = 'v3.football.api-sports.io'
  request["x-rapidapi-key"] = 'd1e9aeabd9e475c76d7728ad89a684eb'

  response = http.request(request)

  data_fixtures = JSON.parse(response.body)

  data_fixtures["response"].each do |info|
    date = info["fixture"]["date"]
    home_team = info["teams"]["home"]["name"]
    away_team = info["teams"]["away"]["name"]
    venue = info["fixture"]["venue"]["name"]
    game = "#{home_team} vs #{away_team}"
    if date > Date.today.to_s
      Event.create(date: date,
                   name: game,
                   venue_id: Venue.where("name = ?", venue).ids.first,
                   category: "premier_league_football")
    end
  end
  puts "#{"\u2713".encode('utf-8') * 3} | All Premier League Events have been Uploaded onto The Database"
end

def add_images_to_premier_league_stadiums_venues
  # Image.delete_all
  puts "Adding images..."
  url = 'https://www.transfermarkt.com/premier-league/stadien/wettbewerb/GB1/galerie/1'
  x = 1
  while x <= 20
    x > 1 ? current_page = "#{url + "/page/#{x}"}" : current_page = url
    serialized = URI.open(current_page).read
    html_doc = Nokogiri::HTML(serialized)
    stadium_name = html_doc.search(".header_block span").text.split(" -")[0]
    image_url = html_doc.search(".galerie-bild").attr("src").value.split("?")[0]
    venue_id = Venue.where("REPLACE(name, 'The American Express Community', 'AMEX') ILIKE ?",
              stadium_name).or(Venue.where("REPLACE(name, '.', '') ILIKE ?", stadium_name)).first.id
    Image.create(image_url: image_url,
                 imageable_id: venue_id,
                 imageable_type: "Venue")
    x += 1
  end
  puts "#{"\u2713".encode('utf-8') * 3} | All Premier League Images have been Uploaded onto The Database"
end

def add_championship_venues_to_database
  # Event.delete_all
  # Venue.delete_all
  puts "Adding venues..."
  url = URI("https://v3.football.api-sports.io/teams?league=40&season=2022")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = 'v3.football.api-sports.io'
  request["x-rapidapi-key"] = 'd1e9aeabd9e475c76d7728ad89a684eb'

  response = http.request(request)

  data = JSON.parse(response.body)

  data["response"].each do |info|
    football_club = info["team"]["name"]
    Performer.create(name: football_club)

    stadium = info["venue"]["name"]
    city = info["venue"]["city"]
    country = info["team"]["country"]
    address = info["venue"]["address"]
    capacity = info["venue"]["capacity"]
    Venue.create(name: stadium,
                 city: city,
                 country: country,
                 capacity: capacity,
                 address: address)
  end
  puts "#{"\u2713".encode('utf-8') * 3} | All Championship Venues have been Uploaded onto The Database"
end

def add_championship_events_to_database
  # Event.delete_all
  puts "Adding events..."
  url = URI("https://v3.football.api-sports.io/fixtures?league=40&season=2022")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = 'v3.football.api-sports.io'
  request["x-rapidapi-key"] = 'd1e9aeabd9e475c76d7728ad89a684eb'

  response = http.request(request)

  data_fixtures = JSON.parse(response.body)

  data_fixtures["response"].each do |info|
    date = info["fixture"]["date"]
    home_team = info["teams"]["home"]["name"]
    away_team = info["teams"]["away"]["name"]
    venue = info["fixture"]["venue"]["name"]
    game = "#{home_team} vs #{away_team}"
    if date > Date.today.to_s
      Event.create(date: date,
                   name: game,
                   venue_id: Venue.where("name = ?", venue).ids.first,
                   category: "championship_football")
    end
  end
  puts "#{"\u2713".encode('utf-8') * 3} | All Championship Events have been Uploaded onto The Database"
end

def add_images_to_championship_stadiums_venues
  # Image.delete_all
  puts "Adding images..."
  url = 'https://www.transfermarkt.com/championship/stadien/wettbewerb/GB2/galerie/1'
  x = 1
  while x <= 20
    x > 1 ? current_page = "#{url + "/page/#{x}"}" : current_page = url
    serialized = URI.open(current_page).read
    html_doc = Nokogiri::HTML(serialized)
    stadium_name = html_doc.search(".header_block span").text.split(" -")[0]
    image_url = html_doc.search(".galerie-bild").attr("src").value.split("?")[0]
    venue_id = Venue.where("REPLACE(name, 'The ', '') ILIKE ?",
    stadium_name).or(Venue.where("REPLACE(name, '.', '') ILIKE ?", stadium_name)).ids.first
    Image.create(image_url: image_url,
                 imageable_id: venue_id,
                 imageable_type: "Venue")
    x += 1
  end
  puts "#{"\u2713".encode('utf-8') * 3} | All Championship Images have been Uploaded onto The Database"
end

def add_league_one_venues_to_database
  # Event.delete_all
  # Venue.delete_all
  puts "Adding venues..."
  url = URI("https://v3.football.api-sports.io/teams?league=41&season=2022")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = 'v3.football.api-sports.io'
  request["x-rapidapi-key"] = 'd1e9aeabd9e475c76d7728ad89a684eb'

  response = http.request(request)

  data = JSON.parse(response.body)

  data["response"].each do |info|
    football_club = info["team"]["name"]
    Performer.create(name: football_club)

    stadium = info["venue"]["name"]
    city = info["venue"]["city"]
    country = info["team"]["country"]
    address = info["venue"]["address"]
    capacity = info["venue"]["capacity"]
    Venue.create(name: stadium,
                 city: city,
                 country: country,
                 capacity: capacity,
                 address: address)
  end
  puts "#{"\u2713".encode('utf-8') * 3} | All League One Venues have been Uploaded onto The Database"
end

def add_league_one_events_to_database
  # Event.delete_all
  puts "Adding events..."
  url = URI("https://v3.football.api-sports.io/fixtures?league=41&season=2022")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = 'v3.football.api-sports.io'
  request["x-rapidapi-key"] = 'd1e9aeabd9e475c76d7728ad89a684eb'

  response = http.request(request)

  data_fixtures = JSON.parse(response.body)

  data_fixtures["response"].each do |info|
    date = info["fixture"]["date"]
    home_team = info["teams"]["home"]["name"]
    away_team = info["teams"]["away"]["name"]
    venue = info["fixture"]["venue"]["name"]
    game = "#{home_team} vs #{away_team}"
    if date > Date.today.to_s
      Event.create(date: date,
                   name: game,
                   venue_id: Venue.where("name = ?", venue).ids.first,
                   category: "league_one_football")
    end
  end
  puts "#{"\u2713".encode('utf-8') * 3} | All League One Events have been Uploaded onto The Database"
end

def add_images_to_league_one_stadiums_venues
  # Image.delete_all
  puts "Adding images..."
  url = 'https://www.transfermarkt.com/league-one/stadien/wettbewerb/GB3/galerie/1'
  x = 1
  while x <= 20
    x > 1 ? current_page = "#{url + "/page/#{x}"}" : current_page = url
    serialized = URI.open(current_page).read
    html_doc = Nokogiri::HTML(serialized)
    stadium_name = html_doc.search(".header_block span").text.split(" -")[0]
    image_url = html_doc.search(".galerie-bild").attr("src").value.split("?")[0]
    venue_id = Venue.where("REPLACE(name, '.', '') ILIKE ?", stadium_name).ids.first
    Image.create(image_url: image_url,
                 imageable_id: venue_id,
                 imageable_type: "Venue")
    x += 1
  end
  puts "#{"\u2713".encode('utf-8') * 3} | All League One Images have been Uploaded onto The Database"
end

add_premier_league_venues_to_database
add_premier_league_events_to_database
# add_championship_venues_to_database
# add_championship_events_to_database
# add_league_one_venues_to_database
# add_league_one_events_to_database
add_images_to_premier_league_stadiums_venues
# add_images_to_championship_stadiums_venues
# add_images_to_league_one_stadiums_venues

first_name = ["Alex", "Rory", "Milly", "Curtis", "Hugh", "Adam", "Mike", "George", "Nick", "Laura"]
last_name = ["Booth", "Smith", "Adams", "Beaney", "Hall", "Boyd", "Iffla", "Gooding", "Warren", "Phillips"]

20.times do
  User.create!(
    first_name: first_name.sample,
    last_name: last_name.sample,
    email: "user#{rand(1..1000)}@gmail.com",
    password: "topsecret",
    password_confirmation: "topsecret"
  )
end

2000.times do
  Ticket.create!(
    event_id: Event.all.sample.id,
    owner_id: User.all.sample.id,
    price_cents: rand(5000..15_000),
    seat: "#{rand(1..100)}#{Array('A'..'Z').sample}"
  )
end
