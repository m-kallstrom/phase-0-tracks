
####Here is the code from the category list maker. I would like it to write to a table or two, and be able to save, retrieve, delete, and print tables.

# METHOD DECLARATIONS

#Link some stuff:
require 'sqlite3'
require 'twilio-ruby'

#Auth stuff for text messages:
client = Twilio::REST::Client.new(
  ENV['AC77a8176b43f4ea62f3a5da4e4753ca1a'],
  ENV['71a42cf85828237e76b4531103039e81']
)


#Name your database or load an old one
  #IF it doesn't exist, create it
  #IF it does exist, ask if they want to pull it up or overwrite the items
  #Need some security measures in here!
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
def update_item(name, quantity=1)
  $DB.execute("UPDATE items SET name =?, quantity =? WHERE name=?;", [name, quantity, name])
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


#Dangerous option!
  #clear all the data from the items table
  #Useful for using a db as a template
  #DANGER WILL ROBINSON!
def delete_all_items_from_item_table!
  $DB.execute("DELETE * FROM items")
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
  end
  category_list
end


#Write the list to file for printing
  #take in the list
def write_to_file(list)
  somefile = File.open("sample.txt", "w")
  somefile.puts list
  somefile.close
end


#BETA!
#Send the list via text message
  #RIGHT NOW CAN ONLY TEXT ME
  #BUT
  #If this were a real thing, have the user provide their phone number
  #send list via text
def send_text_message(list)
  client.messages.create(
  from: "+19149964976",
  to: "+19144827293",
  body: list
)
end


#DRIVER CODE

#List set up
  #Ask the user for the name of the list.
  #Hope they can type it correctly. They've been warned.
puts "Hello! If you want to make a new list, please choose a name. If you'd like to load a list, type the name of the file without the extension, like this:"
puts "grocery_list"
puts "(Type carefully because it will create a new list entirely if it's off. No pressure or anything.)"
    list_name = gets.chomp.downcase
    make_or_resuse_a_db(list_name)


 #Ask user for a list of categories in order of how they go around the grocery store
    #UNTIL the user types "done"
      #ask for the category
      #show the updated list (with index)
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

#Iterate through the list to add each category to the category table
category_list.each {|category| add_categories(category)}


#Allow the user to choose between several list-changing options
#They can:
  #Add a new item
  #Update the quantity of an item
  #Delete one item or the whole shebang
  #Add a category
puts "What would you like to do?"
puts "Enter 'add item', 'update quantity', or 'add category', 'delete items'"
puts "To exit, type 'done'"
desired_function = gets.chomp.downcase

until desired_function == "done"
  case
    #Ask the user to add items one by one
      #Loop UNTIL they type 'done'
      #add each item to the table
      #print the updated table each time
    when desired_function.include?("item")
      puts "Add items by category, item name and then the quantity (optional)"
      puts "Like this:  frozen pizza 3"
      input_item = gets.chomp.downcase
          until input_item == "done"
            item_array = input_item.split(" ")
           #This has to call the category number fuction!!!!!
           add_update_item(item_array[0], item_array[1], *item_array[2])
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
      puts "Okay. You know the drill now. Category, item name, quantity:"
      updated_item = gets.chomp.downcase
        until updated_item == "done"
          item_array = updated_item.split(" ")
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
          delete_single_item = gets.chomp.downcase
          delete_item(delete_single_item)
          pretty_list
        elsif dangerous == "all"
          pretty_list
          puts "Whoa. You sure you want to clear the entire list? I can't save you if you do this. Type 'yes' to destroy all the things or 'no' to go back to the update menu"
          sureness = gets.chomp.downcase
          if sureness == "yes"
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
      #Print a list of the categories, and tell them they only show up on the list if they have an item in them.
      #Check that it's not on the list
      #Tell them it'll default to the end and they're stuck with that in this version
      #Add the new category to the table
    when desired_function.include?("category")
      puts "A category doesn't show on the usual list until an item is added to it. These are your current categories:"
      #category print
      puts "Enter a category to add or type 'done' to go back to the menu."
      input_add_category = gets.chomp.downcase
      until input_add_category == 'done'
        add_categories(input_add_category)
        #category print
        puts "Enter a category to add or type 'done' to go back to the menu"
        input_add_category = gets.chomp.downcase
      end
    else
      puts "I'm sorry. Type 'add item', 'update quantity' or 'add category'. If you'd like to continue to the next step, type 'done'"
      desired_function = gets.chomp.downcase
  end
end


#print a physical list for those kinds of people who walk into a bookstore and wax poetic about 'holding a book and turning the pages':

puts "Save your file so you can print it and access it later:"
#Something to get a filename?
write_to_file(pretty_list)


#text a copy to those who are more practical, forgetful, or eco-conscious:
puts "Text a copy of this list to yourself or some unsuspecting victim:"
#This would ask the user for their phone number if I didn't have a trial version of this API
send_text_message(pretty_list)

puts "Happy shopping!"

