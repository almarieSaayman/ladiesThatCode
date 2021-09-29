function pageDoneLoading() {
	alert("Page done loading! (This is an event trigger by the browser)");
}

function clickedUserEvent(id) {
	document.getElementById(id).innerHTML = "You clicked on the 'Press me!' " + id;
}

function changedUserEvent() {
	let chosenCities = document.getElementById("cities").value;
	
	document.getElementById('chosenCity').innerHTML = chosenCities;
}

function changeTextColor() {	
	document.getElementById('mouseOver').style.color = 'red';
}

function changeTextColorBack() {	
	document.getElementById('mouseOver').style.color = 'black';
}