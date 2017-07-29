
####Here is the code from the category list maker. I would like it to write to a table or two, and be able to save, retrieve, delete, and print tables.
require 'sqlite3'
require 'faker'


db = SQLite3::Database.new("grocery_list.db")

def create_category_table
category_table = <<-SQL
  CREATE TABLE IF NOT EXISTS category(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255)
  )
SQL
end
### Ask people to enter items in the order you usually go through the store

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


#Link necessary files
#Create two tables for categories and items
  #Category has id and category name
  #Item has id, item name, quantity, and foreign key to category

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

#(STRETCH GOAL) have the ability to reuse this template or make a new one.
  #In which case it would jump right to adding items:


#Add/Update items
  #Ask user to enter items one at a time, with optional quantity
  #IF the item is already in the list
    #update the table with the new quantity
  #Assuming it's new,
    #Execute a SQL command to stuff that into the items table


#Name your list or load an old one
  #If it doesn't exist, create it
  #If it does exist, ask if they want to pull it up or overwrite the items
def add_categories(db, category)
  db.execute("INSERT INTO category (name) VALUES (?)", [category])

end

def add_update_item(db, category, name, quantity=1)

  db.execute("INSERT INTO items (name, quantity, category_name) VALUES (?, ?, ?)", [name, quantity, category])
end

#delete an item
  #ask the user for the item they want to delete
  #remove the item from the table with a SQL command




#DRIVER CODE
#greet user, ask for a list of categories in the general order in which they shop:

db.execute(create_category_table)
db.execute(create_item_table)
add_categories(db, "Fruit and Veg")
add_categories(db, "Dairy")
add_update_item(db, 1, "carrots", 5)
add_update_item(db, 2, "milk", 1)



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