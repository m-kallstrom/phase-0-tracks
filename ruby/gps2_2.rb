# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # separate string into array using spaces
  # initialize empty hash
  # pass each index of the array as key into the hash
  # set default quantity as value
  # print the list to the console
# output: hash of items and quantities

def initial_list(string_of_items)
  grocery_list = {}
  quantity = 1
  items_array = string_of_items.split(" ")
  items_array.each do |item|
    grocery_list.store(item, quantity)
  end
  grocery_list
end

#our_list = initial_list("apples oranges carrots stuff")


# Method to add an item to a list
# input: list, item name, and optional quantity
# steps:
  #input item into the hash
  #push key and value
# output: updated hash

def add_new_items(list, item_name, quantity=1)
  list[item_name] = quantity
  list
end

#add_new_items(our_list, "lemonade", 2)
#add_new_items(our_list, "tomatoes", 3)
#add_new_items(our_list, "onions")
#add_new_items(our_list, "Ice Cream", 4)

# Method to remove an item from the list
# input: the list, the item to delete
# steps:
  #find and remove key
# output: updated hash

def delete_item(list, item)
  list.delete(item)
  list
end

#delete_item(our_list, "lemonade")


# Method to update the quantity of an item
# input: the list, the item, the new quantity
# steps:
  #locate key for item
  #update value to new quantity
# output: updated hash

def update_item_quantity(list, item, quantity)
  list[item] = quantity
  list
end

#update_item_quantity(our_list, "Ice Cream", 1)

# Method to print a list and make it look pretty
# input: the hash
# steps:
  #print out each key and value with prettiness
# output: awesomeness

def beautify_hash(hash)
  hash.each do |item, quantity|
    puts "#{item.capitalize}: #{quantity}"
  end
end

#beautify_hash(our_list)

#DRIVER CODE
#Throwing on a simple UI to practice stringing the methods together

#Ask the user for an initial list of items
  #take in input as a string
#Print out a nice list
  #pass the string through the initial_string method and then into the beautify_hash method
#Ask the user if they would like to add, update, or delete
  #UNTIL they type "done" keep asking which of the three they want to do.
   #IF add
     #take in added item
     #pass into the add_new_items method and then into the beautify_hash method
   #ELSIF update
     #take in the item to be changed and the new quantity
     #pass the string into update_quantity method and into the beautify_hash method
   #ELSIF delete
     #take in the item to be deleted
     #pass the string into delete_item method and then that result into the beautify_hash method
    #ELSE invalid input of some kind
      #tell them the options again and give them another chance for valid input
    #END
  #print the result
  #BREAK UNTIL LOOP

puts "Hello! What items do you need today?"
input = gets.chomp

our_list = initial_list(input)
beautify_hash(our_list)

puts "Does this list look good?"
puts "Please enter 'add', 'update', or 'delete' to change items and quantities. Otherwise, type 'done' to exit."
input = gets.chomp

until input.downcase == "done"
  if input.downcase.include?("add")
    puts "Please enter the item you want to add. Quantity is optional:"
    input = gets.chomp.split(" ")
    updated_list = add_new_items(our_list, input[0], *input[1])

  elsif input.downcase.include?("update")
    puts "Please enter the item you want to update and the new quantity:"
    input = gets.chomp.split(" ")
    updated_list = update_item_quantity(our_list, input[0], input[1])

  elsif input.downcase.include?("delete")
    puts "Please enter the item you want to delete:"
    input = gets.chomp.split(" ")
    updated_list = delete_item(our_list, input[0])

  else
    puts "Sorry. Try that one more time."
    puts "Type 'add', 'update' or 'delete' if you want to change an item Type 'done' to exit."
    input = gets.chomp
  end

 puts "Here you go:"
 beautify_hash(updated_list)
 puts "Anything else to change? Please enter 'add', 'update' or 'delete' to fix an item, and 'done' to exit."
 input = gets.chomp
end

#idea: use a hash of hashes to create grocery store categories and sort items and their quantities into those categories

#Initial list maker method
  #take a string containing three values: category, item, and quantity (which is optional)
  #initialize empty hash
  #UNTIL the user types 'done'
    #split the string into its values
    #pass in the first item as the key
    #pass in the second (and optional third)items in as a value array
      #if there is no quantity passed in,   default to 1 (or possibly leave blank)
  #output a hash

  ###actually refactored this function to be included in the add method:

  # def grocery_list_maker(category, item, quantity=1)
  #   list = {}
  #   item_and_quantity = {}
  #   item_and_quantity.store(item, quantity)
  #   list.store(category, item_and_quantity)
  #   list
  # end


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