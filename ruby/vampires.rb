puts "How many employees need to be processed today?"
number_of_employees = gets.chomp.to_i

#Employee question portion
until number_of_employees == 0
  puts "Welcome to the team! We're just going to ask you a few on-boarding questions. No need to be nervous, so just sit back and say whatever comes to mind."
  puts "What is your name?"
  name = gets.chomp
  puts "How old are you?"
  age = gets.chomp.to_i
  puts "OK, and what year were you born?"
  birth_year = gets.chomp.to_i
    if age == 2017 - birth_year
    age = true
    else
    age = false
    end
  puts "Our company serves garlic bread, but it's so popular it sells out almost immediately. Should we order some for you?"
  likes_garlic_bread = gets.chomp.downcase
    if likes_garlic_bread == "y" || likes_garlic_bread == "yes"
      likes_garlic_bread = true
    else
      likes_garlic_bread = false
    end
  puts "Would you like to enroll in the company health insurance plan?"
  wants_health_insurance = gets.chomp
  puts "Tell me your allergies one at a time, so I can add them to your health file. Say 'done' when you've exhausted the list."
    allergy = gets.chomp
    until allergy == "done"
      puts "Okay, and the next one?"
      allergy = gets.chomp
      if allergy == "sunshine" || allergy == "sunlight"
        puts "Okay and the next one?"
        sun_allergy = true
        allergy = gets.chomp
      end
  end

#Vampire Checking portion
  if name == "Drake Cula" || name == "Tu Fang"
    puts "---> Probably a vampire."
  elsif sun_allergy == true
    puts "---> Probably a vampire."
  elsif age == true && (likes_garlic_bread == true || wants_health_insurance == true)
    puts "---> Probably NOT a vampire."
  elsif age == false && (likes_garlic_bread == false || wants_health_insurance == false)
    puts "---> Probably a vampire."
  elsif age == false && (likes_garlic_bread == false && wants_health_insurance == false)
    puts "---> Almost certainly a vampire"
  else
    puts "---> Results inconclusive"
  end

# Move onto the next employee
  number_of_employees = number_of_employees - 1
end
puts "Actually, never mind! What do these questions have to do with anything? Let's all be friends."