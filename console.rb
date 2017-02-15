require('pry')
require_relative('./models/artist.rb')



artist1 = Artist.new(
  {'name' => "David Bowie"} 
  )

artist1.save

artist2 = Artist.new(
  {'name' => "Bruce Springsteen"}
  )

artist2.save



binding.pry
nil