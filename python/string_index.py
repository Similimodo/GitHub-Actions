#!/usr/bin/env python3

# indexing = accessing elements of a sequence using [] (Indexing operator) [start: end: step]

credit_card = "1234-5678-9101-1121"
# print(credit_card[0]) # gets the first character of the array
# print(credit_card[0:4]) # Uses the start and end index operator to pick first 4 numbers
# print(credit_card[5:9]) # Uses the start and end index operator to pick second 4 numbers
# print(credit_card[10:14]) # Uses the start and end index operator to pick third 4 numbers
# print(credit_card[5:]) # Uses the start and end index operator to pick from second 4 numbers to the end of the array


# Using the negative number to get the index from the last to the first
# print(credit_card[-1]) #  # gets the last character of the array

# # Using the step index operator 
# print(credit_card[::2]) # gets every second character of the array
# print(credit_card[::3]) # gets every third character of the array

# Exercise create a program that prints the last four digits of a credit card number
last_four = credit_card[15:]
print(f"Your credit card is XXXX-XXXX-XXXX-{last_four}")

# Exercise create a program that prints the reversed digits of a credit card number
reversed_credit_card = credit_card[::-1]
print(f"Your reversed credit card number is {reversed_credit_card}")
