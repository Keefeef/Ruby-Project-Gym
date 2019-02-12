require_relative( '../db/sql_runner' )

class Member

  attr_accessor :first_name, :second_name, :age, :status
  attr_reader :id

  def initialize( options )
    @first_name = options['first_name']
    @second_name = options['second_name']
    @age = options['age'].to_i
    @status = options['status']
    @id = options['id'].to_i if options['id']
  end

  def pretty_name
    return "#{@first_name.capitalize} #{@second_name.capitalize}"
  end

  def age
    return @age
  end

  def status
    return @status
  end


  def save()
    sql = "INSERT INTO members
    (
      first_name,
      second_name,
      age,
      status
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@first_name, @second_name, @age, @status] # WORKS
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
    age = $3,
    status = $4
    WHERE id = $5"
    values = [@first_name, @second_name, @age, @status, @id] # WORKS
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM members"
    results = SqlRunner.run( sql )
    return results.map { |member| Member.new( member ) } #WORKS
  end

  def self.find( id )
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values ).first #WORKS
    member = Member.new(results)
    return member
  end

  def self.delete_all()
  sql = "DELETE FROM members"  #WORKS
  SqlRunner.run( sql )
end

  def self.delete(id)
    sql = "DELETE FROM members
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )  #WORKS
  end

end
