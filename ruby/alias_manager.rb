#METHOD DECLARATIONS

#Take in string of first or last name
#Declare empty variable "name" to receive changed letters
#Declare values for "vowels" and "consonants"
#Break name into an array of letters
#Analyze the letters based on whether they're vowels or consonants
  #-If vowel, move one vowel forward
  #-If consonant, move one consonant forward
  #-lol if y then do at random
  #Add each changed letter to the variable "name"
#Return the value for "name"

def alias_maker(agent_name)
  name = ""
  vowels = "aeioua"
  consonants = "bcdfghjklmnpqrstvwxzb"
  agent_name = agent_name.split('')
  agent_name.each do |letter|
    if vowels.include?(letter)
       new_index = vowels.index(letter) + 1
       letter = vowels[new_index]
    elsif letter.include?("y")
       letter = ["z", "a", "a"].sample
    elsif consonants.include?(letter)
       new_index = consonants.index(letter) + 1
       letter = consonants[new_index]
    end
    name += letter
  end
name
end


#DRIVER CODE
#Create an empty hash to receive key/value pairs as names are encrypted
#Take in a name
  #-split it into first and last
  #-pass each piece into the method
  #-capitalize then rejoin the name backwards
  #-pass in the original input as a key and the new alias as a value
#Loop until the user types 'done'

puts "Greetings, Agent!"
decryption_list = {}
done = false
until done
puts "Please enter a name for processing:"
input = gets.chomp
  if input == "done"
     done = true
  else
    new_name = input.downcase.split(' ')
    new_first = alias_maker(new_name[0])
    new_last = alias_maker(new_name[1])
    decryption_list.store(input.to_sym, new_last.capitalize + " " + new_first.capitalize)
    done = false
  end
end

#Print a list of all names entered and aliases received as key/value pairs:

decryption_list.each do |real, fake|
  p "Agent #{real}: #{fake}"
end

#For fun:
puts "This list will self-destruct in 5..."
sleep(1)
puts "4..."
sleep(1)
puts "You're wearing flame retardant clothing, right?"
sleep(1)
puts "2..."
sleep(1)
puts "1..."
sleep(1)

#p alias_maker("Felicia Torres")
#p alias_maker("James Bond")

#QUESTION #1: Am I pseudocoding properly?

#QUESTION #2:
#Which is better, the following v1 (refactored code below), v0 (the first code below that) or v2 (the 2x refactored code at the top)? What further improvements could be made?

#v1 one improved on v0 by being shorter, and I think more efficient, but I couldn't get it to change the letters of the array in place. Instead, I had to assign each changed letter into the name variable.

#v2 the current one, takes a few bits out of the method and puts them into the driver code, which streamlines the method a bit more without clogging up the driver code too much.

=begin
#This was the v1 the first refactored code:
def alias_maker(agent_name)
  spy_alias = ""
  vowels = "aeioua"
  consonants = "bcdfghjklmnpqrstvwxzb"
  name_array = agent_name.downcase.split(' ')
  name_array.reverse!
  2.times do |i|
    name = name_array[i].split('')
    name.each do |letter|
     if vowels.include?(letter)
        new_index = vowels.index(letter) + 1
        letter = vowels[new_index]
        spy_alias += letter
    elsif letter.include?("y")
       letter = ["z", "a", "a"].sample
       spy_alias += letter
    elsif consonants.include?(letter)
        new_index = consonants.index(letter) + 1
        letter = consonants[new_index]
        spy_alias += letter
    end
  end
  spy_alias += " "
 end
 spy = spy_alias.split(' ')
 spy[0].capitalize + " " + spy[1].capitalize
end

#v1 Refactored Driver code:
puts "Greetings, Agent!"
decryption_list = {}
done = false
until done
puts "Please enter a name for processing:"
input = gets.chomp
  if input == "done"
    done = true
  else
    new_alias = alias_maker(input)
    decryption_list.store(input.to_sym, new_alias)
    done = false
  end
end

#This was v0, the Original Original code:

def alias_maker(agent_name)
  vowels = ("aeiou")
  consonants = ("bcdfghjklmnpqrstvwxz")
  name_array = agent_name.downcase.split(' ')
  first_name_array = name_array[0].split('')
  first_name_array.map! do |letter|
     if vowels.include?(letter)
        new_index = vowels.index(letter) + 1
        letter = vowels[new_index]
    elsif letter.include?("y")
       letter = ["z", "a", "a"].sample
    elsif consonants.include?(letter)
        new_index = consonants.index(letter) + 1
        letter = consonants[new_index]
    end
  end
  last_name_array = name_array[1].split('')
  last_name_array.map! do |letter|
    if vowels.include?(letter)
        new_index = vowels.index(letter) + 1
        letter = vowels[new_index]
    elsif letter.include?("y")
      letter = ["z", "a", "a"].sample
    elsif consonants.include?(letter)
        new_index = consonants.index(letter) + 1
        letter = consonants[new_index]
    end
  end
  last_name = last_name_array.join('')
  first_name = first_name_array.join('')
  spy_alias = last_name.capitalize! + " " + first_name.capitalize!
end


=end
