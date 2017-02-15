require_relative('../db/sql_runner.rb')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i

  end

  def self.all()
      sql = "SELECT * FROM artists;"
      result = SqlRunner.run(sql)
      artists = result.map {|artist_hash| Artist.new(artist_hash)}
      return artists
    end

end