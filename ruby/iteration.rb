
def mexican_food
  mexican_food_1 = "Tacos"
  mexican_food_2 = "Quesadillas"
  puts "I love Mexican food!"
  yield(mexican_food_1, mexican_food_2)
  puts "Why are you not working?"
end

 mexican_food { |mexican_food_1, mexican_food_2| puts "#{mexican_food_1} and #{mexican_food_2} are both great options!" }

