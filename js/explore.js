
//METHOD
//define new variable for a new string to take in reversed letters
  //set variable i to the length of string minus one
  //count down from i until it reaches 0
  // stuff each letter at index i into the newString variable
// print the variable to the console


function reverseString(string) {
  var newString = ' ';
  for (var i = string.length -1; i >= 0; i-=1) {
    newString += (string[i]);
  }
  return newString;
}

//reverseString("hello")

var reverseStringFunctionWorks = true;
var missesRuby = true;
var ruby = reverseString("Baby, come back! You can blame it all on me!");
var javaScript = reverseString("Imma make some sweet JavaScript games!");

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
