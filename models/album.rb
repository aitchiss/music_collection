require_relative('../db/sql_runner.rb')

class Album

  attr_accessor :name, :genre
  attr_reader :id, :artist_id

  def initialize ( options )
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO albums (name, genre, artist_id) VALUES ('#{@name}', '#{@genre}', #{@artist_id}) RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

 def self.all()
   sql = "SELECT * FROM albums;"
   result = SqlRunner.run(sql)
   albums = result.map {|album_hash| Album.new(album_hash)}
   return albums
 end

 def artist()
   sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
   result = SqlRunner.run(sql)
   artist_hash = result[0]
   artist = Artist.new(artist_hash)
   return artist
 end

 def self.delete_all
   sql = "DELETE FROM albums;"
   SqlRunner.run(sql)
 end

 def delete
   sql = "DELETE FROM albums WHERE id = #{@id};"
   SqlRunner.run(sql)
 end

 def update
  sql = "UPDATE albums SET (name, genre, artist_id) = ('#{@name}', '#{@genre}', #{@artist_id}) WHERE id = #{@id}; "
  SqlRunner.run(sql)
 end




end