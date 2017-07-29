
####Here is the code from the category list maker. I would like it to write to a table or two, and be able to save, retrieve, delete, and print tables.
require 'sqlite3'
require 'twilio-ruby'
require_relative 'sms'

#Link necessary files
#Create two tables for categories and items
  #Category has id and category name
  #Item has id, item name, quantity, and foreign key to category

#Name your database or load an old one
  #IF it doesn't exist, create it
  #IF it does exist, ask if they want to pull it up or overwrite the items
  #Need some security measures in here!
def make_or_resuse_a_db(database)
  database += ".db"
 # $DB = SQLite3::Database.new("grocery_list.db")
  $DB = SQLite3::Database.new(database)
  $DB.results_as_hash = true
end

#Create the tables for category and items
  #send the commands to SQL when called
def create_category_table
category_table = <<-SQL
  CREATE TABLE IF NOT EXISTS category(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255)
  )
SQL
end

def create_item_table
  item_table = <<-SQL
    CREATE TABLE IF NOT EXISTS items(
      id INTEGER PRIMARY KEY,
      name VARCHAR(255),
      quantity INTEGER,
      category_name VARCHAR(255),
      FOREIGN KEY (category_name) REFERENCES category(id)
    )
  SQL
end


#Add category to the database
def add_categories(category)
  $DB.execute("INSERT INTO category (name) VALUES (?)", [category])
end

#Add/Update items
  #Ask user to enter items one at a time, with optional quantity
  #IF the item is already in the list
    #update the table with the new quantity
  #Assuming it's new,
    #Execute a SQL command to stuff that into the items table
def add_item(category_number, name, quantity=1)
 return false if $DB.execute("SELECT EXISTS(SELECT 1 FROM items WHERE name=? LIMIT 1)", [name]) == 1
  # ^^ returns 1 for yes and 0 for no
  $DB.execute("INSERT INTO items (name, quantity, category_name) VALUES (?, ?, ?)", [name, quantity, category_number])
end


#update an item name/quantity already in the list
def update_item(category_number, name, quantity=1)
  $DB.execute("UPDATE items SET name =?, quantity =? WHERE category_name=?;", [name, quantity, category_number])
end


#Look up category number for adding an item
  #select the category information from the database
  #return the id number for that category
def look_up_category_id(input_name)
  categories_from_db = $DB.execute("SELECT * FROM category WHERE name=?", [input_name])
  categories_from_db[0]["id"]
end


#delete an item
  #ask the user for the item they want to delete
  #remove the item from the table with a SQL command
def delete_item(name)
  $DB.execute("DELETE FROM items WHERE name=? LIMIT 1", [name])
end


#Make a user friendly list:
  #Pull the data from the database
  #List numerically by category and then alphabetically by item
  #Up case the categories
  #down case the items
def pretty_list
items_list_from_db = $DB.execute("SELECT category.name, items.name, items.quantity FROM category INNER JOIN items ON items.category_name = category.id")
list = {}
items_list_from_db.each do |hash|
    p hash
    if list.include?(hash[0])
     list[hash[0]][hash[1]] = hash[2]
    else
    item_and_quantity = {}
    item_and_quantity.store(hash[1], hash[2])
    list.store(hash[0], item_and_quantity)
    end
  end
  list.each do |key, values|
    puts "Category: #{key.upcase}"
    values.each do |item, quantity|
      puts "#{item.capitalize}: #{quantity}"
    end
  end
end

def write_to_file(list)
  somefile = File.open("sample.txt", "w")
  somefile.puts list
  somefile.close
end

def send_text_message(list)
  client.messages.create(
  from: "+19149964976",
  to: "+19144827293",
  body: list
)
end

#DRIVER CODE
#greet user, ask for a list of categories in the general order in which they shop:
# make_or_resuse_a_db("grocery_list")
# $DB.execute(create_category_table)
# $DB.execute(create_item_table)
# add_categories("Fruit and Veg")
# add_categories("Bakery")
# add_categories("Cereals")
# add_categories("Dairy")
# add_update_item(1, "apples", 2)
# add_update_item(2, "yogurt", 4)
# delete_item("carrots")
# pretty_list

#p look_up_category_id("dairy")





#List set up
  #Ask user for a list of categories in order of how they go around the grocery store
    #UNTIL the user types "done"
      #ask for the category
      #show the updated list (with index)
    #Next, show the finished list and ask if everything is in the correct order
      #IF yes, go on to the next step
      #ELSE
        #Ask the user which number is wrong and what number it should be
        #Delete from old place and insert into new place
    #Repeat until user is happy
    #Iterate through the list to add each to the SQL table
puts "Hello! Please type a name for a new or existing list:"
puts "(Type carefully because it will create a new list entirely if it's off.)"
list_name = gets.chomp.downcase
make_or_resuse_a_db(list_name)

puts "Okay! Let's add some categories to this list. Add them in the order you normally shop through the store for easiest use. Type 'done' when you're ready:"
input_category = gets.chomp.downcase
category_list = []

  until input_category == "done"
    category_list << input_category
    p category_list
    puts "Add another or type 'done':"
    input_category = gets.chomp.downcase
  end

#### Pull this stuff out into a method
puts "Great! Does the order on this look good to you?"
puts category_list.each_with_index {|category, index| puts "#{index}: #{category}"
puts "If you want to move an item, type the number. Otherwise, enter 'done':"
input_number = gets.chomp

  until input_number == "done"
    index = input_number.to_i
    puts "What number should it be at?"
    input_number = gets.chomp
    new_index = input_number.to_i

    puts "How's this? Type 'done' to continue or select another number to change:"
    input_number = gets.chomp
  end

#Add the corrected category list into the database
category_list.each {|category| add_categories(category)}


#Ask the user to add items one by one
  #Loop UNTIL they type 'done'
  #add each item to the table
  #maybe print the table each time
puts "Moving right along. Now we've got our categories, let's add some things to them! Put in items by category, the item name and then the quantity (optional)"
puts "Like this:  frozen pizza 3"
input_item = gets.chomp.downcase

until input_item == "done"
  item_array = input_item.split(" ")
  add_update_item(item_array[0], item_array[1], *item_array[2])
  pretty_list
  puts "Type the next item or 'done' to move on:"
  input_item = gets.chomp.downcase
end

pretty_list
puts "How's this look?"
puts "Type 'update' to update the quantity of the item."
input_change_table = gets.chomp.downcase

#put in a loop here for changing
puts "Okay. You know the drill now. Category, item name, quantity:"
updated_item = gets.chomp

#Streamline an add/update feature, where you select one and then loop until done, and go back to the add/update loop. Maybe have options for adding a new category or updating the name of something. That's a bit stretch though.

#here I would like the option to print the list physically, or maybe text it to yourself. IDK.
  #print a physical list for those kinds of people who walk into a bookstore and wax poetic about 'holding a book and turning the pages'
  #text a copy to those who are more practical, forgetful, or eco-conscious

puts "Save your file so you can print it and access it later:"

write_to_file(pretty_list)

puts "Text a copy of this list to yourself or some unsuspecting victim:"



#(STRETCH GOAL) have the ability to reuse this template or make a new one.
  #In which case it would
  #drop the content from the items table
  #jump right to adding items in the driver code




=begin
#Add additional items after the first round
  #input the list, new category, item and optional quantity
  #store in list

def grocery_list_maker(list, category, item, quantity=1)
  if list.include?(category)
    list[category][item] = quantity
  else
  item_and_quantity = {}
  item_and_quantity.store(item, quantity)
  list.store(category, item_and_quantity)
end
  list
end

#Update list method
  #take in the original list hash
  #take in the new category, item and quantity
  #use the category to look up the key and push the new value
  #output the updated hash

def update_grocery_list_quantity(list, category, item, quantity)
    list[category][item] = quantity
    list
end

#Delete item method:
  #take in original list hash,
  #take in category and item to be deleted
  #use hash key to look up item and delete it
  #output the updated hash
  def delete_item_grocery_list(list, category, item)
    list[category].delete(item)
    list
end

#Hash beautifier
  #take in original hash
  #use interpolation to make a pretty list
  #output pretty list

def grocery_list_beautifier(list)
  list.sort
  list.each do |key, values|
    puts "Category: #{key.capitalize}"
    values.each do |item, quantity|
      puts "#{item.capitalize}: #{quantity}"
    end
  end
end


#DRIVER CODE

puts "Hello!"
puts "Please add an item with no commas in the following order:"
puts "category item quantity(optional)"
input = gets.chomp
new_list = {}
until input == "done"
  input = input.split(" ")
  grocery_list_maker(new_list, input[0], input[1], *input[2])
  puts "Next item. Type 'done' when finished:"
  input = gets.chomp
end

p grocery_list_beautifier(new_list)

puts "Does this list look good?"
puts "Please enter 'add', 'update', or 'delete' to change items and quantities. Otherwise, type 'done' to exit."
input = gets.chomp


#####Case statements? See teacher feedback about loops. Actually, check all the feedback.


until input.downcase == "done"
  if input.downcase.include?("add")
    puts "Please enter the category and the item you want to add. Quantity is optional:"
    input = gets.chomp.split(" ")
    updated_list = grocery_list_maker(new_list, input[0], input[1], *input[2])

  elsif input.downcase.include?("update")
    puts "Please enter the category and the item you want to update and the new quantity:"
    input = gets.chomp.split(" ")
    updated_list = update_grocery_list_quantity(new_list, input[0], input[1], input[2])

  elsif input.downcase.include?("delete")
    puts "Please enter the category and the item you want to delete:"
    input = gets.chomp.split(" ")
    updated_list = delete_item_grocery_list(new_list, input[0], input[1])

  else
    puts "Sorry. Try that one more time."
    puts "Type 'add', 'update' or 'delete' if you want to change an item Type 'done' to exit."
    input = gets.chomp
  end

 puts "Here you go:"
 grocery_list_beautifier(updated_list)
 puts "Anything else to change? Please enter 'add', 'update' or 'delete' to fix an item, and 'done' to exit."
 input = gets.chomp
end

puts "Enjoy your shopping trip!"


###Use classes and separate files?
##overwrite puts with def to_s

=end



