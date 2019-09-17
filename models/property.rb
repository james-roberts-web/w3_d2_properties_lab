require 'pg'

class Property

  attr_accessor :address, :value, :number_of_bedrooms, :year_built, :square_footage
  attr_reader :id

  def initialize(options)

      @id = options['id'].to_i if options['id']
      @address = options['address']
      @value = options['value'].to_i
      @number_of_bedrooms = options['number_of_bedrooms'].to_i
      @year_built = options['year_built'].to_i
      @square_footage = options['square_footage'].to_i

  end

  def save

    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "INSERT INTO properties (address, value, number_of_bedrooms, year_built, square_footage)
    VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@address, @value, @number_of_bedrooms, @year_built, @square_footage]
    db.prepare('save', sql)
    new_property = db.exec_prepared('save', values)
    @id = new_property[0]['id']
    db.close

  end


  def update

    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "UPDATE properties
          SET address = $1,
          value = $2,
          number_of_bedrooms = $3,
          year_built = $4,
          square_footage = $5
          WHERE id = $6"
    db.prepare("property_update", sql)
    values = [@address, @value, @number_of_bedrooms, @year_built, @square_footage, @id]
    db.exec_prepared("property_update", values)
    db.close

  end

  def delete

    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "DELETE FROM properties
          WHERE id = $1"
    db.prepare('property_delete', sql)
    values = [@id]
    db.exec_prepared('property_delete', values)
    db.close

  end

  def find_by_id(property_id)

    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "SELECT * FROM properties
          WHERE id = $1"
    db.prepare('property_by_id', sql)
    values = [property_id]
    found_property_by_id = db.exec_prepared('property_by_id', values)
    db.close
    return Property.new(found_property_by_id[0])
    
  end

  def find_by_address(property_by_address

    db = PG.connect({dbname: 'properties', host: 'localhost'})
    sql = "SELECT * FROM properties
          WHERE address = $1"
    db.prepare('property_by_address', sql)
    values = [property_by_address]
    found_property_by_address = db.exec_prepared('property_by_address', values)
    db.close
    return Property.new(found_property_by_address[0])

  end

end
