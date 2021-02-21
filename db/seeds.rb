puts 'Cleaning database...'
Serie.destroy_all
puts 'creating series...'

series = ['friends', 'the+office', 'game+of+thrones', 'atlanta', 'how+I+met+your+mother']

def create_serie(serie)
  url = "https://www.omdbapi.com/?t=#{serie}&apikey=adf1f2d7"
  serie_serialized = open(url).read
  serie_hash = JSON.parse(serie_serialized)
  rating = serie_hash["Ratings"][0]['Value']
  Serie.create!(title: serie_hash['Title'],
                rating: rating, image: serie_hash['Poster'])
end

series.each do |serie|
  create_serie(serie)
end






# url = 'http://www.omdbapi.com/?i=tt3896198&apikey=14eb96e7&'
# movie_serialized = open(url).read
# movies = JSON.parse(movie_serialized)
# ratings = movies["Ratings"]

# Serie.create!(title: ratings[0]["Value"])


puts "Created #{Serie.count} series!"
