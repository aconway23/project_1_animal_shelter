require('pg')
require_relative('../db/sql_runner/')

class Animal

  attr_reader :adopted_by

  def initialize(options)
    if options["adopted_by"] != nil
      @adopted_by = options["adopted_by"].to_i
    end



  end
end
