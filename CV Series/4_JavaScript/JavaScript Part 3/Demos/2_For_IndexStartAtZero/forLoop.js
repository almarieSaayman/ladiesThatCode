let cities = ["Johannesburg", "Durban", "Pretoria", "Cape Town"];

function displayArrayBasedOnIndex() {
	let index = document.getElementById("index").value;
	
	let displayCities = "";
	for (; index < cities.length; index++) {
		displayCities += cities[index] + ", ";
	}
	
	document.getElementById("cities").innerHTML = displayCities;
}

let displayCities = "";
for (let index = 1; index <= cities.length; index++) {
	displayCities = displayCities + cities[index-1] + ", ";
	
	// Notice the <= here
}

document.getElementById("citiesStartingAtIndexOne").innerHTML = displayCities;

let displayCitiesInReverse = "";
for (let index = cities.length-1; index >= 0; index--) {
	displayCitiesInReverse = displayCitiesInReverse + cities[index] + ", ";
	
	// Notice the cities.length-1 here, because the array is 4 in length but the first index starts at 0, it means that nothing is available at index 4, so we use
	// cities.length-1 to indicate we want to start the iteration at index 3.
}

document.getElementById("citiesReverse").innerHTML = displayCitiesInReverse;
