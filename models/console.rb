require_relative('./property')
# require_relative('pry')

new_property_1 = {
  'address' => 'WASPS, Midmills Building, Inverness',
  'value' => 1000000,
  'number_of_bedrooms' => 5,
  'year_built' => 1896,
  'square_footage' => 2000
}

property_1 = Property.new(new_property_1)
property_1.save

property_1.value = 1001000
property_1.update

# property_1.delete

p property_1.find_by_id(1)

p property_1.find_by_address('WASPS, Midmills Building, Inverness')
