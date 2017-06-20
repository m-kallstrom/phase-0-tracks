puts "What is the hamster's name:"
hamster_name = gets.chomp
puts "What is the hamster's squeak volume (please use 1-10):"
volume = gets.chomp.to_i
puts "What is the hamster's fur color:"
fur_color = gets.chomp
puts "Is the hamster a good candidate for adoption (y/n):"
good_for_adoption = gets.chomp
  if good_for_adoption == "y"
    good_for_adoption = true
  else
    good_for_adoption = false
  end
puts "What is the hamster's estimated age:"
age = gets.chomp
  if age == ""
    age = nil
  else
    age = age.to_i
  end
puts "Hamster name: #{hamster_name}."
puts "Squeak volume: #{volume}."
puts "Fur color: #{fur_color}."
puts "Good candidate for adoption? #{good_for_adoption}"
puts "Estimated age: #{age}"