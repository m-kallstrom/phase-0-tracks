
console.log("Whoo! The script is running!");

function hideImage() {

  var bookimg = document.getElementById("bookimg");

  if (bookimg.style.visibility === "hidden") {
    bookimg.style.visibility = "visible";
  } else {
    bookimg.style.visibility = "hidden";
  }
}

var img = document.getElementById("myBtn");
img.addEventListener("click", hideImage);