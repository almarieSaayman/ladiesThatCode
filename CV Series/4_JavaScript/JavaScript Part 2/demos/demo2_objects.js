//create a book object - use it to populate a paragraph on a webpage

function showDetails() {
    let book = {
        title : "A book about me",
        pages : 350, 
        isPublished : true, 
        datePublished : new Date("2021-08-02")  
    };

    document.getElementById("details").innerHTML = 
        "Title: " + book.title + ", " +
        "Number of pages: " + book.pages + ", " +
        "Date published: " + book.datePublished.toDateString();
}