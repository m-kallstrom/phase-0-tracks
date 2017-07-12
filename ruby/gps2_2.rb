# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps:
  # separate string into array using spaces
  # initialize empty hash
  # pass each index of the array as key into the hash
  # set default quantity as value
  # print the list to the console [can you use one of your other methods here?]
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

our_list = initial_list("apples oranges carrots stuff")


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

add_new_items(our_list, "lemonade", 2)
add_new_items(our_list, "tomatoes", 3)
add_new_items(our_list, "onions")
add_new_items(our_list, "Ice Cream", 4)
p our_list

# Method to remove an item from the list
# input: the list, the item to delete
# steps:
  #find and remove key
# output: updated hash

def delete_item(list, item)
  list.delete(item)
  list
end

delete_item(our_list, "lemonade")
p our_list


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

p update_item_quantity(our_list, "Ice Cream", 1)
p our_list

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

beautify_hash(our_list)