//METHOD DECLARATIONS

// take in an array of strings
// set a "longest string" variable to nothing
// FOR each string in the array
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


//Take in two objects as arguments
  //FOR each object in the first...um, object.
    //compare the first key of parameter 1 to each key of parameter 2
      //IF there is a match,
        //compare the values
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
return match;
}


// ACTUAL WORD ARRAY GENERATOR
  //take in an integer and a string of a random text
  //make an empty array for taking in words
  //FOR the number of times of that integer
    //generate a random number that is less than or equal to the length of the example array
    //stuff the word at that index into the array
  //return the array of random words
function contentArrayGenerator(requiredLength, exampleArray) {
  var contentArray = [];

  for (var i = 0; i < requiredLength; i++) {
    var maxLength = exampleArray.length
    var index = Math.floor(Math.random() * maxLength)
    contentArray.push (exampleArray[index]);
  }
  return contentArray;
}


//GIBBERISH WORD GENERATOR
  //take in an integer for array length
  //make an empty array
  //FOR the number of times of that integer
    //run the gibberish word maker function
      //which makes an empty variable for the word and an alphabet string
      // it then runs a random number generator to decide the number of letters to add to the string (between 1 and 10)
      //FOR that number of times
        //it shoves the letter at a randomly chosen index into the string
    //the word maker returns the gibberish word
    //the gibberish Generator then takes that word and stuffs it into the array
  // return the array of gibberish words
function gibberishGenerator(requiredLength) {
  var contentArray = [];

  for (var i = 0; i < requiredLength; i++) {
    contentArray.push(gibberishWordMaker());
  }
  return contentArray;
}


function gibberishWordMaker() {
  var numberOfLetters = Math.ceil(Math.random() * 10);
  var gibberishWord = "";
  var alphabet = "abcdefghijklmnopqrstuvwxyz";

  for (var i = 0; i < numberOfLetters; i++) {
    gibberishWord += alphabet[Math.floor(Math.random() * 26)];
  }
  return gibberishWord;
}

// QUESTION:
  // When refactoring, I took out a function that would generate a random number. I found the code was actually more readable without it. When making a decision like this, is it best to go with shorter and readable code? Or is having that extra function going to be faster and make the code more concise since similar code isn't repeated?


//DRIVER CODE

//test function to return longest string in an array
returnLongestString(["here", "there", "everywhere"]);
// => "everywhere"
returnLongestString(["long phrase","longest phrase","longer phrase"]);
// => "longest phrase"
returnLongestString(["How does a bastard", "orphan", "son of a whore", "And a Scotsman", "dropped in the middle", "of a forgotten spot", "in the Caribbean", "by providence impoverished",  "In squalor", "grow up to be a hero and a scholar?"]);
// => "grow up to be a hero and a scholar?"


//test function that examines arrays and returns true if they share at least one key/value pair
keyValueMatchMaker({name: "Steven", age: 54}, {name: "Tamir", age: 54});
// => true
keyValueMatchMaker({animal: "Dog", legs: 4}, {animal: "Dog", legs: 3});
// => true
keyValueMatchMaker({animal: "Dog", legs: 4}, {name: "Tamir", age: 54});
// => false


// test Actual Word Generator, which returns an array of random words from the following text:
var text = "Fourscore and seven years ago our fathers brought forth on this continent a new nation conceived in liberty and dedicated to the proposition that all men are created equal Now we are engaged in a great civil war testing whether that nation or any nation so conceived and so dedicated can long endure We are met on a great battlefield of that war";
var GettysburgAddress = text.split(" ");
console.log(contentArrayGenerator(10, GettysburgAddress));
// =>[ 'Fourscore', 'forth', 'on', 'nation', 'are', 'brought', 'or', 'battlefield', 'and', 'on' ]

//test Gibberish Word Generator, which returns an array of gibberish words of 1-10 characters in length
console.log(gibberishGenerator(7));
// => [ 'gehehkbnf', 'arnoe', 'wrmeps', 'ahcasmbja', 'rl', 'dcdauhttw', 'qvwpsi' ]


//test that both random content generator fuctions can be called within the parameters of the longest string finder function
for (var i = 0; i < 5; i++) {
  var currentNonsense = gibberishGenerator(7);
  console.log('The current array being used is: ' + currentNonsense);
  console.log('The longest string in this array is: ' + returnLongestString(currentNonsense));
}
// => The current array being used is: yjjmhxu,jd,gbijjlfsj,wxbxs,iveh,qvl,hsxihitpvu
//The longest string in this array is: hsxihitpvu

//The current array being used is: dxwfrnt,rluczzrd,xdbihjro,sbyrkc,wjcsbba,aolku,mm
//The longest string in this array is: rluczzrd

//The current array being used is: ptl,epuu,ksn,shc,o,q,odycufmk
//The longest string in this array is: odycufmk

//The current array being used is: rqofn,eumr,bflg,aauclko,ml,zvw,jewd
//The longest string in this array is: aauclko

//The current array being used is: flpdypdk,dwt,oz,tnaafzn,azv,kwqzm,vrun
//The longest string in this array is: flpdypdk


for (var i = 0; i < 5; i++) {
  var currentArray = contentArrayGenerator(7, GettysburgAddress);
  console.log('Hear, ye! The current array in use is: ' + currentArray);
  console.log('I do declare the longest string in this array is: ' + returnLongestString(currentArray));
}
//=>Hear, ye! The current array in use is:    fathers,can,nation,brought,that,Fourscore,We
//I do declare the longest string in this array is: Fourscore

//Hear, ye! The current array in use is: seven,a,equal,Now,that,great,We
//I do declare the longest string in this array is: seven

//Hear, ye! The current array in use is: are,nation,war,liberty,any,in,in
//I do declare the longest string in this array is: liberty

//Hear, ye! The current array in use is: war,we,whether,long,men,engaged,long
//I do declare the longest string in this array is: whether

//Hear, ye! The current array in use is: new,in,on,our,forth,are,this
//I do declare the longest string in this array is: forth
