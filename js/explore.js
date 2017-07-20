//define new variables for a string and a new string to take in reversed letters
  //set variable i to the length of string
  //count down from i until it reaches 0
  // stuff each letter at index i into the newString variable
// print the variable to the console
var string = "hello";
var NewString = "";
for (var i = string.length; i >= 0; i-=1) {
  NewString += string[i];
}
