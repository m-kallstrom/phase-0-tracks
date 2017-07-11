#METHODS

class Santa
  def initialize(gender, ethnicity)
    puts "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def speak
    puts "Ho, ho, ho! Haaaaaaaapy Holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer_name)
   #index_number = @reindeer_ranking.index(reindeer_name)
   @reindeer_ranking.index(reindeer_name) = @reindeer_ranking[-1]
  end

  def gender=(new_gender)
    @gender= new_gender
  end

  def about
    puts "#{@gender}"
    puts "#{@ethnicity}"
    puts "prefers reindeer in the following order: #{@reindeer_ranking.shuffle}"
    puts "#{@age} years old"
  end
end


#DRIVER CODE
#Initialize a new instance of Santa and check its methods are working properly
jim = Santa.new("amorphous blob", "cinnamon roll")
jim.speak
jim.eat_milk_and_cookies("Chocolate Chip Cookie")
jim.about
jim.get_mad_at("Rudolph")
=begin

example_genders = ["agender", "transmale", "bigender", "male", "female", "transfemale", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latinx", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A", "Demi-God", "Mystical Creature (Vampire)"]

#Initialize a certain number of Santas and store them in a hash
santas = {}
5.times do |santa_id|
 santas[santa_id] = Santa.new(example_genders.sample, example_ethnicities.sample)
end

#Iterate through the santas hash and print out their id number followed by their attributes
santas.each do |id, value|
 puts "Santa #{id+1} is:"
 value.about
end
=end