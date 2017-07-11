#METHODS

class Santa
  def initialize
    puts "Initializing Santa instance..."
  end
  def speak
    puts "Ho, ho, ho! Haaaaaaaapy Holidays!"
  end
  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end
end


#DRIVER CODE
#Initialize a new instance of Santa and check its methods are working properly:
jim = Santa.new
jim.speak
jim.eat_milk_and_cookies("Chocolate Chip Cookie")