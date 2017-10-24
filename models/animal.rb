require('pg')
require_relative('../db/sql_runner/')

class Animal

  attr_reader :name, :breed, :city, :admis_date, :adopt_date, :adoptable, :adopted_by

  def initialize(options)
    @name = options['name']
    @breed = options['breed']
    @city = options['city']
    @admis_date = options['admis_date']
    @adopt_date = options['adopt_date']
    @adoptable = options[true]
    if options['adopted_by'] != nil
      @adopted_by = options['adopted_by'].to_i
    end


    def save
      sql = "INSERT INTO animals
      (
      name,
      breed,
      city,
      admis_date,
      adopt_date,
      adopted_by,
      adoptable
      )
      VALUES
      (
      $1, $2, $3, $4, $5, $6, $7
      )
      RETURNING *"
      values = [@name, @breed, @city, @admis_date, @adopt_date, @adopted_by, @adoptable]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i

    end











  end
end
