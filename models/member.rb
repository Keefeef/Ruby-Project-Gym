require_relative( '../db/sql_runner' )

class Member

  attr_reader :first_name, :second_name, :age, :id

  def initialize( options )
    @first_name = options['first_name']
    @second_name = options['second_name']
    @age = options['age'].to_i
    @id = options['id'].to_i if options['id']
  end

  def pretty_name
    return "#{@first_name.capitalize}, #{@second_name.capitalize}"
  end

  def age
    return @age
  end 


  def save()
    sql = "INSERT INTO members
    (
      first_name,
      second_name,
      age
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @second_name, @age]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def lessons
  sql = "SELECT l.* FROM lessons l INNER JOIN bookings b ON b.lesson_id = l.id WHERE b.member_id = $1;"
  values = [@id]
  results = SqlRunner.run(sql, values)
  return results.map { |lesson| Lesson.new(lesson) }
end

  def update
    sql = "UPDATE members
    SET first_name = $1,
    second_name = $2,
    age = $3
    WHERE id = $4"
    values = [@first_name, @second_name, @age, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run( sql )
    return results.map { |member| Member.new( member ) }
  end

  def self.find( id )
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [@id]
    results = SqlRunner.run( sql, values ).first
    member = Member.new(results)
    return member
  end

  def self.delete(id)
    sql = "DELETE FROM members
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

end
