#!/usr/bin/env python3
# Formula X if condition else Y


num = float(input("Please enter number: "))
a = 9
b = 8
age = int(input("Please enter your age: "))
weather = int(input("Please enter your weather: "))
user_role = "Admin"


print("Positive" if num > 0 else "Negative") # Checks for positive or negative number

print("Even" if num % 2 == 0 else "Odd")  # Checks Even or Odd number

max_num = a if a > b else b    # Maximum number
print(f"The maximum number is {max_num}")

min_num = a if a < b else b
print(f"The minimum number is {min_num}")

status = "Adult" if age >= 18 else "Child"
print(f"The status based on your age input is {status}")

weather_condition = "Hot" if weather > 20 else "Cold"
print(f"The status based on your weather input is {weather_condition}")

access = "Full access" if user_role == "Admin" else "Limited access"
print(f"The status based on your user role is {access}")