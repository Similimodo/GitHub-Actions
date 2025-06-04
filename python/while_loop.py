#!/usr/bin/env python3

# While Loop = Executes some code WHILE some conditions remains TRUE

def naming():
    name = input("Please Enter your name: ")

    # if name == "":
    #     print("You did not enter your name")
    # else:
    #     index = name.index(" ")
    #     firstname = name[:index]
    #     lastname  = name[index +1: ]
    #     print(f"Hello your firstname is: {firstname} and your lastname is: {lastname}")

    # Rewrite this using While Loop
    while name == "":
        print("You did not enter your name")
        name = input("Please Enter your name: ")


    index = name.index(" ")
    firstname = name[:index]
    lastname  = name[index +1: ]
    print(f"Hello your firstname is: {firstname} and your lastname is: {lastname}")


def how_old():
    age =  int(input("Please Enter your age: "))

    while age <= 0:
        print("Age can't be negative!")
        age =  int(input("Please Enter your age: "))

    print(f"You are {age}years old.")


def foodie():
    food = input("Enter the food you like (press q to quit): ")

    while not food == "q":
        print(f"You like {food}!")
        food = input("Enter another food you like (press q to quit): ")

    print("Bye Bye!")


def between_nums():
    number = int(input("Enter number between 1 to 10: "))

    while number < 1 or number > 10:
        print("Invalid number, number must be between 1 and 10")
        number = int(input("Enter number between 1 to 10: "))

    print(f"Your number is {number}")

between_nums()
foodie()
naming()
how_old()