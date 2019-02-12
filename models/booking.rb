require_relative( '../db/sql_runner' )

class Booking

  attr_reader :first_name, :second_name, :id

  def initialize( options )
    @member_id = options['member_id'].to_i
    @lesson_id = options['lesson_id'].to_i
    @id = options['id'].to_i if options['id']
  end


  def member_id
    return @member_id
  end

  def lesson_id
    return @lesson_id
  end

  def save()
  sql = "INSERT INTO bookings
  (
    member_id,
    lesson_id
  )
  VALUES
  (
    $1, $2
  )
  RETURNING id"
  values = [@member_id, @lesson_id]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i #WORKS
end


def update
  sql = "UPDATE bookings
         SET member_id = $1,
         lesson_id = $2
         WHERE id = $3"
  values = [@member_id, @lesson_id, @id] #Doesnt work but is it needed??
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM bookings"
  results = SqlRunner.run( sql )
  return results.map { |booking| Booking.new( booking ) } #WORKS
end

def self.find( id )
  sql = "SELECT * FROM bookings
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run( sql, values )
  return Booking.new( results.first ) #WORKS
end

def member()
  sql = "SELECT * FROM members
  WHERE id = $1"
  values = [@member_id]
  results = SqlRunner.run( sql, values )
  return Member.new( results.first )
end

def lesson()
  sql = "SELECT * FROM lessons
  WHERE id = $1"
  values = [@lesson_id]
  results = SqlRunner.run( sql, values )
  return Lesson.new( results.first )
end

def self.delete_all()
  sql = "DELETE FROM bookings"
  SqlRunner.run( sql ) #WORKS
end

def self.delete(id)
  sql = "DELETE FROM bookings
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values ) #Accepts command but doesnt alter DB
end

end
