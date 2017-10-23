require('pg')
require_relative('../db/sql_runner/')


class Owner

  attr_reader :first_name, :last_name, :review_date
  attr_accessor :address, :email, :phone, :id


  def initialize(options)
    @first_name = options['first_name']
    @last_name = options['last_name']
    @review_date = options['review_date'].to_i
    @address = options['address']
    @email = options['email']
    @phone = options['phone'].to_i
    @id = options['id'].to_i

  end



  def self.all
    sql = 'SELECT * FROM owners'
    values = []
    owner = SqlRunner.run(sql, values)
    result = owners.map{ |owner| Owner.new(owner)}
    return result
  end



end
