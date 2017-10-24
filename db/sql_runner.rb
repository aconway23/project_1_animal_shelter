require('pg')

class SqlRunner
# 127.0.0.1
  def self.run( sql, values )
    begin
      db = PG.connect({ dbname: 'animal_shelter', host: 'localhost' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close
    end
    return result
  end

end
