#METHODS


#declare a Santa class
class Santa

  #give its variables read and/or write access
  attr_reader :ethnicity, :age
  attr_accessor :gender, :reindeer_ranking

  #initialize with a message and declare some variables
  def initialize(gender, ethnicity)
    puts "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = rand(140)
  end

  #returns an inclusive holiday greeting
  def speak
    puts "Ho, ho, ho! Haaaaaaaappy Holidays!"
  end

  #returns a message about eating cookies.
  #(I assume they're being dunked into the milk and then eaten cause you don't eat milk.)
  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  #increase the age variable
  def celebrate_birthday
    @age += 1
  end

  #take a random reindeer name and move it to the last position in the array
  def get_mad_at(reindeer_name)
   @reindeer_ranking.insert(-1, @reindeer_ranking.delete_at(@reindeer_ranking.index(reindeer_name)))
  end
end


#DRIVER CODE
#initialize a new instance of Santa and check its methods are working properly

=begin
jim = Santa.new("amorphous blob", "cinnamon roll")
jim.speak
jim.eat_milk_and_cookies("Chocolate Chip Cookie")
p jim.gender
p jim.get_mad_at("Rudolph")
p jim.ethnicity
p jim.age
jim.celebrate_birthday
p jim.age
gender = "man-bun"
p jim.gender
=end

#declare some arrays of information to be passed into the class methods randomly
example_genders = ["agender", "transmale", "bigender", "male", "female", "transfemale", "gender fluid", "N/A", "don't feel like filling in this form", "three owls in a trenchcoat", "man-bun"]
example_ethnicities = ["black", "Latinx", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A", "Demi-God", "Mystical Creature (Vampire)", "that gif of Spongebob impersonating a chicken"]
example_cookies = ["Snickerdoodle", "Chocolate Chip Cookie", "Sugar Cookie", "Bone-Shaped Dog Biscuit", "Peanut-Butter Cookie", "Fortune Cookie", "Web Browser Cookie", "Ginger Snap", "Almond-Flavored Windmill-Shaped Cookie the Name of Which I've Forgotten", "Thin Mint", "Samoa", "....wait, no. This isn't a cookie. It's some sort of healthy fruit bar. Have you no shame?"]

#initialize a plethora of Santas and print out their stats
500.times do |number|
 new_santa = Santa.new(example_genders.sample, example_ethnicities.sample)
 puts "Santa ID: #{number+1}"
 new_santa.speak
 puts "Age: #{new_santa.age}"
 puts "Gender: #{new_santa.gender}"
 puts "Ethnicity: #{new_santa.ethnicity}"
 puts "Reindeer Ranking: #{new_santa.reindeer_ranking.shuffle!}"
 puts "Hold on. Someone's been naughty."
 new_santa.get_mad_at(new_santa.reindeer_ranking.sample)
 puts "Updated ranking: #{new_santa.reindeer_ranking}"
 puts "Santa thanks you for leaving milk and cookies."
 new_santa.eat_milk_and_cookies(example_cookies.sample)
 new_santa.celebrate_birthday
 puts "And this time next year, Santa will be #{new_santa.age}!"
 puts " "
end


