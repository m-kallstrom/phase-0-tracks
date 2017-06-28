#Declarations
new_client = {}


#Driver code

#Prompt designer for client information:
  #-Convert user data to proper type
  #-Assign to hash
puts "Hello there! Could you give me the client's name?"
input = gets.chomp
new_client[:name] = input

puts "What is the client's age?"
input = gets.chomp
new_client[:age] = input.to_i

puts "What is the client's address?"
input = gets.chomp
new_client[:address] = input

puts "How many children does the client have? (Pets that are treated as children should be counted.)"
input = gets.chomp
new_client[:children] = input.to_i

puts "Describe the client's preferred decor theme:"
input = gets.chomp
new_client[:decor_theme] = input

puts "Does the client realize their taste is horrible?"
input = gets.chomp
if input == "yes" || input == "y"
  input = true
else
  input = false
end
new_client[:horrible_taste] = input

puts "Does the client realize that ombre is just an obnoxiously fancy word for 'dip-dying'?"
input = gets.chomp
if input == "yes" || input == "y"
  input = true
else
  input = false
end
new_client[:ombre_pretentious] = input

#Print the data to the screen when questions are finished:
puts "Name: #{name}"
puts "Address: #{address}"
puts "Number of Children: #{children}"
puts "Preferred Decor Theme: #{decor_theme}"
puts "Realize Own Taste is Horrible: #{horrible_taste}"
puts "Realize Current Ombre Trend is Pretentious (Even If Pretty): #{ombre_pretentious}"

  #Add labels so that keys remain hidden
#Give prompt to update key:
  #If no updates, enters none and skips to end
  #-Take in key name and change to symbol
  #- Take in changed value
#Print updated version
# In phase-0-tracks/ruby/hashes.rb, pseudocode and write a program that will allow an interior designer to enter the details of a given client: the client's name, age, number of children, decor theme, and so on (you can choose your own as long as it's a good mix of string, integer, and boolean data).

# Your keys should be symbols unless you find that you need a string for some reason -- usually only when spaces or other "user friendly" formatting are needed (as in the case of using someone's full name as a hash key). Basically, symbols are simpler for programmers to use, and readable enough by technical folks to be used in place of strings most of the time.

# Your program should ...

# Prompt the designer/user for all of this information.
# Convert any user input to the appropriate data type.
# Print the hash back out to the screen when the designer has answered all of the questions.
# Give the user the opportunity to update a key (no need to loop, once is fine). After all, sometimes users make mistakes! If the designer says "none", skip it. But if the designer enters "decor_theme" (for example), your program should ask for a new value and update the :decor_theme key. (Hint: Strings have methods that will turn them into symbols, which would be quite handy here.) You can assume the user will correctly input a key that exists in your hash -- no need to handle user errors.
# Print the latest version of the hash, and exit the program.
# Be sure to pseudocode, and leave your pseudocode in as comments.