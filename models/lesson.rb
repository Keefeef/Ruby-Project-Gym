require_relative( '../db/sql_runner' )

class Lesson

  attr_reader :title, :day_time, :id

  def initialize( options )
    @title = options['title']
    @day_time = options['day_time']
    @id = options['id'].to_i if options['id']
  end

  def save()
  sql = "INSERT INTO lessons
  (
    title,
    day_time
  )
  VALUES
  (
    $1, $2
  )
  RETURNING id"
  values = [@title, @day_time]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end


def members()
  sql = "SELECT m.* FROM members m INNER JOIN bookings b ON b.member_id = m.id WHERE b.lesson_id = $1;"
  values = [@id]
  results = SqlRunner.run(sql, values)
  return results.map { |member| Member.new(member) }
end

def update
  sql = "UPDATE lessons
         SET title = $1,
         day_time = $2
         WHERE id = $3"
  values = [@title, @day_time, @id]
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM lessons"
  results = SqlRunner.run( sql )
  return results.map { |lesson| Lesson.new( lesson ) }
end

def self.find( id )
  sql = "SELECT * FROM lessons
  WHERE id = $1"
  values = [@id]
  results = SqlRunner.run( sql, values )
  return Lesson.new( results.first )
end

def self.delete(id)
  sql = "DELETE FROM lessons
  WHERE id = $1"
  values = [@id]
  SqlRunner.run( sql, values )
end


end
