#!/usr/bin/env python3

# Validate user input
# 1. Username is no more than 12 characters
# 2. Username must not contain spaces
# 3. Username must not contain any digit

username = input("Please enter your username: ")


if len(username) > 12 or username.find(" ") >= 1 or username.isalpha() == False:
    print("Username is invalid!")