
#SEARCH ARRAY
#Iterate through the array
  #Check to see if the current iteration matches the integer parameter to search for
    #If there is a match, print the index value of its location in the array
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

#BUBBLE SORT!

#Loop through array

  #Identify if current element is greater than previous element
    #If true, swap those two elements
    #Otherwise move on to the next set and perform same if logic

def bubble_sort(array)
  n = array.length
  loop do
    swapped = false

    (n-1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
        p array
      end

    end
    break if not swapped
  end

end

puts array1 = [12, 41, 2, 5, 8, 12, 5768, 123, 5, 7567, ]
puts bubble_sort(array1)








