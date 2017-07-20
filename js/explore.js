//define new variables for a string and a new string to take in reversed letters
  //set variable i to the length of string minus one
  //count down from i until it reaches 0
  // stuff each letter at index i into the newString variable
// print the variable to the console


//METHOD

var string = "hello"
function reverseString(string) {
  var newString = ' ';
  for (var i = string.length -1; i >= 0; i-=1) {
    newString += (string[i]);
  }
  console.log(newString);
}


var reverseStringFunctionWorks = true;
var missesRuby = true;

// DRIVER CODE

//declare some true variables
//IF both conditions are true, print the reverse string
  // ELSE IF print a different reverse string
  // ELSE cry


if (reverseStringFunctionWorks && missesRuby) {
  reverseString("Baby, come back! You can blame it all on me!");
} else if (reverseStringFunctionWorks && !missesRuby) {
  reverseString("Imma make some sweet JavaScript games!");
} else {
  console.log("*cries*");
}


//In phase-0-tracks/js, create a file called explore.js.
//Ruby has lots of handy functions like .reverse, but in JavaScript, we mostly have to write our own. In comments, pseudocode a function that takes a string as a parameter and reverses the string. reverse("hello"), for example, should return "olleh". This isn't a task specific to JavaScript -- your pseudocode should be in plain English and use phrases like "for each" instead of JavaScript-specific terms. Remember that you can add strings in JavaScript, so '' + 'a' would result in the string 'a'. Take your time. This is the most valuable skill in programming: being able to think through a problem logically.
//Under your commented pseudocode, implement your function in JavaScript. Test it with driver code if you like. Anytime you'd like to run your code, you can run node explore.js from the js folder in your terminal, similar to how you run Ruby programs.
//Add driver code that calls the function in order to reverse a string of your choice (as long as it's not a palindrome!), and stores the result of the function in a variable.
//Add driver code that prints the variable if some condition is true. The condition can be a silly one, like 1 == 1.