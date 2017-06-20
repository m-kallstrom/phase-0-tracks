puts "What is the hamster's name:"
hamster_name = gets.chomp
puts "What is the hamster's squeak volume (please use 1-10):"
volume = gets.chomp.to_i
  until volume >= 1 && volume <= 10
    if volume > 10
      puts "It can't possibly be THAT loud!"
      volume = gets.chomp.to_i
    elsif volume <= 0
      puts "No way it's that quiet. Use a number between 1 and 10."
      volume = gets.chomp.to_i
    end
  end
puts "What is the hamster's fur color:"
fur_color = gets.chomp
puts "Is the hamster a good candidate for adoption (y/n):"
good_for_adoption = gets.chomp
  if good_for_adoption == "y"
    good_for_adoption = true
  elsif good_for_adoption == "n"
    good_for_adoption = false
  else
    puts "Hey, I said y/n!! Like, lowercase letters, man."
    good_for_adoption = gets.chomp
  end
puts "What is the hamster's estimated age:"
age = gets.chomp
  if age == ""
    age = nil
  else
    age = age.to_i
  end
puts "Hamster name: #{hamster_name}"
puts "Squeak volume: #{volume}"
puts "Fur color: #{fur_color}"
puts "Good candidate for adoption? #{good_for_adoption}"
if age == nil
  puts "Estimated age: Unknown"
else
  puts "Estimated age: #{age}"
end