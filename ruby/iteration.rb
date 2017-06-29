
## RELEASE 0
# if needed for reference
#
# def mexican_food
#   mexican_food_1 = "Tacos"
#   mexican_food_2 = "Quesadillas"
#   puts "I love Mexican food!"
#   yield(mexican_food_1, mexican_food_2)
#   puts "Why are you not working?"
# end

#  mexican_food { |mexican_food_1, mexican_food_2| puts "#{mexican_food_1} and #{mexican_food_2} are both great options!" }

#RELEASE 1
#Declare a hash and an array:
 mexican_foods_array = ["tacos", "quesadillas", "burritos", "tortilla chips"]

fast_food_joints = {
 "mcdonalds" => "burgers",
 "taco_bell" => "mexican",
 "kfc" => "fried_chicken",
 "chipotle" => "mexican"
}

#Check the value of the array before and after running .each
 p mexican_foods_array
 mexican_foods_array.each  do |food_type|
   p "#{food_type} are great!"
 end
 p mexican_foods_array

#Check the value of the array during and after running .map!:
 mexican_foods_array.map! do |food_type|
   p "#{food_type} are great!"
 end
 p mexican_foods_array

#Check the value of the hash before and after running .each:
p fast_food_joints
fast_food_joints.each do |restaurant_name, cuisine|
puts "#{restaurant_name} serves #{cuisine}."
end
p fast_food_joints

#Check the value of the hash during and after running .map:
fast_food_joints.map do |restaurant_name, cuisine|
puts "#{restaurant_name} serves #{cuisine}."
end
p fast_food_joints



##RELEASE 2
#Declare an array and a hash:
birthday_party_supplies = ["balloons", "streamers", "cake", "sprinkles", "lots of presents", "guests", "bumpin tunes"]

drinks = {
  coke: "soda",
  martini: "cocktail",
  water: "hydration",
  coffee: "code",
  redbull: "wings",
  tea: "necessity to life",
  matcha: "heaven"
}



 # Using delete_if to get rid of values in the array that don't meet the condition
 birthday_party_supplies.delete_if { |supply| supply.length < 5}
   puts birthday_party_supplies
   puts birthday_party_supplies.length

## Using delete_if to get rid of values in the hash that don't meet the condition
 drinks.delete_if { |beverage, type| type.length < 5}
   puts drinks
   puts drinks.length

## Keeps only items in the array that meet the condition:
 birthday_party_supplies.keep_if { |supply| supply.length > 8}
  puts birthday_party_supplies
  puts birthday_party_supplies.length

##Keeps items in the hash only if they meet the condition:
 drinks.keep_if { |beverage, type| type.length > 7}
   puts drinks
  puts drinks.length


## Filter out any items in the array that don't meet a certain condition:
birthday_party_supplies.reject! { |supply| supply.length < 12}
  puts birthday_party_supplies
  puts birthday_party_supplies.length


## Filter out any items in the hash that don't meet a certain condition:
drinks.reject! { |beverage, type| type.length < 9}
  puts drinks
  puts drinks.length


##Remove items from array until the condition in the block becomes false:
birthday_party_supplies.select! { |supply| supply.length >= 16}
puts birthday_party_supplies
puts birthday_party_supplies.length


##Remove items from a hash until the condition in the block becomes false:
drinks.select! { |beverage, type| type.length > 9}
  puts drinks
  puts drinks.length