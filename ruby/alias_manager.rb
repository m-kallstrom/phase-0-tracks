#METHOD

#Take in string of first and last name
#Split string into an array of two values using the space as a divider
#Take each individual value and break it into an array of letters
#Analyze the letters based on whether they're vowels or consonants
  #-If vowel, move one vowel forward
  #-If consonant, move one consonant forward
  #-LOL if y then do at random
#Put the letters back together
#Put the first and last name back together in the opposite order they started in.

def alias_maker(agent_name)
  spy_alias = ""
  vowels = "aeiou"
  consonants = "bcdfghjklmnpqrstvwxz"
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

#p alias_maker("Felicia Torres")
#p alias_maker("James Bond")

#DRIVER CODE
#Ask the user for a name and return an alias
#Loop until the user types done
puts "Greetings, Agent!"
done = false
until done
puts "Please enter a name for processing:"
input = gets.chomp
  if input == "done"
    done = true
  else
    puts alias_maker(input)
    done = false
  end
end


=begin
#Refactored this code:
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

p alias_maker("Felicya Torrys")
=end
