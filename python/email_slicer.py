#!/usr/bin/env python3

email = input("Please enter your email: ")

index = email.index("@")

username = email[:index] # Returns every character before the indexing
domain   = email[index + 1:] # Returns the character from the index to the last character

print(f"Your username is {username}")
print(f"Your domain is {domain}")


# Exercise find first and lastname of a given name

name = input("Please enter first and last name: ")

index = name.index(" ")

firstname = name[:index]
lastname = name[index +1: ]
print(f"Your first name is {firstname}")
print(f"Your last name is {lastname}")