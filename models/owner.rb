require('pg')
require_relative('../db/sql_runner/')


class Owner

  attr_reader :first_name, :last_name, :review_date
  attr_accessor :address, :email, :phone, :id


  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @review_date = options['review_date']
    @address = options['address']
    @email = options['email']
    @phone = options['phone']
    @id = options['id'].to_i

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
    sql = 'SELECT * FROM owners'
    values = []
    owners = SqlRunner.run(sql, values)
    result = owners.map{ |owner| Owner.new(owner)}
    return result
  end


  # def delete
  #   sql =
  # end



end
