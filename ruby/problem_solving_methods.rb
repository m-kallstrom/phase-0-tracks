
#SEARCH ARRAY
#Iterate through the array
  #Check to see if the current iterations matches the integer parameter to search for

  #If there is a match, print the index value of it's location in the array
  #Otherwise, return nil

array = [42, 89, 23, 1]

def search_array(array, num)
  i = 0
  match = nil
  array.each do | index |
    if index == num
      match = i
    else
     i += 1
    end
  end
  p match
end

search_array(array, 1)
search_array(array, 22)

#FIBONACCI
#Create fib array
#Set up count/loop
  #Each time, take the sum of the previous two values
  #Put that number into fib array

fib_array = [0, 1]

def fib(number_of_times)
  index = 2
  fib_array = [0, 1]
  while index < number_of_times
    fib_array << fib_array[index - 1] + fib_array[index - 2]
    index += 1
  end
 fib_array

end

p fib(6)
p fib(9)
p fib(100)

# TEST IF fib(100) HAS THE CORRECT VALUE
  #Go through each value in  fib_array
  #Check if that number = the correct number

fib(100).each do | number |
  if number == 218922995834555169026
    p "YAY OUR SEQUENCE WORKS!"
  else
    p "I am sad! :("
  end
end








