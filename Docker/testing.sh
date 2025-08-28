name(){
    #input and passing the variable as nom
    read -p "Please enter your name: " nom

    #print the string with the variable
    echo "My name is $nom"
}

#call the function
name
