
# Cat test_data.txt | ruby shopping_list.rb

# METHOD DECLARATIONS

#Link some stuff:
require 'sqlite3'
require 'hirb'


#Name your database or load an old one
  #IF it doesn't exist, create it
  #IF it does exist, pull it up
def make_or_resuse_a_db(database)
  database += ".db"
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
      item_name VARCHAR(255),
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

def category_string_pre_check(category_string)
category_string.each_with_index {|category, index| puts "#{index}: #{category}" }
end

def parse_text(input)
  input_array = input.split(",")
end

#Add/Update items
  #Ask user to enter items one at a time, with optional quantity
  #IF the item is already in the list
    #update the table with the new quantity
  #Assuming it's new,
    #Execute a SQL command to stuff that into the items table
def add_item(category_number, name, quantity=1)
 return false if $DB.execute("SELECT EXISTS(SELECT 1 FROM items WHERE item_name=? LIMIT 1)", [name]) == 1 # <- returns 1 for yes and 0 for no
  $DB.execute("INSERT INTO items (item_name, quantity, category_name) VALUES (?, ?, ?)", [name, quantity, category_number])
end


#update an item name/quantity already in the list
def update_item(name, quantity=1)
  $DB.execute("UPDATE items SET item_name =?, quantity =? WHERE item_name=?;", [name, quantity, name])
end


#Look up category number for adding an item
  #select the category information from the database
  #return the id number for that category
def look_up_category_id(input_name)
  categories_from_db = $DB.execute("SELECT * FROM category WHERE name=?", [input_name])
  categories_from_db[0]["id"]
end


#Delete an item
  #ask the user for the item they want to delete
  #remove the item from the table with a SQL command
def delete_item(name)
  $DB.execute("DELETE FROM items WHERE item_name=? LIMIT 1", [name])
end


#Dangerous option!
  #clear all the data from the items table
  #Useful for using a db as a template
  #DANGER WILL ROBINSON!
def delete_all_items_from_item_table!
  $DB.execute("DELETE FROM items")
end


#Make a user friendly list:
  #Pull the data from the database
  #List numerically by category and then alphabetically by item
  #Up case the categories
  #down case the items
def pretty_list
items_list_from_db = $DB.execute("SELECT category.name, items.item_name, items.quantity FROM category INNER JOIN items ON items.category_name = category.id")
list = {}
items_list_from_db.each do |hash|
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


#Print out a human-friendly list of the categories to show when adding categories later on
  #create an empty string for the list
  #grab the category names from the database
  #stuff each category name into the string
  #return the string
def pretty_category_list
  category_list = ""
  items_list_from_db = $DB.execute("SELECT category.name FROM category")
  items_list_from_db.each do |hash|
    category_list += hash[0]
    category_list += ", "
  end
  category_list
end


#Write the list to file for printing
  #take in the list and the filename
def write_to_file(list, file_name)
  file_name += ".txt"
  user_file = File.open(file_name, "w")
  user_file.puts Hirb::Helpers::AutoTable.render(list)
  #user_file.puts list
  user_file.close
end


#BETA!
#Send the list via text message
   #Still in progress


#DRIVER CODE

#List set up
  #Ask the user for the name of the list.
  #Hope they can type it correctly. They've been warned.
puts "Hello! If you want to make a new list, please choose a name. If you'd like to load a list, type the name of the file without the extension, like this:"
puts "grocery_list"
puts "(Type carefully because it will create a new list entirely if it's off. No pressure or anything.)"
    list_name = gets.chomp.downcase
    make_or_resuse_a_db(list_name)

#Make the tables
$DB.execute(create_category_table)
$DB.execute(create_item_table)


 #Ask user for a list of categories in order of how they go around the grocery store
    #UNTIL the user types "done"
      #ask for the category
      #show the updated list (with index)
puts "If you loaded a list, it has these categories already:"
p pretty_category_list
puts "Okay! Let's add some categories to this list. Add them in the order you normally shop through the store for easiest use. Type 'done' when you're ready to move on:"
input_category = gets.chomp.downcase
category_list = []

  until input_category == "done"
    category_list << input_category
    p category_list
    puts "Add another or type 'done':"
    input_category = gets.chomp.downcase
  end


#Next, show the finished list and ask if everything is in the correct order
   #IF yes, go on to the next step
   #ELSE
     #Ask the user which number is wrong and what number it should be
     #Delete from old place and insert into new place
   #Repeat until user is happy
puts "Great! Does the order on this look good to you?"
category_string_pre_check(category_list)
puts "If you want to move an item, type the number. Otherwise, enter 'done':"
input_number = gets.chomp

  until input_number == "done"
    index = input_number.to_i
    puts "What number should it be at?"
    input_number = gets.chomp
    new_index = input_number.to_i
    category_list.insert(new_index, category_list.delete_at(index))
    category_string_pre_check(category_list)
    puts "How's this? Type 'done' to continue or select another number to change:"
    input_number = gets.chomp
  end

#Iterate through the list to add each category to the category table
category_list.each {|category| add_categories(category)}


#Allow the user to choose between several list-changing options
#They can:
  #Add a new item
  #Update the quantity of an item
  #Delete one item or the whole shebang
  #Add a category
puts "What would you like to do?"
puts "Enter 'add item', 'update quantity', 'add category', or 'delete options'"
puts "To continue to the next step, type 'done'"
desired_function = gets.chomp.downcase

until desired_function == "done"
  case
    #Ask the user to add items one by one
      #Loop UNTIL they type 'done'
      #add each item to the table
      #print the updated table each time
    when desired_function.include?("item")
      puts "Add items separated by commas in order of: category, item name and then the quantity (optional)"
      puts "Like this:  frozen, pizza, 3"
      input_item = gets.chomp.downcase
          until input_item == "done"
            item_array = parse_text(input_item)
            category_id = look_up_category_id(item_array[0])
            add_item(category_id, item_array[1], *item_array[2])
            pretty_list
            puts "Type the next item or 'done' to move on:"
            input_item = gets.chomp.downcase
          end


    #Ask the user what item to update and its new quantity
      #Loop UNTIL they type 'done'
      #update each item in the table
      #print the table for them to look at
    when desired_function.include?("quantity")
      pretty_list
      puts "Okay. You know the drill by now. Category, item name, quantity:"
      updated_item = gets.chomp.downcase
        until updated_item == "done"
          item_array = parse_text(updated_item)
          update_item(item_array[1], *item_array[2])
          pretty_list
          puts "Type the next item to update or 'done' to move on:"
          updated_item = gets.chomp.downcase
        end


    #Ask the user if they want to delete one or all items
      #IF one:
        #get the item name to delete
        #take it off the list
        #ask for the next
      #ELSE
        #DANGER!
        #make sure they're sure
        #delete all the content from the items table
      #start them back at the beginning if they have invalid input to prevent catastrophic data loss
    when desired_function.include?("delete")
      puts "I see you live dangerously. Would you like to delete items individually or kill them all? Type 'one' or 'all':"
        dangerous = gets.chomp.downcase
        if dangerous == "one"
          pretty_list
          puts "Enter the name of the item to delete:"
          #NOT WORKING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          delete_single_item = gets.chomp.downcase
          delete_item(delete_single_item)
          pretty_list
        elsif dangerous == "all"
          pretty_list
          puts "Whoa. You sure you want to clear the entire list? I can't save you if you do this. Type 'yes' to destroy all the things or 'no' to go back to the update menu"
          sureness = gets.chomp.downcase
          if sureness == "yes"
            #BREAKS ALL THE THINGS
          delete_all_items_from_item_table!
          elsif sureness == "no"
            puts "Glad I talked you back from the edge there."
          else
            puts "Was that a yes or no? Try again."
          end
        else
          "Dunno what you just typed. Try again."
        end


    #Ask user what category to add
      #Print a list of the categories, and tell them they only show up on the list if they have an item in them
      #Check that it's not on the list
      #Add the new category to the table
    when desired_function.include?("category")
      puts "A category doesn't show on the usual list until an item is added to it. These are your current categories:"
      p pretty_category_list
      puts "Enter a category to add or type 'done' to go back to the menu."
      input_add_category = gets.chomp.downcase
      until input_add_category == 'done'
        add_categories(input_add_category)
        p pretty_category_list
        puts "Enter a category to add or type 'done' to go back to the menu"
        input_add_category = gets.chomp.downcase
      end


    #Catch-all for invalid input:
    else
      puts "I'm sorry. That's some invalid text you've got there."
  end
  puts "What would you like to do?"
  puts "Enter 'add item', 'update quantity', 'add category' or 'delete options'"
  puts "To exit, type 'done'"
  desired_function = gets.chomp.downcase
end


#print a physical list for those kinds of people who walk into a bookstore and wax poetic about 'holding a book and turning the pages':
puts "Save your file so you can print it and access it later:"
puts "Please name your file. This will create a few file or overwrite an old file of the same name."
file_name = gets.chomp.downcase
write_to_file(pretty_list, file_name)


#text a copy to those who are more practical, forgetful, or eco-conscious:
#puts "Text a copy of this list to yourself or some unsuspecting victim:"
#send_text_message(pretty_list)
#Not functional at the moment. Sorry! It's like, 70% of the way there

puts "Happy shopping!"

