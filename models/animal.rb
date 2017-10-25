require('pg')
require_relative('../db/sql_runner/')

class Animal

  attr_reader :name, :breed, :image_url, :city, :admis_date, :adopt_date, :adoptable, :adopted_by, :id

  def initialize(options)
    @name = options['name']
    @breed = options['breed']
    @city = options['city']
    @image_url = options['image_url']
    @admis_date = options['admis_date']
    @adopt_date = options['adopt_date']
    @adoptable = options['adoptable']
    if options['adopted_by'] != nil
      @adopted_by = options['adopted_by'].to_i
    end

    if options["id"] != nil
      @id = options["id"].to_i
    end
  end


  def pretty_name()
      return "#{@first_name}"
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
      adoptable,
      image_url
      )
      VALUES
      (
      $1, $2, $3, $4, $5, $6, $7, $8
      )
      RETURNING *"
      values = [@name, @breed, @city, @admis_date, @adopt_date, @adopted_by, @adoptable, @image_url]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i

    end

    def self.all
      sql = "SELECT * FROM animals"
      values = []
      animals = SqlRunner.run(sql, values)
      result = animals.map{ |animal| Animal.new(animal)}
      return result
    end

    def delete()
      sql = "DELETE FROM animals WHERE id = $1"
      values = [@id]
      SqlRunner.run( sql, values )
      return nil
    end


    def self.delete_all
      sql = "DELETE FROM animals"
      values = []
      SqlRunner.run( sql, values )
      return nil
    end

    def update
      sql = "UPDATE animals
      SET
      (
      name,
      breed,
      city,
      admis_date,
      adopt_date,
      adopted_by,
      adoptable,
      image_url

      ) =
      (
      $1, $2, $3, $4, $5, $6, $7, $8
      )
      WHERE id = $9"
      values = [@name, @breed, @city, @admis_date, @adopt_date, @adopted_by, @adoptable, @image_url, @id]
      SqlRunner.run( sql, values )
    end

    def self.find(id)
      sql = "SELECT * FROM animals WHERE id = $1"
      values = [id]
      animals = SqlRunner.run( sql, values )
      result = Animal.new( animals.first )
      return result
    end

end
