require_relative( '../db/sql_runner' )

class Lesson

  attr_accessor :title, :day_time, :capacity
  attr_reader :id

  def initialize( options )
    @title = options['title']
    @day_time = options['day_time']
    @capacity = options['capacity'].to_i
    @id = options['id'].to_i if options['id']
  end

  def title
    return @title
  end

  def day_time
    return @day_time
  end

  def capacity
    return @capacity
  end

  def save()
  sql = "INSERT INTO lessons
  (
    title,
    day_time,
    capacity
  )
  VALUES
  (
    $1, $2, $3
  )
  RETURNING id"
  values = [@title, @day_time, @capacity]
  results = SqlRunner.run(sql, values)  #WORKS
  @id = results.first()['id'].to_i
end


def members()
  sql = "SELECT m.* FROM members m INNER JOIN bookings b ON b.member_id = m.id WHERE b.lesson_id = $1;"
  values = [@id]
  results = SqlRunner.run(sql, values)
  return results.map { |member| Member.new(member) }
end

def spare_capacity
spare_capacity = @capacity -= self.members.length
return spare_capacity
end


def update
  sql = "UPDATE lessons
         SET title = $1,
         day_time = $2,
         capacity = $3
         WHERE id = $4"
  values = [@title, @day_time, @capacity, @id] #WORKS
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM lessons"
  results = SqlRunner.run( sql )
  return results.map { |lesson| Lesson.new( lesson ) } #WORKS
end

def self.find( id )
  sql = "SELECT * FROM lessons
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run( sql, values ) #WORKS
  return Lesson.new( results.first )
end

def self.delete_all()
  sql = "DELETE FROM lessons"
  SqlRunner.run( sql ) #WORKS
end

def self.delete(id)
  sql = "DELETE FROM lessons
  WHERE id = $1"
  values = [id]
  SqlRunner.run( sql, values )
end


end
