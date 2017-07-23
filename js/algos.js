//METHOD DECLARATIONS

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


//Take in two objects (but they're not hashes? what?) as arguments
  //FOR each object in the first...object. Um.
    //compare the first key of parameter 1 to each key of parameter 2
      //IF there is a match,
        //compare the values
          //IF those values match
            //return true
      // ELSE keep looking through until it has checked all parameters of object 1 against all parameters against object 2
        //in which case, it returns false
function keyValueMatchMaker(object1, object2) {
  var match = false;
  for (var key in object1) {
     if (Object.is(object1[key], object2[key])) {
       match = true
    console.log(key + ': ' + object1[key]);
    }
  }
return match
}

// ACTUAL WORD ARRAY GENERATOR
  //take in an integer
  //make a string of a random text
  //make an empty array for taking in words
  //FOR the number of times of that integer
    //run a random number generator
    //stuff the word at that index into the array
  //return the array of random words
function randomNumberGenerator(number) {
  var newNumber = Math.floor(Math.random() * number);
  return newNumber;
}

function contentArrayGenerator(required_length, exampleArray) {
  var contentArray = [];
  for (var i = 0; i < required_length; i++) {
    contentArray.push (exampleArray[randomNumberGenerator(exampleArray.length)]);
  }
  return contentArray;
}


//GIBBERISH WORD GENERATOR
  //take in an integer for array length
  //make an empty array
  //FOR the number of times of that integer
    //run the gibberish word maker function
      //which makes an empty variable for the word and an alphabet string
      // it then runs a random number generator to decide the number of letters to add to the string
      //FOR that number of times
        //it shoves the letter at a randomly chosen index into the string
    //the word maker returns the gibberish word
    //the gibberish Generator then takes that word and stuffs it into the array
  // return the array of gibberish words
function gibberishGenerator(required_length) {
  var contentArray = [];
  for (var i = 0; i < required_length; i++) {
    contentArray.push(gibberishWordMaker());
  }
  return contentArray;
}

function gibberishWordMaker() {
  var numberOfLetters = randomNumberGenerator(10);
  var gibberishWord = "";
  var alphabet = "abcdefghijklmnopqrstuvwxyz";
  for (var i = 0; i < numberOfLetters; i++) {
    gibberishWord += alphabet[randomNumberGenerator(26)];
  }
  return gibberishWord;
}


//DRIVER CODE

//test function to return longest string in an array
returnLongestString(["here", "there", "everywhere"]);
// => "everywhere"
returnLongestString(["long phrase","longest phrase","longer phrase"])
// => "longest phrase"
returnLongestString(["How does a bastard", "orphan", "son of a whore", "And a Scotsman", "dropped in the middle", "of a forgotten spot", "in the Caribbean", "by providence impoverished",  "In squalor", "grow up to be a hero and a scholar?"])
// => "grow up to be a hero and a scholar?"


//test function that examines arrays and returns true if they share at least one key/value pair
keyValueMatchMaker({name: "Steven", age: 54}, {name: "Tamir", age: 54});
// => true
keyValueMatchMaker({animal: "Dog", legs: 4}, {animal: "Dog", legs: 3});
// => true
keyValueMatchMaker({animal: "Dog", legs: 4}, {name: "Tamir", age: 54});
// => false


// test Actual Word Generator, which returns an array of random words from the following text:
var text = "Fourscore and seven years ago our fathers brought forth on this continent a new nation conceived in liberty and dedicated to the proposition that all men are created equal. Now we are engaged in a great civil war testing whether that nation or any nation so conceived and so dedicated can long endure We are met on a great battlefield of that war";
var GettysburgAddress = text.split(" ");
console.log(contentArrayGenerator(10, GettysburgAddress));
// =>[ 'Fourscore', 'forth', 'on', 'nation', 'are', 'brought', 'or', 'battlefield', 'and', 'on' ]

//test Gibberish Word Generator, which returns an array of gibberish words of 1-10 characters in length
console.log(gibberishGenerator(7));
// => [ 'gehehkbnf', 'arnoe', 'wrmeps', 'ahcasmbja', 'rl', 'dcdauhttw', 'qvwpsi' ]




//Add driver code that does the following 10 times: generates an array, prints the array, feeds the array to your "longest word" function, and prints the result.
