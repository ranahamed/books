 function addAuthorField() {

    //When generating new sets of fields you must ensure the key of the associated array is unique -
    // the current JavaScript date (milliseconds after the epoch) is a common choice.

    //create Date object 
    var date = new Date();

    //get number of milliseconds since midnight Jan 1, 1970  
    //and use it for address key 
    var mSec = date.getTime();

    //Replace 0 with milliseconds 
    idAttributKind = 
           "book_authors_attributes_0_name".replace("0", mSec);
    nameAttributKind = 
           "book[authors_attributes][0][name]".replace("0", mSec);
           
    //create <li> tag  
    var li = document.createElement("li");           

    var labelKind = document.createElement("label");
    labelKind.setAttribute("for", idAttributKind);
    var kindLabelText = document.createTextNode("Author");
    labelKind.appendChild(kindLabelText);
    li.appendChild(labelKind);
               
    //create input for Kind, set it's type, id and name attribute, 
    //and append it to <li> element  
    var inputKind = document.createElement("INPUT");
    inputKind.setAttribute("type", "text");
    inputKind.setAttribute("id", idAttributKind);
    inputKind.setAttribute("name", nameAttributKind);
    li.appendChild(inputKind);

    //add created <li> element with its child elements 
    //(label and input) to myList (<ul>) element
    document.getElementById("myList").appendChild(li);

    //show address header
    $("#authorHeader").show();
    }