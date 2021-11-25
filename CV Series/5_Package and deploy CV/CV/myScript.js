let allComments = "";

hideArticles();
document.getElementById('home').style.display = "flex";
document.getElementById('homeNavigation').style.color = "rgb(232, 53, 85)";

function navigateTo(articleId, navigationId) {
	hideArticles();
	resetNavigationStyling();
	
	document.getElementById(articleId).style.display = "flex";
	document.getElementById(navigationId).style.color = "rgb(232, 53, 85)";
}

function hideArticles() {
	let articles = document.getElementsByTagName('article');
	for(var i = 0; i < articles.length; i++) {
	  articles[i].style.display = "none";
	}
}

function resetNavigationStyling() {
	let navigations = document.getElementsByClassName('navigation');
	for(var i = 0; i < navigations.length; i++) {
	  navigations[i].style.color = "black";
	}
}

function showContact() {
	let chosenContact = document.getElementById("contactMeans").value;
	
	let displayContact;
	if(chosenContact == "number") {
		displayContact = "076 123 4567";
	} else if(chosenContact == "email") {
		displayContact = "lulu.nova@gmail.com";
	} else if(chosenContact == "handle") {
		displayContact = "@luluN";
	} else {
		displayContact = "Contact number: 076 123 4567<br/> Email address: lulu.nova@gmail.com<br/> Twitter Handle: @luluN";
	}
	
	document.getElementById("contactInformation").innerHTML = displayContact;
	
	// Notice we've got multiple else if's here
}

function contactMeAlert() {
    alert('You tryin to contact me?! Send me an email!!')
}

function showMySkills() {
    document.getElementById("aboutme").innerHTML  = "Yeah I gotz lots of skills! JavaScript. JavaScript. and umm.. more JavaScript?!";
}



// JAVASCRIPT PART 4

function attemptToPostComment() {

	let name = document.forms["commentForm"]["name"].value;
	let message = document.forms["commentForm"]["commentBox"].value;

	let shouldSubmit = isFormValid(name, message);

	if (shouldSubmit){
		let comment = name + ' - ' + message;

		allComments = allComments + '<br>' + comment;
		document.getElementById("comments").innerHTML = allComments;

		document.forms["commentForm"]["name"].value = '';
		document.forms["commentForm"]["commentBox"].value = '';
	} 
	return false;
}

function isFormValid(name, message) {
	if (name == "") {
		alert("Name must be filled out");
		return false;
	}
	
	if (message == "") {
		alert("Message must be filled out");
		return false;
	}

	return true;
	
}


  
