  puts "How many employees need to be processed today?"
  number_of_employees = gets.chomp.to_i

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
  #Maybe this should be a case where you can add in several affirmatives. Yes, yeah, yep, hell yeah, etc.
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
      if allergy == "sunshine"
        puts "Okay and the next one?"
        allergy = gets.chomp
        vampire = true
      end
  end
  number_of_employees = number_of_employees - 1
end

# Need to change something to case
#possibly the counter decreaser needs to go elsewhere
#Or possibly the allergy checker needs to go into teh questions at the end. Potentially fixed allergy checker.

  if age == true && (likes_garlic_bread == true || wants_health_insurance == true)
    puts "Probably not a vampire."
  elsif age == false && (likes_garlic_bread == false || wants_health_insurance == false)
    puts "Probably a vampire."
  elsif age == false && (likes_garlic_bread == false && wants_health_insurance == false)
    puts "Almost certainly a vampire"
  elsif name == "Drake Cula" || name == "Tu Fang"
    puts "Definitely a vampire!"
  elsif vampire == true
    puts "Probably a vampire"
  else
    puts "Results inconclusive"
  end
