#METHODS

class Puppy

  def initialize
    puts "Initializing new puppy instance..."
  end

  def speak(number)
    number.times {puts "Woof!"}
  end

  def roll_over
    puts "*rolls over*"
  end

  def dog_years(human_years)
    human_years * 7
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def play_dead
    puts "Oh, no! I am ded."
    sleep 5
    puts "No, I'm not. Give me a biscuit!"
  end
end

class Kitty

  def initialize(&block)
    yield
  end

  def speak(number)
    number.times {puts "Meow!"}
  end

  def cat_years(human_years)
    human_years * 6
  end

end

#DRIVER CODE

#buddy = Puppy.new
#=>Initializing new puppy instance...

#buddy.fetch("ball")
#=> I brought back the ball

#buddy.speak(3)
#=> Woof! Woof! Woof!

#buddy.roll_over
#=> *rolls over*

#puts buddy.dog_years(5)
#=> 35

#buddy.play_dead
#=> Oh no! I am ded.
#=> *waits five seconds*
#=> No, I'm not. Give me a biscuit!

#sam = Kitty.new
#=Initializing new kitty instance...

#sam.speak(3)
#=> Meow! Meow! Meow!

#puts sam.cat_years(5)
#=> 30

#Makes 50 new cats
# (Please spay or neuter your pet!)
#Updated to pass in a block when initializing
kitties = {}
50.times do |x|
  kitties[x] = Kitty.new { puts "New cat" }
end

#Each of the 50 new cats will meow and tell you how old it is in human years
kitties.each do |key, value|
  puts key + 1
  value.speak(1)
  puts value.cat_years(1)
end
