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
#buddy.fetch("ball")
#buddy.speak(3)
#buddy.roll_over
#puts buddy.dog_years(5)
#buddy.play_dead
#sam = Kitty.new
#sam.speak(3)
#puts sam.cat_years(5)

kitties = {}
50.times do |x|
  kitties[x] = Kitty.new { puts "New cat" }
end

kitties.each do |key, value|
  puts key + 1
  value.speak(1)
  puts value.cat_years(1)
end
