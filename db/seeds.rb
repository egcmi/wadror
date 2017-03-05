users = 100           # jos koneesi on hidas, riittää esim 100
breweries = 50       # jos koneesi on hidas, riittää esim 50
beers_in_brewery = 40
ratings_per_user = 30

Brewery.all.each do |b|
  n = rand(beers_in_brewery)
  (1..n).each do |i|
    beer = Beer.create! name:"Beer #{b.id} -- #{i}", style_id:Style.last.id
    b.beers << beer
  end
end

User.all.each do |u|
  n = rand(ratings_per_user)
  beers = Beer.all.shuffle
  (1..n).each do |i|
    r = Rating.new score:(1+rand(50))
    beers[i].ratings << r
    u.ratings << r
  end
end