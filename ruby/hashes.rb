#Declarations
new_client = {}

def key_maker(hash, key, value)
  case
  when value.include?("yes")
    value = true
  when value.include?("no")
    value = false
  when value.to_i > 0
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

puts "Does the client realize their taste is horrible?"
input = gets.chomp
key_maker(new_client, "Taste is horrible", input)

puts "Does the client seem to realize that ombre is just an obnoxiously fancy word for 'dip-dying'?"
input = gets.chomp
key_maker(new_client, "Realize ombre sounds pretentious", input)

#Print the data to the screen when questions are finished:

new_client.each do |question, response|
  puts "#{question.to_s.capitalize}: #{response}"
end

#Give prompt to update key:
puts "Do you need to make a change?"
input = gets.chomp

#If no updates, enters none and skips to end
  #-Take in key name and changed value, then
  #run the key_maker method
if input == "no" || input == "done"
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



