#!/usr/bin/env python3
name = input("Please enter your full name: ")

print(len(name)) # length of the name variable
print(name.find(" ")) # find the first occurrence of a letter in the string
print(name.rfind(" ")) # find the last occurrence of a letter in the string
print(name.capitalize()) # Capitalizes the first letter of the word
print(name.upper()) # Capitalizes every letter of the word
print(name.lower()) # lowers every letter of the word
print(name.isdigit()) # Checks if the word has only digits as characters. Returns a Bool
print(name.isalpha()) # Checks if the word has only strings as characters. Returns a Bool

phone_number = input("Please enter your phone nunber: ")
print(phone_number.count("-")) # Checks how many times a character appaered in the input. Returns a number
print(phone_number.replace("-", "")) # replaces a character in the input.

