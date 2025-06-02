#!usr/bin/env python3
# Logical Operator = used on conditional statements

#         AND = Checks if two or more conditions is True
#         OR = Checks if one condition is True
#         NOT = True if the condition is False, and vice versa

unit = input("Please enter the temperature in Celsius or Fahrenheit (C/F): ")
temp = float(input("Enter the temperature: "))

if unit == "C" or unit == "c":  # logical operator OR at work
    if temp > 0 and temp < 30:  # logical operator AND at work
        print(f"The temperature is good at {temp}'C")
    else:
        print(f"The temperature is bad at {temp}'C")

elif unit == "F" or unit == "f":  # logical operator OR at work
    if temp > 32 and temp < 86:  # logical operator AND at work
        print(f"The temperature is good at {temp}'F")
    else:
        print(f"The temperature is bad at {temp}'F")

sunny = bool(input("Enter True or False: "))

if not sunny:
    print("Its cloudy outside")
else:
    print("Its sunny outside")

