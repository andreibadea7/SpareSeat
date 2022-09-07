# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

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
  Venue.create(name: stadium, city: city, country: country, capacity: capacity, address: address)
end

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
  Event.create(date: date, name: game, venue_id: Venue.where("name = ?", venue).ids.first, category: "Football")
end
