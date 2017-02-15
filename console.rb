require('pry')
require_relative('./models/artist.rb')
require_relative('./models/album.rb')



artist1 = Artist.new(
  {'name' => "David Bowie"} 
  )

artist1.save

artist2 = Artist.new(
  {'name' => "Bruce Springsteen"}
  )

artist2.save

album1 = Album.new({
  'name' => 'Hunky Dory',
  'genre' => 'rock',
  'artist_id' => artist1.id
})

album1.save

album2 = Album.new({
  'name' => 'Born to Run',
  'genre' => 'rock',
  'artist_id' => artist2.id
  })

album2.save



binding.pry
nil