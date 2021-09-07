//create an array - iterate through it and display a message for each element 
function startDisplay() { 
    let fruits = ["Kiwi", "Banana", "Pineapple"];
    fruits.forEach(displayMessage);
}

function displayMessage(value, index, array) {
    console.log("value: " + value);
    console.log("index: " + index);
    console.log("array: " + array);
    alert(value + " is my number " + (index+1) + " favourite fruit out of " + array);
}