# CRUD Quiz

Use the solution to this afternoon's Property Tracker lab to answer the following questions. Please write your answers under each question, push the file to GitHub, and submit in the usual way.

## MVP Questions

In our Property Tracker application:

Q1. Where are we instantiating instances of the `Property` class?

property_1 = Property.new(new_property_1)



Q2. Where are we defining the SQL that enables us to save the ruby `Property` object into the database?

sql = "INSERT INTO properties (address, value, number_of_bedrooms, year_built, square_footage)
VALUES ($1, $2, $3, $4, $5) RETURNING id"


Q3. In `console.rb`, which lines modify the database?

property_1.save

property_1.value = 1001000
property_1.update

property_1.delete


Q4. Why do we not define the id of a `Property` object at the point we instantiate it (‘new it up’)?

Ruby doesn't create incremental IDs, they are generated by the database.



Q5. Where and how do we assign the id (that is generated by the database) to the ruby `Property` object?

@id = new_property[0]['id']


Q6. Why do we put a guard (an `if` clause) on the `@id` attribute in the constructor?

We're not entering an ID with new properties and it would read an error. The if is for searching through the passed in variable for initialization.


Q7. Why are some of the CRUD actions represented by instance methods, and others by class methods?

Some of the methods are related to objects and some are related to overall classes.



Q8. What type of data structure is returned by calls to `db.exec_prepared()`? In the `save` method, how do we access the id from the returned data structure?

a). It is an array or an array of hashes
b). by accessing the first index [0]['id']



Q9. Why do we use prepared statements when performing database operations?

Protection against SQL injection attacks.




## Extension Questions

Look at the `find_by_id` and `find_by_address` methods in the `Property` class.

Q10. What do they take in as their arguments?

ID = (1)
Address = ("WASPS, Midmills Building, Inverness")

Q11. What are their return values?

<Property:0x00007fd8ac8ecdf8 @address="WASPS, Midmills Building, Inverness", @value=1001000, @number_of_bedrooms=5, @year_built=1896, @square_footage=2000, @id=1>

<Property:0x00007fd8ac8dfec8 @address="WASPS, Midmills Building, Inverness", @value=1001000, @number_of_bedrooms=5, @year_built=1896, @square_footage=2000, @id=1>
