# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airport_codes = %w[JAS NYR HCZ KIX JHB]
airport_names = ["Jasper Country Airport", "Nyurba Airport", "Chenzhou Beihu Airport", "Kansai International Airport", "Senai International Airport"]

airport_codes.zip(airport_names).each do |code, name|
  Airport.create code: code, name: name
end

airport_ids = [[1, 2], [2, 1], [1, 5], [2, 3], [4, 3]]

airport_ids.each do |depart_airport_id, arrive_airport_id|
  Flight.create(departure_airport_id: depart_airport_id,
                arrival_airport_id: arrive_airport_id,
                depart: DateTime.now,
                duration: 2.hours)
end
