/*
    Name validation:
    Name must not contains any number.
*/
function nameValidation(name){
    var letters = /^[A-Za-z]+$/;
    if(!letters.test(name)){
        return true;
    }
    return false;
}

function firstNameValidate(){
    var firstName = document.getElementById("first-name").value;
    if(nameValidation(firstName)){
        alert("Name does not contains numbers.");
        document.getElementById("first-name").value = "";        
    }
}

function middleNameValidate(){
    var middleName = document.getElementById("middle-name").value;
    if(nameValidation(middleName)){
        alert("Name does not contains numbers.");
        document.getElementById("middle-name").value = "";        
    }
}

function lastNameValidate(){
    var lastName = document.getElementById("last-name").value;
    if(nameValidation(lastName)){
        alert("Name does not contains numbers.");
        document.getElementById("last-name").value = "";
    }
}

function addressValidation(){
    var address = document.getElementById("postal-address").value;
    if(address.length < 20){
        alert(" Addresss must contains 20 characters");
        document.getElementById("postal-address").value = "";
    }
}

function cityValidation(){
    var city = document.getElementById("city").value;
        if(nameValidation(city)){
        alert("City does not contains numbers.");
        document.getElementById("city").value = "";
    }
}

function pinCodeValidation(){
    var pincode = document.getElementById("pincode").value;
    var errMsg = "";
    var letters = /^[A-Za-z]+$/;

    if(pincode.length < 6){
        errMsg = "Pin code must the 6 digit.";
    } else if(letters.test(pincode)){
        errMsg = "Pincode does not contains alphanumeric characters.";
    } else if(parseInt(pincode) < 0 || parseInt(pincode) == 0){
        errMsg = "Pincode cannot be <= 0.";
    }
    if(errMsg != ""){
        alert(errMsg);
        document.getElementById("pincode").value = "";
    }
}

function emailValidation(){
    var email = document.getElementById("email").value;
    var atpos = email.indexOf("@");
    var dotpos = email.lastIndexOf(".");
    if (atpos < 1 || dotpos < atpos+2 || dotpos+2 >= email.length) {
        alert("Not a valid e-mail address");
        document.getElementById("email").value = "";
        return false;
    }
}

function writeToUsValidation(){
    var address = document.getElementById("write-to-us").value;
    if(address.length < 20){
        alert(" Addresss must contains 20 characters");
        document.getElementById("write-to-us").value = "";
    }
}
