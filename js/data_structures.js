
// Release 0
// create arrays of colors and names for some horses
var colors = ["green", "chestnut", "piebald", "purple"];
var names = ["Green Beauty", "Mr. Ed", "Sandwich", "Karl"];

//push new content into the arrays
function addColor(color, array) {
  array.push(color);
  return array;
}

console.log(addColor("chartreuse", colors));

function addName(name, array) {
  array.push(name);
  return array;
}

console.log(addName("Lenny", names));

// Commenting this out because it does not work. Overwrites the
// keys in the object rather than adding to the object.

// names.forEach(function(element, index) {
//   horseObject = {};
//   horseObject[element] = colors[index];
//   return horseObject;
// });

// console.log(horseObject);

// Release 1

//function takes in an empty object, then an array of names and of colors
  //in index order, takes each name and color and inserts it into the object as a key/value pair
  //outputs the updated object
addColor("super sparkle", colors); //checking how spaces work in values
addName("Harry Caray", names);    //checking how spaces work in keys

function makeObject(object, array1, array2) {
  for(i = 0; i < array1.length; i++) {
    object[array1[i]] = array2[i];
  }
  return object;
}
horseObject = {}
console.log(makeObject(horseObject, names, colors));


// Release 2
// Write a constructor function for a car with a handful of
// properties. One of the properties needs to be a function.

function Car(make, model, year) {
  this.make = make;
  this.model = model;
  this.year = year;
  this.honk = function() {console.log("Horn horn HORN")};
}

//print out some objects made from the prototype
var ford = new Car("Ford", "Model T", 1917);
console.log("The next car in line is a " + ford.make + " " + ford.model + " from " + ford.year + ".");
console.log("This " + ford.model + " can honk:");
ford.honk();
console.log("----");

var chevy = new Car("Chevrolet", "Impala", 1967);
console.log("And the second car is a " + chevy.make + " " + chevy.model + " from " + chevy.year + ".");
console.log("This " + chevy.model + " can also honk:");
chevy.honk();
console.log("----");

var crashedCar = new Car("Hyundai", "Elantra", 2005);
console.log("This " + crashedCar.make + " " + crashedCar.model + " no longer does anything good. It has hit a wall.");
crashedCar.brokenHorn = function() {console.log("Hrrrrrrn")};
console.log("This " + crashedCar.model + " can't even make a noise:");
crashedCar.brokenHorn();
console.log("----");

// Release 3
// Simple experimentation with looping thru an object:
console.log(chevy);
console.log(Object.keys(chevy).length);
for (n = 0; n < Object.keys(chevy).length; n++) {
  console.log(Object.keys(chevy)[n]);
  console.log(Object.values(chevy)[n]);
}

console.log(Object.entries(ford));
console.log(Object.entries(ford)[1][1]);
console.log(Object.entries(chevy)[1]);
console.log(Object.is(Object.entries(ford)[1][0], Object.entries(chevy)[1][0])); // This would have made 7.3 a lot easier...

//Are there advantages to using constructor functions to create objects? Disadvantages?
//
//Some research says:
//It depends on what you want to do. If you want to use (semi-)private variables or functions in your object, a constructor function is the way to do it. If your object only contains properties and methods, an object literal is fine.

//A different article broke it down like this:

//Advantages: Most books teach you to use class or constructors. Also, `this` refers to the new object.
//Drawbacks:  Required `new`. (Problems if you forget it and don't notice.) Instanceof? is deceptive.

//They recommended factories because:
//1. Return any arbitrary object and use any arbitrary prototype
//2.No refactoring worries
//3. No `new`
//4. Standard `this` behavior
//5. No deceptive `instanceof`

//The only drawback listed was slightly slower speeds on micro-optimization tests