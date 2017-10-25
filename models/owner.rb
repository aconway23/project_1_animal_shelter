require('pg')
require_relative('../db/sql_runner/')


class Owner

  attr_reader :first_name, :last_name, :review_date, :address, :email, :phone, :id

  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @review_date = options['review_date']
    @address = options['address']
    @email = options['email']
    @phone = options['phone']

    if options["id"] != nil
      @id = options['id'].to_i
    end
  end



  def pretty_name()
      return "#{@first_name} #{@last_name}"
  end




  def save
    sql = "INSERT INTO owners
    (
    first_name,
    last_name,
    review_date,
    address,
    email,
    phone
    )
    VALUES
    (
    $1, $2, $3, $4, $5, $6
    )
    RETURNING *"
    values = [@first_name, @last_name, @review_date, @address, @email, @phone]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i

  end


  def self.all
    sql = "SELECT * FROM owners"
    values = []
    owners = SqlRunner.run(sql, values)
    result = owners.map{ |owner| Owner.new(owner)}
    return result
  end


  def self.delete_all
    sql = "DELETE FROM owners"
    values = []
    SqlRunner.run( sql, values )
    return nil
  end


  def update()
    sql = "UPDATE owners
    SET
    (
    first_name,
    last_name,
    review_date,
    address,
    email,
    phone

    ) =
    (
    $1, $2, $3, $4, $5, $6
    )
    WHERE id = $7"
    values = [@first_name, @last_name, @review_date, @address, @email, @phone, @id]
    SqlRunner.run( sql, values )
  end

  def animals()
    sql = "SELECT * FROM animals
          WHERE adopted_by = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|animal_hash| Animal.new(animal_hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    owners = SqlRunner.run( sql, values )
    result = Owner.new( owners.first )
    return result
  end




end
