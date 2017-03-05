json.array!(@breweries) do |brewery|
  json.extract! brewery, :id, :name, :year, :active
  json.beer_count brewery.beers.count
end