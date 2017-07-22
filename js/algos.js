// take in an array of strings
// set a "longest string" variable to nothing
//FOR each string in the array
  //compare the first in the array with the variable
  //whichever is larger, assign it to a variable
  //continue until every string has been compared against the changing variable
//output the variable

function returnLongestString(array) {
  var longestString = "";
    for (var i = 0; i < array.length; i++)
      if (longestString.length < array[i].length) {
        longestString = array[i];
      }
  return longestString;
}

returnLongestString(["here", "there", "everywhere", "to me"]);
// => "everywhere"
returnLongestString(["How does a bastard", "orphan", "son of a whore", "And a Scotsman", "dropped in the middle", "of a forgotten spot", "in the Caribbean", "by providence impoverished",  "In squalor", "grow up to be a hero and a scholar?"])
// => "grow up to be a hero and a scholar?"


/*Add a file called algos.js to the phase-0-tracks/js folder.
In algos.js, write a function that takes an array of words or phrases and returns the longest word or phrase in the array. So if we gave your function the array of ["long phrase","longest phrase","longer phrase"], it would return "longest phrase". This is a logical reasoning challenge, so try to reason through this based on what you already know, rather than Googling the fanciest solution or looking up built-in sorting functions. Note that "some string".length will do what you expect in JS.
Add driver code that tests your function on a few arrays.

In algos.js, write a function that takes two objects and checks to see if the objects share at least one key-value pair. (You'll keep adding to this file, so we suggest grouping functions at the top and testing at the bottom of the file.) Here are some sample objects and their expected return values:

yourFunction({name: "Steven", age: 54}, {name: "Tamir", age: 54}); #  true
yourFunction({animal: "Dog", legs: 4}, {animal: "Dog", legs: 3}); #  true
These both return true because at least one key-value pair matches between the two objects.
If no pairs match (and keep in mind that the two objects may not even have any of the same keys), the function should return false. To make your life easier, don't worry about whether a property is a string ('age') or an identifier name (age). Those can be considered equivalent.
Again, try to reason through the problem using the basics you've already learned, rather than looking up slick search functions that will do the job for you. We'd rather see you write code that you actually understand!

Add some driver code that tests both outcomes of your function.


Write a function that takes an integer for length, and builds and returns an array of strings of the given length. So if we ran your function with an argument of 3, we would get an array of 3 random words back (the words don't have to be actual sensical English words -- "nnnnfph" totally counts). The words should be of randomly varying length, with a minimum of 1 letter and a maximum of 10 letters. (This involves a new trick, generating a random number, that you'll have to look up, but the solution on how to do so is relatively straightforward.)
Add driver code that does the following 10 times: generates an array, prints the array, feeds the array to your "longest word" function, and prints the result.
*/