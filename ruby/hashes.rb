#Declarations
new_client = {}

#Method to make key/value pairs and to sort values into boolean, integer and string input. Also handles addresses, which would otherwise come out as integers, and 0 input for children/pets which would otherwise come out as a string.

def key_maker(hash, key, value)
  case
  when value.include?("true")
    value = true
  when value.include?("false")
    value = false
  when value.to_i > 0 && value.length < 4
    value = value.to_i
  when value == "0"
    value = value.to_i
  else
    value
  end
  hash.store(key.to_sym, value)
end

#Driver code

#Prompt the designer for client information:
 ## Get input and run it through method

puts "Hello there! Could you give me the client's name?"
input = gets.chomp
key_maker(new_client, "name", input)

puts "What is the client's age?"
input = gets.chomp
key_maker(new_client, "age", input)

puts "What is the client's address?"
input = gets.chomp
key_maker(new_client, "address", input)

puts "How many children does the client have? (Pets that are treated as children should be counted.)"
input = gets.chomp
key_maker(new_client, "children", input)

puts "Describe the client's preferred decor theme:"
input = gets.chomp
key_maker(new_client, "decor", input)

puts "True or False: the client realizes their taste is horrible."
input = gets.chomp
input = input.downcase
key_maker(new_client, "Taste is horrible", input)

puts "True or False: the client seems to understand that ombre is just an obnoxiously fancy word for 'dip-dying'."
input = gets.chomp
input = input.downcase
key_maker(new_client, "Realize ombre sounds pretentious", input)

#Print the data to the screen when questions are finished:

new_client.each do |question, response|
  puts "#{question.to_s.capitalize}: #{response}"
end

#Give prompt to update key:
puts "Do you need to make a change?"
input = gets.chomp

#If no updates, enters none/no and skips to end
if input == "no" || input == "done"
  puts "Thank you for getting us a new client! Do not show them this form."

  #Otherwise:
  #-Take in key name and changed value, then run the key_maker method
else
  puts "Which category do you need to change?"
  category = gets.chomp
  puts "What should the answer be?"
  input = gets.chomp
  key_maker(new_client, category, input)
end

#Print updated version

new_client.each do |question, response|
  puts "#{question.to_s.capitalize}: #{response}"
end



